import {Router} from "express";
import {pool} from "../../utils/db";

export const routesOrder = Router()
    .get('/', async(req,res) => {
        const data = await pool.execute("SELECT * FROM `orders`");

        res.json(data[0])
    })