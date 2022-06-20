import express, {json} from "express";
import cors from "cors";
import "express-async-errors";
import {handleError} from "./utils/errors";
import rateLimit from "express-rate-limit";
import {routesCategory} from "./routes/category/routes.category";
import {routesClient} from "./routes/client/routes.client";
import {routesProduct} from "./routes/product/routes.product";

const app = express();

app.use(cors({
    origin: 'http://localhost:3000',
}));
app.use(json());

app.use(rateLimit({
    windowMs: 5* 60 * 1000, // 5 minutes
    max: 100, // Limit each IP to 100 request per 'window'
}))

app.use('/category', routesCategory)
app.use('/clients', routesClient)
app.use('/products', routesProduct)
// app.get('/', async(req,res) => {
//     throw new Error('Kurwa mac')
// })
app.use(handleError);

app.listen(3001, '0.0.0.0', ()=> {
    console.log('Listening http://localhost:3001')
})