import {
  AddListingMutationResponse,
  Listing,
  ListingInput,
  StatInput,
  Stat,
  AddStatMutationResponse,
} from "./gql/graphql";
import { getClient } from "../connectionProvider";

export class ListingDataSource {
  client = null;

  private constructor(client) {
    this.client = client;
  }

  private isInitialized() {
    if (!this.client) {
      throw new Error("ListingDataSource object has not been initialized!");
    }
  }

  static async initialize() {
    const client = await getClient();
    return new ListingDataSource(client);
  }

  async getListing(): Promise<Listing> {
    this.isInitialized();
    return {
      mlsId: "1",
      city: "arnold",
      state: "mo",
      listingId: 123,
      propertyId: 123,
      zip: "63010",
      streetLine: "Street",
      url: "https://google.com",
    };

    const getDistinctCityQueryString = `SELECT * FROM Listing;`;
    const res = await this.client.query(getDistinctCityQueryString);
    const rows = res.rows;
    return rows[0];
  }

  // We are using a static data set for this small example, but normally
  // this Mutation would *mutate* our underlying data using a database
  // or a REST API.
  async addListing(listing: ListingInput): Promise<AddListingMutationResponse> {
    // this.listings.push(listing);
    // console.log(this.listings);
    this.isInitialized();
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
        url: "https://google.com",
      },
    };
  }
}

export class StatDataSource {
  client = null;
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

  private constructor(client) {
    this.client = client;
  }

  static async initialize() {
    const client = await getClient();
    return new StatDataSource(client);
  }

  private isInitialized() {
    if (!this.client) {
      throw new Error("Stat object has not been initialized!");
    }
  }

  async getStats(): Promise<Stat[]> {
    this.isInitialized();

    const getDistinctCityQueryString = `SELECT * FROM Stats;`;
    const res = await this.client.query(getDistinctCityQueryString);
    const rows = res.rows;
    return rows;
  }

  async addStat(stat: StatInput): Promise<AddStatMutationResponse> {
    this.isInitialized();
    return {
      code: "200",
      success: true,
      message: "New stats added!",
      stat: {
        city: "arnold",
        state: "MO",
      },
    };
  }
}
