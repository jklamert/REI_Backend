/* This file was automatically generated. DO NOT UPDATE MANUALLY. */
    import type   { Resolvers } from './types.generated';
    import    { AddListingMutationResponse } from './listing/resolvers/AddListingMutationResponse';
import    { AddStatMutationResponse } from './stat/resolvers/AddStatMutationResponse';
import    { Listing } from './listing/resolvers/Listing';
import    { addListing as Mutation_addListing } from './listing/resolvers/Mutation/addListing';
import    { addStat as Mutation_addStat } from './stat/resolvers/Mutation/addStat';
import    { listing as Query_listing } from './listing/resolvers/Query/listing';
import    { stat as Query_stat } from './stat/resolvers/Query/stat';
import    { Stat } from './stat/resolvers/Stat';
import    { DateTimeResolver } from 'graphql-scalars';
    export const resolvers: Resolvers = {
      Query: { listing: Query_listing,stat: Query_stat },
      Mutation: { addListing: Mutation_addListing,addStat: Mutation_addStat },
      
      AddListingMutationResponse: AddListingMutationResponse,
AddStatMutationResponse: AddStatMutationResponse,
Listing: Listing,
Stat: Stat,
DateTime: DateTimeResolver
    }