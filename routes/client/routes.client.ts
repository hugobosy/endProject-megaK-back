import {Router} from "express";
import {pool} from "../../utils/db";
import {ValidationError} from "../../utils/errors";

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

    .post('/add', async (req, res) => {
        const data = req.body;
        console.log(data)
        await pool.execute("INSERT INTO `clients`(`name`, `surname`, `address`, `code`, `city`, `phone`, `gender`, `birth`, `email`) VALUES(:name, :surname, :address, :code, :city, :phone, :gender, :birth, :email)", data)
    })