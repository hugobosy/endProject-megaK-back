import {Router} from "express";
import {pool} from "../../utils/db";

export const routesDashboard = Router()
    .get('/', async (req, res) => {
        const dataOrders = await pool.execute("SELECT * FROM `orders` ORDER BY `date` DESC");
        const dataUsers = await pool.execute("SELECT * FROM `clients` ORDER BY `birth` DESC");
        const dataProducts = await pool.execute("SELECT *, products.picture, products.id, products.firm, products.model, products.price FROM `sells` JOIN `products` ON products.id=sells.product_id ORDER BY `quantity_sells` DESC")

        res.json({users: dataUsers[0], orders: dataOrders[0], products: dataProducts[0]})
    })