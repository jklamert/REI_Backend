import {
  AddListingMutationResponse,
  Listing,
  ListingInput,
  StatInput,
  Stat,
  AddStatMutationResponse,
} from "./__generated__/resolvers-types";

import pg from "pg";
const { Pool } = pg;

async function getPool() {
  return new Pool({
    max: 20,
    connectionString: `postgres://${process.env.DATABASE_USER}:${process.env.DATABASE_PASSWORD}@${process.env.DATABASE_HOST}:5432/${process.env.DATABASE}`,
    idleTimeoutMillis: 30000,
  });
}

export class ListingDataSource {
  async getListing(listingId: number): Promise<Listing> {
    const poolObj = await getPool();
    const getListingsQueryString = `SELECT * FROM Listing WHERE "listingId" = $1;`;
    const res = await poolObj.query(getListingsQueryString, [listingId]);
    const rows = res.rows;
    return rows[0];
  }

  // We are using a static data set for this small example, but normally
  // this Mutation would *mutate* our underlying data using a database
  // or a REST API.
  async addListing(listing: ListingInput): Promise<AddListingMutationResponse> {
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
  async getStats(city, state, curDateUtc): Promise<Stat[]> {
    const poolObj = await getPool();
    const getDistinctCityQueryString = `SELECT * FROM Stats WHERE city = $1 AND state = $2 AND "curDateUtc" = $3;`;
    const res = await poolObj.query(getDistinctCityQueryString, [
      city,
      state,
      curDateUtc,
    ]);
    const rows = res.rows;
    return rows;
  }

  async addStat(stat: StatInput): Promise<AddStatMutationResponse> {
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
