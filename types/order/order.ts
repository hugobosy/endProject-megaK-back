export interface Order {
    id?: string,
    date: Date,
    products: string[],
    total: number,
    payment: boolean,
}