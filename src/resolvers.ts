// This is the file where our generated types live
// (specified in our `codegen.yml` file)
import { MyContext } from ".";
import { Resolvers } from "./__generated__/resolvers-types";
export const resolvers: Resolvers = {
  Query: {
    listing: async (_parent, _arg, _context: MyContext) => {
      return await _context.dataSources.listingAPI.getListing();
    },
    numberSix() {
      return 6;
    },
    // stat: async (_parent, _arg, _context: MyContext) => {
    //     return await _context.dataSources.statAPI.getStats();
    //   },
  },
};
