import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';
import { ApolloServerErrorCode } from '@apollo/server/errors';
import { DataSource } from './dataSource.js';

import { readFileSync } from 'fs';

// Note: this uses a path relative to the project's
// root directory, which is the current working directory
// if the server is executed using `npm run`.
const typeDefs = readFileSync('./schema.graphql', { encoding: 'utf-8' });


const jsonData = [
    {
        mlsStatus: 'Active',
        price: 334974,
        sqft: 1279,
        pricePerSqFt: 157,
        lotSize: 9927,
        beds: 3,
        baths: 2.5,
        fullBaths: 2, 
        partialBaths: 1,
        streetLine: 'Holiday',
        stories: 2,
        city: 'St. Louis',
        state: 'MO',
        zip: 63011,
        soldDate: null,
        propertyType: 6,
        yearBuilt: 1978,
        timeZone:'US/Central',
        url:'url',
        location: 'Valley at Winding Bluffs',
        propertyId:183485426,
        listingId:164146978,
        latitude:38.4692,
        longitude:-90.46247,
        mlsId:22078812,
        hoa: 15
    }
  ];

// Resolvers define how to fetch the types defined in your schema.
// This resolver retrieves books from the "books" array above.
const resolvers = {
    Query: {
        // listings: () => jsonData,
        listings(parent, args, contextValue, info) {
          return 
          // users.find((user) => user.id === args.id);
        },
    },
    
  };

  interface MyContext {
    // Context typing
    token?: String;
    dataSources: {
      connector: DataSource;
    };
  }

// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer<MyContext>({
    typeDefs,
    resolvers,
    formatError: (formattedError, error) => {
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
  });
  

  const { url } = await startStandaloneServer(server, {
    context: async ({ req }) => ({
      listen: {port: 4000},
      token: null,//getToken(req.headers.authentication),
      dataSources: {
        connector: new DataSource({token: null}),
      },
    }),
  });

  console.log(`🚀  Server ready at: ${url}`);

