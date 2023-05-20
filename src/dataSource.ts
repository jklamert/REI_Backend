export class DataSource {
    private dbConnection;
    private token;
    private user;
  
    constructor(options: { token: string }) {
      this.dbConnection = this.initializeDBConnection();
      this.token = options.token;
    }
  
    async initializeDBConnection() {
      // set up our database details, instantiate our connection,
      // and return that database connection
      return this.dbConnection;
    }
  
    async getListing(mlsId: number) {
    //   if (!this.user) {
    //     // store the user, lookup by token
    //     this.user = await this.dbConnection.User.findByToken(this.token);
    //   }
    //   return this.user;
    }

    async getStat(city: string, date: Date) {
        // if (!this.user) {
        //   // store the user, lookup by token
        //   this.user = await this.dbConnection.User.findByToken(this.token);
        // }
        // return this.user;
      }
  }