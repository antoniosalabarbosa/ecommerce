import mysql from "mysql";

const connection = mysql.createConnection({
    database: "products_db",
    host: "localhost",
    port: 80,
    user: "root",
    password: "",
});

class Connection
{
    private host: string;
    private database: string;
    private user: string;
    private password: string;

    public conn;

    constructor(
        host: string, 
        database: string, 
        user: string, 
        password: string
    ){
        this.host = host;
        this.database = database;
        this.user = user;
        this.password = password;

        try{
            this.conn = mysql.createConnection({
                host: this.host,
                database: this.database,
                user: this.user,
                password: this.password
            });

            console.log("Connection: Connection is working")
        }
        catch(error){
            console.log("Connection: Error in Connection")
        }
    }
}

export { Connection };