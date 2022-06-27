import {Router} from "express";
import {pool} from "../../utils/db";

export const routesOrder = Router()
    .get('/', async (req, res) => {
        const data = await pool.execute("SELECT * FROM `orders`");

        res.json(data[0])
    })

    .post('/simulate', async (req, res) => {
        const data = req.body;
        await pool.execute("INSERT INTO `orders`(`id`, `date`, `total`, `payment`, `products`, `count`, `client`) VALUES (:id, :date, :total, :payment, :products, :count, :client)", data)
    })