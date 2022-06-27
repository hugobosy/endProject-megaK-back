export interface Order {
    id?: string,
    date: string,
    products: string,
    total: number,
    payment: boolean,
    count: number
    client: string
}