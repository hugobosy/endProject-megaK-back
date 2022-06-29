import {Router} from "express";
import {pool} from "../../utils/db";

export const routesDashboard = Router()
    .get('/', async (req, res) => {
        const dataOrders = await pool.execute("SELECT * FROM `orders` ORDER BY `date` DESC");
        const dataUsers = await pool.execute("SELECT * FROM `clients`");

        console.log(dataOrders[0], dataUsers[0]);

        res.json({users: dataUsers[0], orders: dataOrders[0]})
    })