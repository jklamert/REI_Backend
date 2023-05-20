import { QueryResolvers } from '../generated/graphql';

// Use the generated `QueryResolvers` type to type check our queries!
const queries: QueryResolvers = {
  Query: {
    // Our third argument (`contextValue`) has a type here, so we
    // can check the properties within our resolver's shared context value.
    listings: async (_, __, contextValue) => {
      return await contextValue.dataSources.listingAPI.getListings();
    },
  },
};

export default queries;