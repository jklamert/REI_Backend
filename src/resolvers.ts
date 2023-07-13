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
    searches: async (_, args, contextValue) => {
      const { city, state } = args;
      return await contextValue.dataSources.searchAPI.getSearches(city, state);
    },
    search: async (_, args, contextValue) => {
      return await contextValue.dataSources.searchAPI.getSearch(args.id);
    },
    expense: async (_, args, contextValue) => {
      return await contextValue.dataSources.expenseAPI.getExpense(args.id);
    },
    user: async (_, args, contextValue) => {
      return await contextValue.dataSources.userAPI.getUser(args.id);
    },
    userByName: async (_, args, contextValue) => {
      return await contextValue.dataSources.userAPI.getUserByName(args.name);
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
    addSearch: async (parent, args, contextValue) => {
      return await contextValue.dataSources.searchAPI.addSearch(args.search);
    },
    updateSearch: async (parent, args, contextValue) => {
      return await contextValue.dataSources.searchAPI.updateSearch(args.search);
    },
    addUser: async (parent, args, contextValue) => {
      return await contextValue.dataSources.userAPI.addUser(args.user);
    },
    addExpense: async (parent, args, contextValue) => {
      return await contextValue.dataSources.expenseAPI.addExpense(args.expense);
    },
    updateExpense: async (parent, args, contextValue) => {
      return await contextValue.dataSources.expenseAPI.updateExpense(
        args.expense
      );
    },
  },
  // Expense: async (parent, args, contextValue) => {
  //   console.debug("Expense args: ", args);
  //   const { id } = args;
  //   return await contextValue.dataSources.expenseAPI.getExpense(args.id);
  // },
};
