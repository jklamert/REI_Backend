import { AddListingMutationResponse, Listing } from './generated/graphql';

export class ListingDataSource {
  // Our example static data set
//   mlsStatus: String
//   price: Int
//   sqft: Int
//   pricePerSqFt: Int
//   lotSize: Int
//   beds: Float
//   baths: Float
//   fullBaths: Float
//   partialBaths: Float
//   streetLine: String!
//   stories: Float
//   city: String!
//   state: String!
//   zip: String!
//   soldDate: Int
//   propertyType: Int
//   yearBuilt: Int
//   timeZone: String
//   url: String!
//   location: String
//   propertyId: Int!
//   listingId: Int!
//   latitude: Float
//   longitude: Float
//   mlsId: String!
//   hoa: Int
  listings: { mlsId: string, mlsStatus?: string, price?: number, 
    sqft?: number, pricePerSqFt?: number, lotSize?: number, beds?: number, 
    baths?: number, fullBaths?: number, partialBaths?: number, streetLine: string, stories?: number, city: string, state: string, zip: string, soldDate?: number,
    propertyType?: number, yearBuilt?: number,
    timeZone?: string, url: string, location?: string, propertyId: number, listingId: number, latitude?: number, longitude?: number,
    hoa?: number  }[] = [
    {
        mlsId:'22078812',
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
        city: 'St. Louis',
        state: 'MO',
        zip: '63011',
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
        hoa: 15
    }
  ];

  getListings(): Listing[] {
    // simulate fetching a list of books
    return this.listings;
  }

  // We are using a static data set for this small example, but normally
  // this Mutation would *mutate* our underlying data using a database
  // or a REST API.
  async addListing(listing: Listing): Promise<AddListingMutationResponse> {
    this.listings.push(listing);
    console.log(this.listings);

    return {
      code: '200',
      success: true,
      message: 'New listings added!',
      listing: this.listings[this.listings.length - 1],
    };
  }
}