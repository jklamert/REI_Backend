import {
  ListingDataSource,
  StatDataSource,
  SearchDataSource,
  ExpenseDataSource,
  UserDataSource,
} from "../src/dataSource";
// import { MyContext } from "../src/context";
import { resolvers } from "../src/resolvers";
import { readFileSync } from "fs";
import { describe, expect, it } from "@jest/globals";
import { ApolloServer } from "@apollo/server";

import { ApolloServerErrorCode } from "@apollo/server/errors";
import {
  ApolloServerPluginLandingPageLocalDefault,
  ApolloServerPluginLandingPageProductionDefault,
} from "@apollo/server/plugin/landingPage/default";

describe("Apollo Server", () => {
  const typeDefs = readFileSync("schema.graphql", {
    encoding: "utf-8",
  });

  const context = {
    token: "",
    dataSources: {
      listingAPI: new ListingDataSource(),
      statAPI: new StatDataSource(),
      searchAPI: new SearchDataSource(),
      expenseAPI: new ExpenseDataSource(),
      userAPI: new UserDataSource(),
    },
  };

  const server = new ApolloServer({
    typeDefs: typeDefs,
    resolvers: resolvers,
    formatError: (formattedError, error) => {
      if (
        formattedError.extensions.code ===
        ApolloServerErrorCode.GRAPHQL_VALIDATION_FAILED
      ) {
        return {
          ...formattedError,
          message:
            "Your query doesn't match the schema. Try double-checking it!",
        };
      }

      return formattedError;
    },
    plugins: [
      process.env.NODE_ENV === "production"
        ? ApolloServerPluginLandingPageProductionDefault()
        : ApolloServerPluginLandingPageLocalDefault({ embed: false }),
    ],
  });

  it("fetches a listing", async () => {
    // run the query against the server and snapshot the output
    const GET_LISTING = `query GetListing($listingId: Int!) {
      listing(listingId: $listingId) {
        mlsStatus
        price
        sqft
        pricePerSqFt
        lotSize
        beds
        baths
        fullBaths
        partialBaths
        streetLine
        stories
        city
        state
        zip
        soldDate
        propertyType
        yearBuilt
        timeZone
        url
        location
        propertyId
        listingId
        latitude
        longitude
        mlsId
        hoa
      }
    }`;
    const response = await server.executeOperation(
      {
        query: GET_LISTING,
        variables: { listingId: 164146978 },
      },
      {
        contextValue: context,
      }
    );

    const data = response.body.singleResult.data.listing;

    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();
    expect(data.mlsStatus).toBe("Active");
    expect(data.price).toBe(334974);
    expect(data.sqft).toBe(1279);
    expect(data.pricePerSqFt).toBe(262);
    expect(data.lotSize).toBeNull();
    expect(data.beds).toBe(3);
    expect(data.baths).toBe(2);
    expect(data.fullBaths).toBe(2);
    expect(data.partialBaths).toBeNull();
    expect(data.streetLine).toBe("2816 Winding Valley Dr");
    expect(data.stories).toBe(1);
    expect(data.city).toBe("Fenton");
    expect(data.state).toBe("MO");
    expect(data.zip).toBe("63026");
    expect(data.soldDate).toBeNull();
    expect(data.propertyType).toBe(6);
    expect(data.yearBuilt).toBeNull();
    expect(data.timeZone).toBe("US/Central");
    expect(data.url).toBe(
      "/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426"
    );
    expect(data.location).toBe("Valley at Winding Bluffs");
    expect(data.propertyId).toBe(183485426);
    expect(data.listingId).toBe(164146978);
    expect(data.latitude).toBe(38.46928);
    expect(data.longitude).toBe(-90.46247);
    expect(data.mlsId).toBe("22078812");
    expect(data.hoa).toBeNull();
  });

  it("fetches a stat", async () => {
    // run the query against the server and snapshot the output
    const GET_STATS = `query GetStats($city: String, $state: String, $curDateUtc: String) {
      stats(city: $city, state: $state, curDateUtc: $curDateUtc) {
        medianPrice
        modePrice
        averagePrice
        city
        state
        zip
        beds
        baths
        averagePricePerSqFt
        modePricePerSqFt
        medianPricePerSqFt
        averageSqFt
        modeSqFt
        medianSqFt
        averageLotSize
        modeLotSize
        medianLotSize
        averageBeds
        medianBeds
        modeBeds
        averageBaths
        medianBaths
        modeBaths
        averageHoa
        medianHoa
        modeHoa
        averageYearBuilt
        medianYearBuilt
        modeYearBuilt
        curDateUtc
      }
    }`;
    const response = await server.executeOperation(
      {
        query: GET_STATS,
        variables: { city: "Imperial", state: "MO", curDateUtc: "2023-03-10" },
      },
      {
        contextValue: context,
      }
    );

    const data = response.body.singleResult.data.stats[0];
    const len = response.body.singleResult.data.stats.length;

    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();
    // expect(len).toBe(56);
    expect(data.medianPrice).toBe(99500);
    expect(data.modePrice).toBe(40000);
    expect(data.averagePrice).toBe(99500);
    expect(data.city).toBe("Imperial");
    expect(data.state).toBe("MO");
    expect(data.zip).toBe("63052");
    expect(data.beds).toBe(2);
    expect(data.baths).toBe(1);
    expect(data.averagePricePerSqFt).toBe(101.5);
    expect(data.modePricePerSqFt).toBe(24);
    expect(data.medianPricePerSqFt).toBe(101.5);
    expect(data.averageSqFt).toBe(1272);
    expect(data.modeSqFt).toBe(1656);
    expect(data.medianSqFt).toBe(1272);
    expect(data.modeLotSize).toBe(19868);
    expect(data.medianLotSize).toBe(20591);
    expect(data.averageLotSize).toBe(20591);
    expect(data.medianBeds).toBe(2);
    expect(data.modeBeds).toBe(2);
    expect(data.averageBeds).toBe(2);
    expect(data.averageBaths).toBe(1);
    expect(data.medianBaths).toBe(1);
    expect(data.modeBaths).toBe(1);
    expect(data.averageHoa).toBeNull();
    expect(data.medianHoa).toBeNull();
    expect(data.modeHoa).toBeNull();
    expect(data.averageYearBuilt).toBe(1954);
    expect(data.medianYearBuilt).toBe(1954);
    expect(data.modeYearBuilt).toBe(1956);
    expect(data.curDateUtc).toBe("1678428000000");
  });

  it("adds a stat", async () => {
    // run the query against the server and snapshot the output
    const ADD_STATS = `mutation Mutation($stat: StatInput!) {
      addStat(stat: $stat) {
        code
        success
        message
        stat {
          medianPrice
          modePrice
          averagePrice
          city
          state
          zip
          beds
          baths
          averagePricePerSqFt
          modePricePerSqFt
          medianPricePerSqFt
          averageSqFt
          modeSqFt
          medianSqFt
          averageLotSize
          modeLotSize
          medianLotSize
          averageBeds
          medianBeds
          modeBeds
          averageBaths
          medianBaths
          modeBaths
          averageHoa
          medianHoa
          modeHoa
          averageYearBuilt
          medianYearBuilt
          modeYearBuilt
          curDateUtc
        }
      }
    }
    `;
    const response = await server.executeOperation(
      {
        query: ADD_STATS,
        variables: {
          stat: {
            medianPrice: 99500,
            modePrice: 40000,
            averagePrice: 99500,
            city: "Imperial",
            state: "MO",
            zip: "63052",
            beds: 2,
            baths: 1,
            averagePricePerSqFt: 101.5,
            modePricePerSqFt: 24,
            medianPricePerSqFt: 101.5,
            averageSqFt: 1272,
            modeSqFt: 1656,
            medianSqFt: 1272,
            modeLotSize: 19868,
            medianLotSize: 20591,
            averageLotSize: 20591,
            medianBeds: 2,
            modeBeds: 2,
            averageBeds: 2,
            averageBaths: 1,
            medianBaths: 1,
            modeBaths: 1,
            averageHoa: null,
            medianHoa: null,
            modeHoa: null,
            averageYearBuilt: 1954,
            medianYearBuilt: 1954,
            modeYearBuilt: 1956,
            curDateUtc: "2023-03-10",
          },
        },
      },
      {
        contextValue: context,
      }
    );

    const data = response.body.singleResult.data.addStat.stat;
    expect(response.body.singleResult.data.addStat.code).toBe("200");
    expect(response.body.singleResult.data.addStat.success).toBe(true);
    expect(response.body.singleResult.data.addStat.message).toBe(
      "New stat added!"
    );

    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();
    expect(data.medianPrice).toBe(99500);
    expect(data.modePrice).toBe(40000);
    expect(data.averagePrice).toBe(99500);
    expect(data.city).toBe("Imperial");
    expect(data.state).toBe("MO");
    expect(data.zip).toBe("63052");
    expect(data.beds).toBe(2);
    expect(data.baths).toBe(1);
    expect(data.averagePricePerSqFt).toBe(101.5);
    expect(data.modePricePerSqFt).toBe(24);
    expect(data.medianPricePerSqFt).toBe(101.5);
    expect(data.averageSqFt).toBe(1272);
    expect(data.modeSqFt).toBe(1656);
    expect(data.medianSqFt).toBe(1272);
    expect(data.modeLotSize).toBe(19868);
    expect(data.medianLotSize).toBe(20591);
    expect(data.averageLotSize).toBe(20591);
    expect(data.medianBeds).toBe(2);
    expect(data.modeBeds).toBe(2);
    expect(data.averageBeds).toBe(2);
    expect(data.averageBaths).toBe(1);
    expect(data.medianBaths).toBe(1);
    expect(data.modeBaths).toBe(1);
    expect(data.averageHoa).toBeNull();
    expect(data.medianHoa).toBeNull();
    expect(data.modeHoa).toBeNull();
    expect(data.averageYearBuilt).toBe(1954);
    expect(data.medianYearBuilt).toBe(1954);
    expect(data.modeYearBuilt).toBe(1956);
    expect(data.curDateUtc).toBe("1678428000000");
  });

  it("adds a listing", async () => {
    const ADD_LISTING = `mutation Mutation($listing: ListingInput!) {
      addListing(listing: $listing) {
        code
        success
        message
        listing {
          mlsStatus
          price
          sqft
          pricePerSqFt
          lotSize
          beds
          baths
          fullBaths
          partialBaths
          streetLine
          stories
          city
          state
          zip
          soldDate
          propertyType
          yearBuilt
          timeZone
          url
          location
          propertyId
          listingId
          latitude
          longitude
          mlsId
          hoa
        }
      }
    }    
    `;
    const response = await server.executeOperation(
      {
        query: ADD_LISTING,
        variables: {
          listing: {
            mlsStatus: "Active",
            price: 334974,
            sqft: 1279,
            pricePerSqFt: 262,
            lotSize: null,
            beds: 3,
            baths: 2,
            fullBaths: 2,
            partialBaths: null,
            streetLine: "2816 Winding Valley Dr",
            stories: 1,
            city: "Fenton",
            state: "MO",
            zip: "63026",
            soldDate: null,
            propertyType: 6,
            yearBuilt: null,
            timeZone: "US/Central",
            url: "/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426",
            location: "Valley at Winding Bluffs",
            propertyId: 183485426,
            listingId: 164146978,
            latitude: 38.46928,
            longitude: -90.46247,
            mlsId: "22078812",
            hoa: null,
          },
        },
      },
      {
        contextValue: context,
      }
    );

    const data = response.body.singleResult.data.addListing.listing;

    expect(response.body.singleResult.data.addListing.code).toBe("200");
    expect(response.body.singleResult.data.addListing.success).toBe(true);
    expect(response.body.singleResult.data.addListing.message).toBe(
      "New listing added!"
    );
    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();
    expect(data.mlsStatus).toBe("Active");
    expect(data.price).toBe(334974);
    expect(data.sqft).toBe(1279);
    expect(data.pricePerSqFt).toBe(262);
    expect(data.lotSize).toBeNull();
    expect(data.beds).toBe(3);
    expect(data.baths).toBe(2);
    expect(data.fullBaths).toBe(2);
    expect(data.partialBaths).toBeNull();
    expect(data.streetLine).toBe("2816 Winding Valley Dr");
    expect(data.stories).toBe(1);
    expect(data.city).toBe("Fenton");
    expect(data.state).toBe("MO");
    expect(data.zip).toBe("63026");
    expect(data.soldDate).toBeNull();
    expect(data.propertyType).toBe(6);
    expect(data.yearBuilt).toBeNull();
    expect(data.timeZone).toBe("US/Central");
    expect(data.url).toBe(
      "/MO/Fenton/2816-Winding-Valley-Dr-63026/home/183485426"
    );
    expect(data.location).toBe("Valley at Winding Bluffs");
    expect(data.propertyId).toBe(183485426);
    expect(data.listingId).toBe(164146978);
    expect(data.latitude).toBe(38.46928);
    expect(data.longitude).toBe(-90.46247);
    expect(data.mlsId).toBe("22078812");
    expect(data.hoa).toBeNull();
  });

  it("fetches a user by id", async () => {
    const GET_USER = `query User($userId: Int) {
      user(id: $userId) {
        id
        name
      }
    }`;
    const response = await server.executeOperation(
      {
        query: GET_USER,
        variables: { userId: 1 },
      },
      {
        contextValue: context,
      }
    );

    const data = response.body.singleResult.data.user;

    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();
    expect(data.id).toBe(1);
    expect(data.name).toBe("jklamert");
  });

  it("fetches a user by name", async () => {
    const GET_USER_BY_NAME = `query User( $name: String ) {
      userByName(name: $name) {
        id
        name
      }
    }`;
    const response = await server.executeOperation(
      {
        query: GET_USER_BY_NAME,
        variables: { name: "jklamert" },
      },
      {
        contextValue: context,
      }
    );

    const data = response.body.singleResult.data.userByName;

    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();
    expect(data.id).toBe(1);
    expect(data.name).toBe("jklamert");
  });

  it("fetches an expense by id", async () => {
    const GET_EXPENSES = `query Expense($expenseId: Int) {
      expense(id: $expenseId) {
        id
        taxes
        insurance
        water
        sewer
        garbage
        electric
        gas
        hoa
        lot
        vacancy
        repairs
        capex
        management
        mortgage
      }
    }`;
    const response = await server.executeOperation(
      {
        query: GET_EXPENSES,
        variables: { expenseId: 1 },
      },
      {
        contextValue: context,
      }
    );

    const data = response.body.singleResult.data.expense;

    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();
    expect(data.id).toBe(1);
    expect(data.taxes).toBe(100);
    expect(data.insurance).toBe(100);
    expect(data.water).toBe(100);
    expect(data.sewer).toBe(100);
    expect(data.garbage).toBe(100);
    expect(data.electric).toBe(100);
    expect(data.gas).toBe(100);
    expect(data.hoa).toBe(100);
    expect(data.lot).toBe(100);
    expect(data.vacancy).toBe(100);
    expect(data.repairs).toBe(100);
    expect(data.capex).toBe(100);
    expect(data.management).toBe(100);
    expect(data.mortgage).toBe(100);
  });

  it("fetches searches by city and state", async () => {
    const GET_SEARCHES = `query Searches($city: String!, $state: String!) {
      searches(city: $city, state: $state) {
        id
        city
        state
        expenseFk {
          id
          taxes
          insurance
          water
          sewer
          garbage
          electric
          gas
          hoa
          lot
          vacancy
          repairs
          capex
          management
          mortgage
        }
        zip
        user
        beds
        minBath
        maxBath
      }
    }`;
    const response = await server.executeOperation(
      {
        query: GET_SEARCHES,
        variables: { city: "Fenton", state: "MO" },
      },
      {
        contextValue: context,
      }
    );

    const data = response.body.singleResult.data.searches;
    const testRecord = data[0];
    const data2 = testRecord.expenseFk;
    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();
    expect(testRecord.city).toBe("Fenton");
    expect(testRecord.state).toBe("MO");
    expect(data2.id).toBe(1);
    expect(data2.taxes).toBe(100);
    expect(data2.insurance).toBe(100);
    expect(data2.water).toBe(100);
    expect(data2.sewer).toBe(100);
    expect(data2.garbage).toBe(100);
    expect(data2.electric).toBe(100);
    expect(data2.gas).toBe(100);
    expect(data2.hoa).toBe(100);
    expect(data2.lot).toBe(100);
    expect(data2.vacancy).toBe(100);
    expect(data2.repairs).toBe(100);
    expect(data2.capex).toBe(100);
    expect(data2.management).toBe(100);
    expect(data2.mortgage).toBe(100);
    expect(testRecord.zip).toBe("63026");
    expect(testRecord.user).toBe(1);
    expect(testRecord.beds).toBe(3);
    expect(testRecord.minBath).toBe(1);
    expect(testRecord.maxBath).toBe(2);
  });

  it("fetches a search by id", async () => {
    const GET_SEARCH = `query Search($id: Int!) {
      search(id: $id) {
        id
        city
        state
        expenseFk {
          id
          taxes
          insurance
          water
          sewer
          garbage
          electric
          gas
          hoa
          lot
          vacancy
          repairs
          capex
          management
          mortgage
        }
        zip
        user
        beds
        minBath
        maxBath
      }
    }`;
    const response = await server.executeOperation(
      {
        query: GET_SEARCH,
        variables: { id: 1 },
      },
      {
        contextValue: context,
      }
    );

    const testRecord = response.body.singleResult.data.search;
    const data2 = testRecord.expenseFk;
    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();
    expect(testRecord.city).toBe("Fenton");
    expect(testRecord.state).toBe("MO");
    expect(data2.id).toBe(1);
    expect(data2.taxes).toBe(100);
    expect(data2.insurance).toBe(100);
    expect(data2.water).toBe(100);
    expect(data2.sewer).toBe(100);
    expect(data2.garbage).toBe(100);
    expect(data2.electric).toBe(100);
    expect(data2.gas).toBe(100);
    expect(data2.hoa).toBe(100);
    expect(data2.lot).toBe(100);
    expect(data2.vacancy).toBe(100);
    expect(data2.repairs).toBe(100);
    expect(data2.capex).toBe(100);
    expect(data2.management).toBe(100);
    expect(data2.mortgage).toBe(100);
    expect(testRecord.zip).toBe("63026");
    expect(testRecord.user).toBe(1);
    expect(testRecord.beds).toBe(3);
    expect(testRecord.minBath).toBe(1);
    expect(testRecord.maxBath).toBe(2);
  });

  it("adds an expense", async () => {
    const ADD_EXPENSE = `mutation Mutation($addExpense: ExpenseInput!) {
      addExpense(expense: $addExpense) {
        code
        success
        message
        expense {
          id
          taxes
          insurance
          water
          sewer
          garbage
          electric
          gas
          hoa
          lot
          vacancy
          repairs
          capex
          management
          mortgage
        }
      }
    }`;
    const response = await server.executeOperation(
      {
        query: ADD_EXPENSE,
        variables: {
          addExpense: {
            taxes: 105,
            insurance: 50,
            water: 36,
            sewer: 0,
            garbage: 26,
            electric: 116,
            gas: 0,
            hoa: 12,
            lot: 0,
            vacancy: 82,
            repairs: 80,
            capex: 80,
            management: 100,
            mortgage: 1200,
          },
        },
      },
      {
        contextValue: context,
      }
    );

    let data2 = response.body.singleResult.data.addExpense;
    expect(data2.code).toBe("200");
    expect(data2.success).toBe(true);
    expect(data2.message).toBe("New expense added!");
    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();

    data2 = data2.expense;
    expect(data2.taxes).toBe(105);
    expect(data2.insurance).toBe(50);
    expect(data2.water).toBe(36);
    expect(data2.sewer).toBe(0);
    expect(data2.garbage).toBe(26);
    expect(data2.electric).toBe(116);
    expect(data2.gas).toBe(0);
    expect(data2.hoa).toBe(12);
    expect(data2.lot).toBe(0);
    expect(data2.vacancy).toBe(82);
    expect(data2.repairs).toBe(80);
    expect(data2.capex).toBe(80);
    expect(data2.management).toBe(100);
    expect(data2.mortgage).toBe(1200);
  });

  it("updates an expense", async () => {
    const UPDATE_EXPENSE = `mutation UpdateExpense($expense: ExpenseInput!) {
      updateExpense(expense: $expense) {
        code
        success
        message
        expense {
          id
          taxes
          insurance
          water
          sewer
          garbage
          electric
          gas
          hoa
          lot
          vacancy
          repairs
          capex
          management
          mortgage
        }
      }
    }`;
    const response = await server.executeOperation(
      {
        query: UPDATE_EXPENSE,
        variables: {
          expense: {
            id: 1,
            taxes: 110,
            insurance: 110,
            water: 50,
            sewer: 10,
            garbage: 30,
            electric: 80,
            gas: 10,
            hoa: 10,
            lot: 10,
            vacancy: 80,
            repairs: 70,
            capex: 70,
            management: 90,
            mortgage: 1100,
          },
        },
      },
      {
        contextValue: context,
      }
    );

    let data2 = response.body.singleResult.data.updateExpense;
    expect(data2.code).toBe("200");
    expect(data2.success).toBe(true);
    expect(data2.message).toBe("Expense Updated!");
    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();

    data2 = data2.expense;
    expect(data2.id).toBe(1);
    expect(data2.taxes).toBe(110);
    expect(data2.insurance).toBe(110);
    expect(data2.water).toBe(50);
    expect(data2.sewer).toBe(10);
    expect(data2.garbage).toBe(30);
    expect(data2.electric).toBe(80);
    expect(data2.gas).toBe(10);
    expect(data2.hoa).toBe(10);
    expect(data2.lot).toBe(10);
    expect(data2.vacancy).toBe(80);
    expect(data2.repairs).toBe(70);
    expect(data2.capex).toBe(70);
    expect(data2.management).toBe(90);
    expect(data2.mortgage).toBe(1100);
  });

  it("adds a user", async () => {
    const ADD_USER = `mutation Mutation($user: UserInput!) {
      addUser(user: $user) {
        code
        success
        message
        user {
          id
          name
        }
      }
    }`;
    const response = await server.executeOperation(
      {
        query: ADD_USER,
        variables: {
          user: {
            name: "testUser",
          },
        },
      },
      {
        contextValue: context,
      }
    );
    let data2 = response.body.singleResult.data.addUser;

    expect(data2.code).toBe("200");
    expect(data2.success).toBe(true);
    expect(data2.message).toBe("New user added!");
    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();

    data2 = data2.user;
    expect(data2.name).toBe("testUser");
  });

  it("update a user", async () => {
    const UPDATE_USER = `  mutation UpdateUser($updateUser: UserInput!) {
      updateUser(user: $updateUser) {
        code
        success
        message
        user {
          id
          name
        }
      }
    }`;
    const response = await server.executeOperation(
      {
        query: UPDATE_USER,
        variables: {
          updateUser: {
            id: 2,
            name: "testUser69",
          },
        },
      },
      {
        contextValue: context,
      }
    );
    console.debug("Resp: ", response.body.singleResult);
    let data2 = response.body.singleResult.data.updateUser;

    expect(data2.code).toBe("200");
    expect(data2.success).toBe(true);
    expect(data2.message).toBe("User updated!");
    expect(response.body.kind).toBe("single");
    expect(response.body.singleResult.errors).toBeUndefined();

    data2 = data2.user;
    console.debug("User: ", data2);
    expect(data2.id).toBe(2);
    expect(data2.name).toBe("testUser69");
  });
});
