import {AdCategory} from "../../types";
import {ValidationError} from "../../utils/errors";
import {pool} from "../../utils/db";
import {FieldPacket} from "mysql2";

type AdRecordResults = [AdCategory[], FieldPacket[]];

export class AddCategory implements AdCategory {
    id: string;
    name: string;
    image: string;

    constructor(obj: AdCategory) {
        if (!obj.name || obj.name.length > 50) {
            throw new ValidationError('Musisz podać nazwę kategorii lub nazwa kategorii przekracza 50 znaków!')
        }

        if (!obj.image || obj.image.length > 100) {
            throw new ValidationError('Musisz podać link do obrazka reprezentującego kategorię i ten link musi być ładny! (Nie przekroczy 100 znaków)')
        }

        this.id = obj.id;
        this.name = obj.name;
        this.image = obj.image;
    }

    static async getOne(id: string): Promise<AdCategory | null> {
        const [results] = await pool.execute("SELECT * FROM `category` WHERE id = :id", {
            id,
        }) as AdRecordResults;

        return results.length === 0 ? null : new AddCategory(results[0])
    }

}

