import dotenv from 'dotenv'

import { Pool } from "pg";

dotenv.config()

export const connectToDb = async () => {
  return new Pool({
    user: process.env.POSTGRES_USERNAME,
    host: process.env.POSTGRES_HOST,
    database: process.env.POSTGRES_DATABASE,
    password: process.env.POSTGRES_PASSWORD,
    port: <number><unknown> process.env.POSTGRES_PORT,
    ssl: {
      rejectUnauthorized: false
    }
  })
}
