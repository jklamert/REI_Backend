import {
  AddListingMutationResponse,
  Listing,
  ListingInput,
  StatInput,
  Stat,
  AddStatMutationResponse,
  Search,
  SearchInput,
  AddSearchMutationResponse,
  Expense,
  ExpenseInput,
  AddExpenseMutationResponse,
  User,
  UserInput,
  AddUserMutationResponse,
} from "./__generated__/resolvers-types";

import pg from "pg";
const { Pool } = pg;

async function getPool() {
  const pool = new Pool({
    max: 20,
    database: "test", //process.env.DATABASE,
    host: process.env.DATABASE_HOST,
    password: process.env.DATABASE_PASSWORD,
    user: process.env.DATABASE_USER,
    port: 5432,
    idleTimeoutMillis: 30000,
  });
  pool.on("error", (err: Error) => {
    console.error(err);
  });
  return pool;
}

export class ListingDataSource {
  async getListing(listingId: number): Promise<Listing> {
    const poolObj = await getPool();
    const getListingsQueryString = `SELECT * FROM Listing WHERE "listingId" = $1;`;
    const res = await poolObj.query(getListingsQueryString, [listingId]);
    const rows = res.rows;
    await poolObj.end();
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
    const poolObj = await getPool();
    const res = await poolObj.query(insertQuery, [
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
    await poolObj.end();
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
    const poolObj = await getPool();
    const getDistinctCityQueryString = `SELECT * FROM Stats WHERE city = $1 AND state = $2 AND "curDateUtc" = $3;`;
    const res = await poolObj.query(getDistinctCityQueryString, [
      city,
      state,
      curDateUtc,
    ]);
    const rows = res.rows;
    await poolObj.end();
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
    const poolObj = await getPool();
    const addStatQuery = `INSERT INTO public.stats(
      "medianPrice", "modePrice", "averagePrice", city, state, zip, beds, baths, "averagePricePerSqFt", "modePricePerSqFt", "medianPricePerSqFt", "averageSqFt", "modeSqFt", "medianSqFt", "averageLotSize", "modeLotSize", "medianLotSize", "averageBeds", "medianBeds", "modeBeds", "averageBaths", "medianBaths", "modeBaths", "averageHoa", "medianHoa", "modeHoa", "averageYearBuilt", "medianYearBuilt", "modeYearBuilt", "curDateUtc")
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $30) RETURNING *;`;
    const res = await poolObj.query(addStatQuery, [
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
    await poolObj.end();
    return {
      code: "200",
      success: true,
      message: "New stat added!",
      stat: res.rows[0],
    };
  }
}

export class SearchDataSource {
  async getSearches(city, state): Promise<Search[]> {
    const poolObj = await getPool();
    const getSearchesQueryString = `SELECT * FROM Searches WHERE city = $1 AND state = $2;`;
    const res = await poolObj.query(getSearchesQueryString, [city, state]);
    const rows = res.rows;
    await poolObj.end();
    return rows;
  }

  async getSearch(id): Promise<Search> {
    const poolObj = await getPool();
    const getSearchesQueryString = `SELECT * FROM Searches WHERE id = $1;`;
    const res = await poolObj.query(getSearchesQueryString, [id]);
    const rows = res.rows;
    await poolObj.end();
    if (rows && rows.length) {
      return rows[0];
    } else {
      return null;
    }
  }

  async addSearch(search: SearchInput): Promise<AddSearchMutationResponse> {
    const { city, state, expenseFk, zip, user, beds, minBath, maxBath } =
      search;
    const expenseId = expenseFk?.id;
    const poolObj = await getPool();
    const addSearchQuery = `INSERT INTO public.searches(
      city,
      state,
      "expenseFk",
      zip,
      user,
      beds,
      "minBath",
      "maxBath")
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *;`;
    const res = await poolObj.query(addSearchQuery, [
      city,
      state,
      expenseId,
      zip,
      user,
      beds,
      minBath,
      maxBath,
    ]);
    await poolObj.end();
    return {
      code: "200",
      success: true,
      message: "New search added!",
      search: res.rows[0],
    };
  }

  async updateSearch(search: SearchInput): Promise<AddSearchMutationResponse> {
    const { id, city, state, expenseFk, zip, user, beds, minBath, maxBath } =
      search;
    const expenseId = expenseFk?.id;
    const poolObj = await getPool();
    const updateSearchQuery = `UPDATE public.searches SET
      city = $1,
      state = $2,
      "expenseFk" = $3,
      zip = $4,
      user = $5,
      beds = $6,
      "minBath" = $7,
      "maxBath" = $8
      WHERE id = $9 RETURNING *;`;
    const res = await poolObj.query(updateSearchQuery, [
      city,
      state,
      expenseId,
      zip,
      user,
      beds,
      minBath,
      maxBath,
      id,
    ]);
    await poolObj.end();
    return {
      code: "200",
      success: true,
      message: "Search has been updated!",
      search: res.rows[0],
    };
  }
}

export class ExpenseDataSource {
  async getExpense(id): Promise<Expense> {
    const poolObj = await getPool();
    const getExpenseQueryString = `SELECT * FROM public.expenses WHERE id = $1;`;
    const res = await poolObj.query(getExpenseQueryString, [id]);
    const rows = res.rows;
    await poolObj.end();
    if (rows && rows.length) {
      return rows[0];
    } else {
      return null;
    }
  }

  async addExpense(expense: ExpenseInput): Promise<AddExpenseMutationResponse> {
    const {
      taxes,
      insurance,
      water,
      sewer,
      garbage,
      electric,
      gas,
      hoa,
      lot,
      vacancy,
      repairs,
      capex,
      management,
      mortgage,
    } = expense;
    const poolObj = await getPool();
    const addExpenseQuery = `INSERT INTO public.expenses(
        taxes,
        insurance,
        water,
        sewer,
        garbage,
        electric,
        gas,
        hoa,
        lot,
        vacancy,
        repairs,
        capex,
        management,
        mortgage)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14) RETURNING *;`;
    const res = await poolObj.query(addExpenseQuery, [
      taxes,
      insurance,
      water,
      sewer,
      garbage,
      electric,
      gas,
      hoa,
      lot,
      vacancy,
      repairs,
      capex,
      management,
      mortgage,
    ]);
    await poolObj.end();
    return {
      code: "200",
      success: true,
      message: "New expense added!",
      expense: res.rows[0],
    };
  }

  async updateExpense(
    expense: ExpenseInput
  ): Promise<AddExpenseMutationResponse> {
    const {
      id,
      taxes,
      insurance,
      water,
      sewer,
      garbage,
      electric,
      gas,
      hoa,
      lot,
      vacancy,
      repairs,
      capex,
      management,
      mortgage,
    } = expense;
    const poolObj = await getPool();
    const updateExpenseQuery = `UPDATE public.expenses SET
        taxes = $1,
        insurance = $2,
        water = $3,
        sewer = $4,
        garbage = $5,
        electric = $6,
        gas = $7,
        hoa = $8,
        lot = $9,
        vacancy = $10,
        repairs = $11,
        capex = $12,
        management = $13,
        mortgage = $14
        WHERE id = $15 RETURNING *;`;
    const res = await poolObj.query(updateExpenseQuery, [
      taxes,
      insurance,
      water,
      sewer,
      garbage,
      electric,
      gas,
      hoa,
      lot,
      vacancy,
      repairs,
      capex,
      management,
      mortgage,
      id,
    ]);
    await poolObj.end();
    return {
      code: "200",
      success: true,
      message: "Expense Updated!",
      expense: res.rows[0],
    };
  }
}

export class UserDataSource {
  async getUser(id): Promise<User> {
    const poolObj = await getPool();
    const getUserQueryString = `SELECT * FROM public.users WHERE id = $1;`;
    const res = await poolObj.query(getUserQueryString, [id]);
    const rows = res.rows;
    await poolObj.end();
    if (rows && rows.length) {
      return rows[0];
    } else {
      return null;
    }
  }

  async getUserByName(name): Promise<User> {
    const poolObj = await getPool();
    const getUserQueryString = `SELECT * FROM public.users WHERE name = $1;`;
    const res = await poolObj.query(getUserQueryString, [name]);
    const rows = res.rows;
    await poolObj.end();
    if (rows && rows.length) {
      return rows[0];
    } else {
      return null;
    }
  }

  async addUser(user: UserInput): Promise<AddUserMutationResponse> {
    const { name } = user;
    const poolObj = await getPool();
    const addUserQuery = `INSERT INTO public.users(name) VALUES ($1) RETURNING *;`;
    const res = await poolObj.query(addUserQuery, [name]);
    await poolObj.end();
    return {
      code: "200",
      success: true,
      message: "New user added!",
      user: res.rows[0],
    };
  }

  async updateUser(user: UserInput): Promise<AddUserMutationResponse> {
    const { name, id } = user;
    const poolObj = await getPool();
    const updateUserQuery = `UPDATE public.users SET name = $1 WHERE id = $2;`;
    await poolObj.query(updateUserQuery, [name, id]);
    const userResponse = await this.getUser(id);
    await poolObj.end();
    return {
      code: "200",
      success: true,
      message: "User updated!",
      user: userResponse,
    };
  }
}
