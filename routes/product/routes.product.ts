import {Router} from "express";
import {pool} from "../../utils/db";

export const routesProduct = Router()
    .get('/', async (req, res) => {
        const data = await pool.execute("SELECT products.id, products.firm, products.model, products.price, products.description, products.category, products.picture, products.quantity, category.name FROM `products` JOIN `category` ON products.category = category.id");
        res.json(data[0]);
    })