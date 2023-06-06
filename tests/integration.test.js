import { describe } from "node:test";
import { ListingDataSource, StatDataSource } from "../src/dataSource";
import { MyContext } from "../src/index";

const listingAPI = await ListingDataSource.initialize();
const statAPI = await StatDataSource.initialize();

// ensure our server's context is typed correctly
const context = {
  token: "",
  dataSources: {
    listingAPI: listingAPI,
    statAPI: statAPI,
  },
};

// create a test server to test against, using our production typeDefs,
// resolvers, and dataSources.
const server =
  new ApolloServer() <
  MyContext >
  {
    typeDefs,
    resolvers,
  };

// mock the dataSource's underlying fetch methods
// listingAPI.get = jest.fn(() => [mockLaunchResponse]);
// statAPI.store = mockStore;
// statAPI.store.trips.findAll.mockReturnValueOnce([
//   { dataValues: { launchId: 1 } },
// ]);

describe("Apollo Server", async () => {
  it("fetches single listing", async () => {
    // run the query against the server and snapshot the output
    const res = await server.executeOperation(
      {
        query: GET_LISTING,
        variables: { id: 1 },
      },
      {
        contextValue: {
          token: "tk",
          dataSources: {
            statAPI: statAPI,
            listingAPI: listingAPI,
          },
        },
      }
    );

    expect(res).toMatchSnapshot();
  });
});
