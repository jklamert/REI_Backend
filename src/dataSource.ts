import {
  AddListingMutationResponse,
  Listing,
  ListingInput,
  StatInput,
  Stat,
  AddStatMutationResponse,
} from "./generated/graphql";
import { getClient } from "../connectionProvider";

export class ListingDataSource {
  client = null;

  private constructor(client) {
    this.client = client;
  }

  static async initialize() {
    const client = await getClient();
    return new ListingDataSource(client);
  }

  async getListings(): Promise<Listing[]> {
    if (!this.client) {
      throw new Error("Listing Data Source has not been initialized!");
    }
    const getDistinctCityQueryString = `SELECT * FROM Listing;`;
    const res = await this.client.query(getDistinctCityQueryString);
    const rows = res.rows;
    return rows;
  }

  // We are using a static data set for this small example, but normally
  // this Mutation would *mutate* our underlying data using a database
  // or a REST API.
  async addListing(listing: ListingInput): Promise<AddListingMutationResponse> {
    // this.listings.push(listing);
    // console.log(this.listings);

    return {
      code: "200",
      success: true,
      message: "New listings added!",
      listing: {
        mlsId: "1",
        city: "arnold",
        state: "mo",
        listingId: 123,
        propertyId: 123,
        zip: "63010",
        streetLine: "Street",
        url: "http://google.com",
      },
    };
  }
}

export class StatDataSource {
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
  stats: {
    medianPrice?: number;
    modePrice?: number;
    averagePrice?: number;
    city?: string;
    state?: string;
    zip?: string;
    beds?: number;
    baths?: number;
    averagePricePerSqFt?: number;
    modePricePerSqFt?: number;
    medianPricePerSqFt?: number;
    averageSqFt?: number;
    modeSqFt?: number;
    medianSqFt?: number;
    averageLotSize?: number;
    modeLotSize?: number;
    medianLotSize?: number;
    averageBeds?: number;
    medianBeds?: number;
    modeBeds?: number;
    averageBaths?: number;
    medianBaths?: number;
    modeBaths?: number;
    averageHoa?: number;
    medianHoa?: number;
    modeHoa?: number;
    averageYearBuilt?: number;
    medianYearBuilt?: number;
    modeYearBuilt?: number;
    curDateUtc?: string;
  }[] = [
    {
      medianPrice: 125000,
      modePrice: 80000,
      averagePrice: 105000,
      city: "St. Louis",
      state: "MO",
      zip: "63111",
      beds: 2,
      baths: 2,
      averagePricePerSqFt: 125,
      modePricePerSqFt: 110,
      medianPricePerSqFt: 115,
      averageSqFt: 1025,
      modeSqFt: 2,
      medianSqFt: 2,
      averageLotSize: 2,
      modeLotSize: 2,
      medianLotSize: 2,
      averageBeds: 2,
      medianBeds: 2,
      modeBeds: 2,
      averageBaths: 2,
      medianBaths: 2,
      modeBaths: 2,
      averageHoa: 2,
      medianHoa: 2,
      modeHoa: 2,
      averageYearBuilt: 2,
      medianYearBuilt: 2,
      modeYearBuilt: 2,
      curDateUtc: "2022-06-21",
    },
  ];

  async getStats(): Promise<Stat[]> {
    // simulate fetching a list of books
    const client = await getClient();
    const getDistinctCityQueryString = `SELECT * FROM Stats;`;
    const res = await client.query(getDistinctCityQueryString);
    const rows = res.rows;
    return rows;
  }

  // We are using a static data set for this small example, but normally
  // this Mutation would *mutate* our underlying data using a database
  // or a REST API.
  async addStat(stat: StatInput): Promise<AddStatMutationResponse> {
    this.stats.push(stat);
    console.log(this.stats);

    return {
      code: "200",
      success: true,
      message: "New stats added!",
      stat: this.stats[this.stats.length - 1],
    };
  }
}
