import * as dotenv from "dotenv"; // see https://github.com/motdotla/dotenv#how-do-i-use-dotenv-with-import
dotenv.config();
import { ApolloServer } from "@apollo/server";
import { startStandaloneServer } from "@apollo/server/standalone";
import { ApolloServerErrorCode } from "@apollo/server/errors";
import { ListingDataSource, StatDataSource } from "./dataSource.js";
import {
  ApolloServerPluginLandingPageLocalDefault,
  ApolloServerPluginLandingPageProductionDefault,
} from "@apollo/server/plugin/landingPage/default";
import { resolvers } from "./resolvers.js";
import { readFileSync } from "fs";

const typeDefs = readFileSync("./schema.graphql", { encoding: "utf-8" });

export interface MyContext {
  // Context typing
  listen?: Object;
  token?: String;
  dataSources: {
    listingAPI: ListingDataSource;
    statAPI: StatDataSource;
  };
}

const server = new ApolloServer<MyContext>({
  typeDefs: typeDefs,
  resolvers: resolvers,
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
  plugins: [
    process.env.NODE_ENV === "production"
      ? ApolloServerPluginLandingPageProductionDefault()
      : ApolloServerPluginLandingPageLocalDefault({ embed: false }),
  ],
});

const { url } = await startStandaloneServer(server, {
  context: async function ({ req }) {
    // try to retrieve a user with the token
    const user = null; //getUser(token);

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
      listen: { port: 4000 },
      token: req.headers.authorization || "",
      dataSources: {
        listingAPI: new ListingDataSource(),
        statAPI: new StatDataSource(),
      },
    };
  },
});

console.log(`🚀  Server ready at: ${url}`);

// const response = await server.executeOperation({
//   query: "query numberSix {  }",
//   variables: { name: "world" },
// });
// console.log("Response: ", response);
