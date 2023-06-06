import type { MutationResolvers } from "./../../../types.generated";
export const addListing: NonNullable<MutationResolvers["addListing"]> = async (
  _parent,
  _arg,
  _ctx
) => {
  /* Implement Mutation.addListing resolver logic here */
  return await _ctx.dataSources.listingAPI.addListing({
    _arg,
  });
};
