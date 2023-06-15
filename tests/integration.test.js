import { ListingDataSource, StatDataSource } from "../src/dataSource";
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
    // run the query against the server and snapshot the output
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
});
