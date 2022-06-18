import {Router} from "express";
import {pool} from "../../utils/db";

export const routesClient = Router()
    .get('/', async (req, res) => {
        const data = await pool.execute("SELECT * FROM `clients`");
        res.json(data[0]);
    })

    .post('/delete/:id', async (req, res) => {
        const {id} = req.params;
        await pool.execute("DELETE FROM `clients` WHERE `id`=:id", {
            id
        })
    })

    .patch('/ban/:id', async (req, res) => {
        const {id} = req.params;
        await pool.execute("UPDATE `clients` SET `ban`=1 WHERE `id`=:id", {id})
    })