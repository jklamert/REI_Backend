import { MutationResolvers } from "../generated/graphql";

// to type check our mutations!
// Use the generated `MutationResolvers` type to type check our mutations!
const mutations: MutationResolvers = {
  Mutation: {
    addListing: async (
      _,
      {
        mlsId,
        mlsStatus,
        price,
        sqft,
        pricePerSqFt,
        lotSize,
        beds,
        baths,
        fullBaths,
        partialBaths,
        streetLine,
        stories,
        city,
        state,
        zip,
        soldDate,
        propertyType,
        yearBuilt,
        timeZone,
        url,
        location,
        propertyId,
        listingId,
        latitude,
        longitude,
        hoa,
      },
      { dataSources }
    ) => {
      return await dataSources.listingAPI.addListing({
        mlsId,
        mlsStatus,
        price,
        sqft,
        pricePerSqFt,
        lotSize,
        beds,
        baths,
        fullBaths,
        partialBaths,
        streetLine,
        stories,
        city,
        state,
        zip,
        soldDate,
        propertyType,
        yearBuilt,
        timeZone,
        url,
        location,
        propertyId,
        listingId,
        latitude,
        longitude,
        hoa,
      });
    },
  },
};

export default mutations;
