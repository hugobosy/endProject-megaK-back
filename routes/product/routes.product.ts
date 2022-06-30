import {Router} from "express";
import {pool} from "../../utils/db";

export const routesProduct = Router()
    .get('/', async (req, res) => {
        const data = await pool.execute("SELECT products.id, products.firm, products.model, products.price, products.description, products.category, products.picture, products.quantity, category.name FROM `products` JOIN `category` ON products.category = category.name");
        res.json(data[0]);
    })

    .get('/:id', async (req, res) => {
        const {id} = req.params;
        const data = await pool.execute("SELECT products.id, products.firm, products.model, products.price, products.description, products.category, products.picture, products.quantity, category.name FROM `products` JOIN `category` ON products.category = category.name WHERE products.id = :id", {id});
        res.json(data[0])
    })

    .post('/delete/:id', async (req, res) => {
        const {id} = req.params;
        await pool.execute("DELETE FROM `products` WHERE `id`=:id", {
            id
        })
    })

    .post('/add', async (req, res) => {
        const data = req.body;
        console.log(data)
        await pool.execute("INSERT INTO `products`( `id`, `firm`, `model`, `price`, `quantity`, `description`, `category`, `picture`) VALUES (:id, :firm, :model, :price, :quantity, :description, :category, :picture)", data);
        await pool.execute("INSERT INTO `sells`(`product_id`) VALUES (:id)", data)
    })

    .patch('/edit/:id', async (req, res) => {
        const {data} = req.body;
        await pool.execute("UPDATE `products` SET `firm`=:firm, `model`=:model, `price`=:price, `quantity`=:quantity, `description`=:description, `category`=:category, `picture`=:picture WHERE `id`=:id", data)
    })