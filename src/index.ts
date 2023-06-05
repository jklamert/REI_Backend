import * as dotenv from 'dotenv' // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import
dotenv.config()
import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';
import { ApolloServerErrorCode } from '@apollo/server/errors';

import { ListingDataSource, StatDataSource } from './dataSource.js';
import { readFileSync } from 'fs';
import resolvers from './resolvers/index.js';
import {
  ApolloServerPluginLandingPageLocalDefault,
  ApolloServerPluginLandingPageProductionDefault,
} from '@apollo/server/plugin/landingPage/default';

// Note: this uses a path relative to the project's
// root directory, which is the current working directory
// if the server is executed using `npm run`.
const typeDefs = readFileSync('./schema.graphql', { encoding: 'utf-8' });

  export interface MyContext {
    // Context typing
    listen?: Object;
    token?: String;
    dataSources: {
      listingAPI: ListingDataSource;
      statAPI: StatDataSource;
    };
  }

// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer<MyContext>({
    typeDefs: typeDefs,
    resolvers: resolvers,
    formatError: (formattedError, error) => {
      console.error(error);
      if (
        formattedError.extensions.code ===
        ApolloServerErrorCode.GRAPHQL_VALIDATION_FAILED
      ) {
        return {
          ...formattedError,
          message: "Your query doesn't match the schema. Try double-checking it!",
        };
      }

      return formattedError;
    },
    plugins: [
      process.env.NODE_ENV === 'production'
        ? ApolloServerPluginLandingPageProductionDefault()
        : ApolloServerPluginLandingPageLocalDefault({ embed: false }),
    ],
  });
  


  const { url } = await startStandaloneServer(server, {
    context: async function ({ req }) {

      // try to retrieve a user with the token
      const user = null//getUser(token);

      // optionally block the user
      // we could also check user roles/permissions here
      // if (!user){
      //   // throwing a `GraphQLError` here allows us to specify an HTTP status code,
      //   // standard `Error`s will have a 500 status code by default
      //   throw new GraphQLError('User is not authenticated', {
      //     extensions: {
      //       code: 'UNAUTHENTICATED',
      //       http: { status: 401 },
      //     },
      //   });
      // }
      
      return {
      listen: {port: 4000},
      token: req.headers.authorization || '',
      dataSources: {
        listingAPI: await ListingDataSource.initialize(),
        statAPI: new StatDataSource()
      }}
    },
  });

  console.log(`🚀  Server ready at: ${url}`);

