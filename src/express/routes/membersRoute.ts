import express from 'express'
import { connectToDb } from '../../database/postgres'
import {QueryResult} from "pg";

export const router = express.Router()

router.get('/', async (req, res) => {
  const pool = await connectToDb()
  pool.query('SELECT * FROM members', (error: Error, results: QueryResult<JSON>) => {
    if (error) {
      throw error
    }
    res.status(200).json(results.rows)
  })
})

router.get('/:id', async (req, res) => {
  const pool = await connectToDb()
  pool.query(`SELECT *
              FROM members
              WHERE member_id = '${req.params.id}'`, (error: Error, results: QueryResult<JSON>) => {
    if (error) {
      throw error
    }
    res.status(200).json(results.rows)
  })
})
