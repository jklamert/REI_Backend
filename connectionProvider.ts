import {Pool, Client} from "pg";

  /**
   * Method to get a sql client to perform queries with.
   */
  export async function getClient (): Promise<Client> {
    try {
      const client = new Client({
        user: process.env.DATABASE_USER,
        host: process.env.DATABASE_HOST,//"localhost", //host.docker.internal
        database: process.env.DATABASE,
        password: process.env.DATABASE_PASSWORD,
        port: 5432,
      });
      await client.connect();
      return client;
    } catch (e) {
      console.error(e);
      //Fail early because we have no DB connection.
      process.exit(0);
    }
  };
