import express from "express";
import routes from "./modules/routes";
import cors from "cors";

const APP = express();

APP.use(routes);
APP.use(cors());
APP.use(express.json());

APP.listen(3001, ()=>{
    console.log("Server: server is on")
});