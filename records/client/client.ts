import {ClientType} from "../../types";
import {ValidationError} from "../../utils/errors";
import {pool} from "../../utils/db";
import {FieldPacket} from "mysql2/promise";

type AdRecordResults = [ClientType[], FieldPacket[]];

export class Client implements ClientType {
    address: string;
    birth: string;
    city: string;
    code: string;
    gender: string;
    id: string;
    email: string;
    name: string;
    phone: number;
    surname: string;
    ban: number;

    constructor(obj: ClientType) {
        // if (!obj.name || obj.name.length > 36 || obj.name.length < 3) {
        //     throw new ValidationError('Imię musi składać się min z 3 i maks 36 znaków')
        // }
        //
        // if (!obj.surname || obj.surname.length > 96 || obj.surname.length < 3) {
        //     throw new ValidationError('Nazwisko musi skłądać się z min 3 oraz maks 96 znaków')
        // }
        //
        // if (!obj.address || obj.address.length < 5 || obj.address.length > 150) {
        //     throw new ValidationError('Podaj prawidłowy adres wysyłkowy')
        // }
        //
        // if (!(obj.code.length === 6)) {
        //     throw new ValidationError('Kod pocztowy składa się łącznie z 6 znaków!')
        // }
        //
        // if (!obj.city || obj.city.length < 3 || obj.city.length > 70) {
        //     throw new ValidationError('Nazwa miasta w Polsce składa się z minimu 3 znaków oraz nie więcej niz 70 znaków')
        // }
        // if (!obj.phone || !(obj.phone.toString().length === 9)) {
        //     throw new ValidationError('Numer telefonu składa się z 9 cyfr !')
        // }
        // if (obj.gender === '-') {
        //     throw new ValidationError('Nie chcesz nam powiedzieć chyba, ze nie posiadasz płci ? :)')
        // }
        // if (obj.mail.indexOf('@') === -1) {
        //     throw new ValidationError('Email musi zawierać znak @')
        // }

        this.id = obj.id;
        this.name = obj.name;
        this.surname = obj.surname;
        this.address = obj.address;
        this.code = obj.code;
        this.city = obj.city;
        this.phone = obj.phone;
        this.gender = obj.gender;
        this.birth = obj.birth;
        this.email = obj.email;
        this.ban = obj.ban;
    }

    static async getAll(): Promise<ClientType[] | null> {
        const [result] = await pool.execute("SELECT * FROM `clients`") as AdRecordResults;
        return result.map((obj: ClientType) => new Client(obj))
    }

    async add(): Promise<void> {
        await pool.execute("INSERT INTO `clients`(`id`, `name`, `surname`, `address`, `code`, `city`, `phone`, `gender`, `birth`, `email`) VALUES(:id, :name, :surname, :address, :code, :city, :phone, :gender, :birth, :email)", this);
    }
}