import { ListingDataSource, StatDataSource } from "../src/dataSource";
import { MyContext } from "../src/index";
test("Apollo Server", () => {
  const listingAPI = new ListingDataSource();
  const statAPI = new StatDataSource();

  // ensure our server's context is typed correctly
  const context = {
    listening: { port: 4000 },
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
  listingAPI.get = jest.fn(() => [mockLaunchResponse]);
  statAPI.store = mockStore;
  statAPI.store.trips.findAll.mockReturnValueOnce([
    { dataValues: { launchId: 1 } },
  ]);

  it("fetches single listing", async () => {
    // run the query against the server and snapshot the output
    const res = await server.executeOperation(
      {
        query: GET_LAUNCH,
        variables: { id: 1 },
      },
      {
        contextValue: {
          listens: { port: 4000 },
          token: "tk",
          user: { id: 1, email: "a@a.a" },
          dataSources: {
            statAPI,
            listingAPI,
          },
        },
      }
    );

    expect(res).toMatchSnapshot();
  });
});
