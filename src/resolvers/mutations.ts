import { MutationResolvers } from "../generated/graphql";

// to type check our mutations!
// Use the generated `MutationResolvers` type to type check our mutations!
const mutations: MutationResolvers = {
    addListing: async (
      _,
      {
        listing
      },
      { dataSources }
    ) => {
      return await dataSources.listingAPI.addListing({
       listing
      });
    },
};

export default mutations;
