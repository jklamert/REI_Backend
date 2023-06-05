import { MyContext } from '..';
import { QueryResolvers, Listing, Stat } from '../generated/graphql';

// Use the generated `QueryResolvers` type to type check our queries!
const queries: QueryResolvers = {
    listings: async (parent, args, contextValue: MyContext, info) : Promise<Listing[]> => {
      console.debug("Context: ", parent, args, contextValue);
      return await contextValue.dataSources.listingAPI.getListings();
    },
    stats: async(parent, args, contextValue, info) : Promise<Stat[]> => {
      console.debug("Context: ", parent, args, contextValue);
      // return 'String here';
      return await contextValue.dataSources.statAPI.getStats();  
    }
};

export default queries;