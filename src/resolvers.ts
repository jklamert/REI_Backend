// This is the file where our generated types live
// (specified in our `codegen.yml` file)
import { MyContext } from ".";
import { Resolvers } from "./__generated__/resolvers-types";
export const resolvers: Resolvers = {
  Query: {
    listing: async (parent, args, contextValue, info) => {
      return await contextValue.dataSources.listingAPI.getListing(
        args.listingId
      );
    },
    stats: async (parent, args, contextValue, info) => {
      const { city, state, curDateUtc } = args;
      return await contextValue.dataSources.statAPI.getStats(
        city,
        state,
        curDateUtc
      );
    },
  },
};
