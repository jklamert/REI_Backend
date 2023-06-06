import type { QueryResolvers } from "./../../../types.generated";
export const listing: NonNullable<QueryResolvers["listing"]> = async (
  _parent,
  _arg,
  _ctx
) => {
  /* Implement Query.listing resolver logic here */
  console.debug("Context: ", _parent, _arg, _ctx);
  return await _ctx.dataSources.listingAPI.getListing();
};
