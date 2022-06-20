import {Router} from "express";
import {pool} from "../../utils/db";

export const routesProduct = Router()
    .get('/', async (req, res) => {
        const data = await pool.execute("SELECT * FROM `products`");
        res.json(data[0]);
    })