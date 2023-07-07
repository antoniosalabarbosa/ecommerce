import { Router } from "express";
import Dao from "./database/Dao";

const routes = Router();
const controller = new Dao;

routes.get("/products", (req, res)=>{
    if(controller.dao && controller.dao.conn){
        const sql = "SELECT * FROM products";

        controller.dao.conn.query(sql, (err, response)=>{
            if(err) throw err;

            console.log(JSON.stringify(response));

            res.setHeader("Content-Type", "application/json");
            res.json(response);

            res.end();
            req.pause();
        })
    }
});

routes.get("/products/:id", (req, res)=>{
    const { id } = req.params;

    if(controller.dao && controller.dao.conn){
        const sql = `SELECT * FROM products WHERE id_prod=${id}`;

        controller.dao.conn.query(sql, (err, response)=>{
            if(err) throw err;

            res.setHeader("Content-Type", "application/json");
            res.json(response);

            res.end();
            req.pause();
        });
    }
});

routes.post("/products", (req, res)=>{
    if(controller.dao && controller.dao.conn){
        const sql = `INSERT INTO products VALUES()`;

        controller.dao.conn.query(sql, (err, response)=>{
            if(err) throw err;

            res.end();
            req.pause();
        });
    }
});

export default routes;