import { Connection } from "./Connection";

class Dao
{
    public dao;

    constructor(){
        try {
            this.dao = new Connection(
                "localhost",
                "products_db",
                "root",
                ""
            );
    
            if(this.dao.conn){
                this.dao.conn.connect( err =>{
                    if(err) throw err;
                });
            }
        } catch (error) {
            console.log("Dao: Erro in Dao")
        }
    }
}

export default Dao;