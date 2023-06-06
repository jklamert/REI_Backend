import type { MutationResolvers } from "./../../../types.generated";
export const addStat: NonNullable<MutationResolvers["addStat"]> = async (
  _parent,
  _arg,
  _ctx
) => {
  /* Implement Mutation.addStat resolver logic here */
  return await _ctx.dataSources.statAPI.addStat({
    _arg,
  });
};
