import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';

const typeDefs = `#graphql
  # Comments in GraphQL strings (such as this one) start with the hash (#) symbol.

  interface MutationResponse {
    code: String!
    success: Boolean!
    message: String!
  }

  type Listing {
    mlsStatus: String
    price: Int
    sqft: Int
    pricePerSqFt: Int
    lotSize: Int
    beds: Float
    baths: Float
    fullBaths: Float
    partialBaths: Float
    streetLine: String!
    stories: Float
    city: String!
    state: String!
    zip: String!
    soldDate: Int
    propertyType: Int
    yearBuilt: Int
    timeZone: String
    url: String!
    location: String
    propertyId: Int!
    listingId: Int!
    latitude: Float
    longitude: Float
    mlsId: String!
    hoa: Int
  }

  input ListingInput {
    mlsStatus: String
    price: Int
    sqft: Int
    pricePerSqFt: Int
    lotSize: Int
    beds: Float
    baths: Float
    fullBaths: Float
    partialBaths: Float
    streetLine: String!
    stories: Float
    city: String!
    state: String!
    zip: String!
    soldDate: Int
    propertyType: Int
    yearBuilt: Int
    timeZone: String
    url: String!
    location: String
    propertyId: Int!
    listingId: Int!
    latitude: Float
    longitude: Float
    mlsId: String!
    hoa: Int
  }

  type Stat {
    "Fields that you can retrieve from a stat object."
    medianPrice: Float
    modePrice: Int
    averagePrice: Float
    city: String
    state: String
    zip: String
    beds: Float
    baths: Float
    averagePricePerSqFt: Float
    modePricePerSqFt: Int
    medianPricePerSqFt: Float
    averageSqFt: Float
    modeSqFt: Int
    medianSqFt: Float
    averageLotSize: Float
    modeLotSize: Int
    medianLotSize: Float
    averageBeds: Float
    medianBeds: Float
    modeBeds: Int
    averageBaths: Float 
    medianBaths: Float
    modeBaths: Int
    averageHoa: Float
    medianHoa: Float
    modeHoa: Int
    averageYearBuilt: Float
    medianYearBuilt: Float
    modeYearBuilt: Int
    curDateUtc: String
  }

  input StatInput {
    "Fields responsible for creating a new stat object."
    medianPrice: Float
    modePrice: Int
    averagePrice: Float
    city: String
    state: String
    zip: String
    beds: Float
    baths: Float
    averagePricePerSqFt: Float
    modePricePerSqFt: Int
    medianPricePerSqFt: Float
    averageSqFt: Float
    modeSqFt: Int
    medianSqFt: Float
    averageLotSize: Float
    modeLotSize: Int
    medianLotSize: Float
    averageBeds: Float
    medianBeds: Float
    modeBeds: Int
    averageBaths: Float 
    medianBaths: Float
    modeBaths: Int
    averageHoa: Float
    medianHoa: Float
    modeHoa: Int
    averageYearBuilt: Float
    medianYearBuilt: Float
    modeYearBuilt: Int
    curDateUtc: String
  }

  type Query {
    listings: [Listing]
    stats: [Stat]
  }

  type AddListingMutationResponse implements MutationResponse {
    code: String!
    success: Boolean!
    message: String!
    listing: Listing
  }

  type AddStatMutationResponse implements MutationResponse {
    code: String!
    success: Boolean!
    message: String!
    stat: Stat
  }

  type Mutation {
    addListing(listing: ListingInput!): Listing!
    addListings(listings: [ListingInput!]!): [Listing!]!
    addStat(stat: StatInput!): Stat!
    addStats(stats: [StatInput!]!): [Stat!]!
  }
`;

const jsonData = [
    {
        mlsStatus: 'Active',
        price: 334974,
        sqft: 1279,
        pricePerSqFt: 157,
        lotSize: 9927,
        beds: 3,
        baths: 2.5,
        fullBaths: 2, 
        partialBaths: 1,
        streetLine: 'Holiday',
        stories: 2,
        city: 'Arnold',
        state: 'MO',
        zip: 63010,
        soldDate: null,
        propertyType: 6,
        yearBuilt: 1978,
        timeZone:'US/Central',
        url:'url',
        location: 'Valley at Winding Bluffs',
        propertyId:183485426,
        listingId:164146978,
        latitude:38.4692,
        longitude:-90.46247,
        mlsId:22078812,
        hoa: 15
    }
  ];

// Resolvers define how to fetch the types defined in your schema.
// This resolver retrieves books from the "books" array above.
const resolvers = {
    Query: {
        listings: () => jsonData,
    },
  };


// The ApolloServer constructor requires two parameters: your schema
// definition and your set of resolvers.
const server = new ApolloServer({
    typeDefs,
    resolvers,
  });
  
  // Passing an ApolloServer instance to the `startStandaloneServer` function:
  //  1. creates an Express app
  //  2. installs your ApolloServer instance as middleware
  //  3. prepares your app to handle incoming requests
  const { url } = await startStandaloneServer(server, {
    listen: { port: 4000 },
  });
  
  console.log(`🚀  Server ready at: ${url}`);

