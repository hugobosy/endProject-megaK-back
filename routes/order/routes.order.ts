import {Router} from "express";
import {pool} from "../../utils/db";

export const routesOrder = Router()
    .get('/', async (req, res) => {
        const data = await pool.execute("SELECT * FROM `orders`");

        res.json(data[0])
    })

    .post('/simulate', async (req, res) => {
        const [data] = req.body;
        console.log(data)
        await pool.execute("INSERT INTO `orders`(`id`, `date`, `total`, `payment`, `products`, `count`, `client`) VALUES (:id, :date, :total, :payment, :products, :quantity, :client)", data)
        await data.productID.forEach((item: any) => pool.execute("UPDATE `sells` SET `quantity_sells` = sells.quantity_sells + :count WHERE `product_id` = :id", item));
        await data.productID.forEach((item: any) => pool.execute("UPDATE `products` SET `quantity` = products.quantity - :count WHERE `id` = :id", item));
    })