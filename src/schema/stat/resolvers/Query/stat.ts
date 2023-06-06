import type { QueryResolvers } from "./../../../types.generated";
export const stat: NonNullable<QueryResolvers["stat"]> = async (
  _parent,
  _arg,
  _ctx
) => {
  /* Implement Query.stat resolver logic here */
  return await _ctx.dataSources.statAPI.getStats();
};
