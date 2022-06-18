import {Router} from "express";
import {pool} from "../../utils/db";

export const routesClient = Router()
    .get('/', async (req, res) => {
        const data = await pool.execute("SELECT * FROM `clients`");
        res.json(data[0]);
    })