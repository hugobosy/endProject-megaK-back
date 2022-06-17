import {AdCategory} from "../../types";
import {ValidationError} from "../../utils/errors";
import {pool} from "../../utils/db";
import {FieldPacket} from "mysql2/promise";

type AdRecordResults = [AdCategory[], FieldPacket[]];

export class Category implements AdCategory {
    id: string;
    name: string;
    image: string;

    constructor(obj: Omit<AdCategory, 'add' | 'getAll'>) {
        if (!obj.name || obj.name.length > 50) {
            throw new ValidationError('Musisz podać nazwę kategorii lub nazwa kategorii przekracza 50 znaków!')
        }

        if (!obj.image || obj.image.length > 200) {
            throw new ValidationError('Musisz podać link do obrazka reprezentującego kategorię i ten link musi być ładny! (Nie przekroczy 200 znaków)')
        }

        this.id = obj.id;
        this.name = obj.name;
        this.image = obj.image;
    }

    async add(): Promise<void> {
        await pool.execute("INSERT INTO `category`(`id`, `name`, `image`) VALUES(:id, :name, :image)", this);
    }

    static async getAll(): Promise<AdCategory[] | null> {
        const [results] = await pool.execute("SELECT * FROM `category`") as AdRecordResults;
        return results.map(obj => new Category(obj))
    }
}

