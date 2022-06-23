import {Router} from "express";
import {pool} from "../../utils/db";

export const routesProduct = Router()
    .get('/', async (req, res) => {
        const data = await pool.execute("SELECT products.id, products.firm, products.model, products.price, products.description, products.category, products.picture, products.quantity, category.name FROM `products` JOIN `category` ON products.category = category.name");
        res.json(data[0]);
    })

    .post('/delete/:id', async (req, res) => {
        const {id} = req.params;
        await pool.execute("DELETE FROM `products` WHERE `id`=:id", {
            id
        })
    })

    .post('/add', async(req, res) => {
        const data = req.body;
        await pool.execute("INSERT INTO `products`(`firm`, `model`, `size`, `color`, `price`, `quantity`, `description`, `category`, `picture`) VALUES (:firm, :model, :size, :color, :price, :quantity, :description, :category, :picture)", data)
    })