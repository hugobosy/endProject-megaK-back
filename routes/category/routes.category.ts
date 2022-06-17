import {Router} from "express";
import {v4 as uuid} from 'uuid';
import {Category} from "../../records/category/category";

export const routesCategory = Router()

    .get('/', async (req, res) => {
        const data = (
            await Category.getAll()
        )
        res.json(data)
    })
    .post('/add', async (req, res) => {

        const data = {
            ...req.body,
            id: uuid(),
        }
        const category = new Category(data);
        category.add()
    });