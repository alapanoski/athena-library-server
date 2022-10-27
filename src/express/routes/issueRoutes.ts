import express from 'express'
import bodyParser from 'body-parser'
import { connectToDb } from '../../database/postgres'
import {QueryResult} from "pg";

export const router = express.Router()
router.use(bodyParser.urlencoded({ extended: true }))

router.get('/', async (req, res) => {
  const pool = await connectToDb()
  pool.query('SELECT * FROM issues', (error: Error, results: QueryResult<JSON>) => {
    if (error) {
      throw error
    }
    res.status(200).json(results.rows)
  })
})

router.post('/', async (req, res) => {
  const pool = await connectToDb()
  console.log(req.body)
  pool.query('SELECT * FROM issues', (error: Error, results: QueryResult<JSON>) => {
    if (error) {
      throw error
    }
    res.status(200).json(results.rows)
  })
})
