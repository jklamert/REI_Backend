import {
  AddListingMutationResponse,
  Listing,
  ListingInput,
  StatInput,
  Stat,
  AddStatMutationResponse,
} from "./__generated__/resolvers-types";

import pg, { PoolClient } from "pg";
const { Pool } = pg;

const pool = new Pool({
  max: 20,
  database: process.env.DATABASE,
  host: process.env.DATABASE_HOST,
  password: process.env.DATABASE_PASSWORD,
  user: process.env.DATABASE_USER,
  port: 5432,
  idleTimeoutMillis: 30000,
});
pool.on("error", (err: Error, client: PoolClient) => {
  console.error(err);
});

export class ListingDataSource {
  async getListing(listingId: number): Promise<Listing> {
    const getListingsQueryString = `SELECT * FROM Listing WHERE "listingId" = $1;`;
    const res = await pool.query(getListingsQueryString, [listingId]);
    const rows = res.rows;
    return rows[0];
  }

  // We are using a static data set for this small example, but normally
  // this Mutation would *mutate* our underlying data using a database
  // or a REST API.
  async addListing(listing: ListingInput): Promise<AddListingMutationResponse> {
    const {
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
      mlsId,
      hoa,
    } = listing;
    const insertQuery = `INSERT INTO public.listing(
      "mlsStatus", price, sqft, "pricePerSqFt", "lotSize", beds, baths, "fullBaths", "partialBaths", "streetLine", stories, city, state, zip, "soldDate", "propertyType", "yearBuilt", "timeZone", url, location, "propertyId", "listingId", latitude, longitude, "mlsId", hoa)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26) RETURNING *;`;
    const res = await pool.query(insertQuery, [
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
      mlsId,
      hoa,
    ]);

    return {
      code: "200",
      success: true,
      message: "New listing added!",
      listing: res.rows[0],
    };
  }
}

export class StatDataSource {
  async getStats(city, state, curDateUtc): Promise<Stat[]> {
    const getDistinctCityQueryString = `SELECT * FROM Stats WHERE city = $1 AND state = $2 AND "curDateUtc" = $3;`;
    const res = await pool.query(getDistinctCityQueryString, [
      city,
      state,
      curDateUtc,
    ]);
    const rows = res.rows;
    return rows;
  }

  async addStat(stat: StatInput): Promise<AddStatMutationResponse> {
    const {
      medianPrice,
      modePrice,
      averagePrice,
      city,
      state,
      zip,
      beds,
      baths,
      averagePricePerSqFt,
      modePricePerSqFt,
      medianPricePerSqFt,
      averageSqFt,
      modeSqFt,
      medianSqFt,
      averageLotSize,
      modeLotSize,
      medianLotSize,
      averageBeds,
      medianBeds,
      modeBeds,
      averageBaths,
      medianBaths,
      modeBaths,
      averageHoa,
      medianHoa,
      modeHoa,
      averageYearBuilt,
      medianYearBuilt,
      modeYearBuilt,
      curDateUtc,
    } = stat;
    const addStatQuery = `INSERT INTO public.stats(
      "medianPrice", "modePrice", "averagePrice", city, state, zip, beds, baths, "averagePricePerSqFt", "modePricePerSqFt", "medianPricePerSqFt", "averageSqFt", "modeSqFt", "medianSqFt", "averageLotSize", "modeLotSize", "medianLotSize", "averageBeds", "medianBeds", "modeBeds", "averageBaths", "medianBaths", "modeBaths", "averageHoa", "medianHoa", "modeHoa", "averageYearBuilt", "medianYearBuilt", "modeYearBuilt", "curDateUtc")
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30) RETURNING *;`;
    const res = await pool.query(addStatQuery, [
      medianPrice,
      modePrice,
      averagePrice,
      city,
      state,
      zip,
      beds,
      baths,
      averagePricePerSqFt,
      modePricePerSqFt,
      medianPricePerSqFt,
      averageSqFt,
      modeSqFt,
      medianSqFt,
      averageLotSize,
      modeLotSize,
      medianLotSize,
      averageBeds,
      medianBeds,
      modeBeds,
      averageBaths,
      medianBaths,
      modeBaths,
      averageHoa,
      medianHoa,
      modeHoa,
      averageYearBuilt,
      medianYearBuilt,
      modeYearBuilt,
      curDateUtc,
    ]);
    return {
      code: "200",
      success: true,
      message: "New stat added!",
      stat: res.rows[0],
    };
  }
}
