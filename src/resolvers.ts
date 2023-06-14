// This is the file where our generated types live
// (specified in our `codegen.yml` file)
import { Resolvers } from "./__generated__/resolvers-types";
export const resolvers: Resolvers = {
  Query: {
    listing: async (_, args, contextValue) => {
      return await contextValue.dataSources.listingAPI.getListing(
        args.listingId
      );
    },
    stats: async (_, args, contextValue) => {
      const { city, state, curDateUtc } = args;
      return await contextValue.dataSources.statAPI.getStats(
        city,
        state,
        curDateUtc
      );
    },
  },
  Mutation: {
    addListing: async (parent, args, contextValue) => {
      return await contextValue.dataSources.listingAPI.addListing(args.listing);
    },
    addStat: async (parent, args, contextValue) => {
      // const { city, state, curDateUtc } = args;
      return await contextValue.dataSources.statAPI.addStat(args.stat);
    },
  },
};
