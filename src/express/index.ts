import express from 'express'
import { router as booksRouter } from './routes/booksRoutes'
import { router as authorsRouter } from './routes/authorsRoute'
import { router as membersRouter } from './routes/membersRoute'
import { router as issueRouter } from './routes/issueRoutes'

const app = express()
const port = 3000

app.use('/books', booksRouter)
app.use('/authors', authorsRouter)
app.use('/members', membersRouter)
app.use('/issue', issueRouter)

app.get('/', async (req, res) => {
  res.send('Umm please refer docs')
})

export class LibraryServer {
  init () {
    app.listen(port, () => {
      console.log(`Example app listening on port ${port}`)
    })
  }
}
