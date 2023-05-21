import { QueryResolvers } from '../generated/graphql';

// Use the generated `QueryResolvers` type to type check our queries!
const queries: QueryResolvers = {
    listings: async (_, __, contextValue) => {
      return await contextValue.dataSources.listingAPI.getListings();
    },
};

export default queries;