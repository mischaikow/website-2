const express = require('express')
const cors = require('cors')

const app = express()
const api_key = process.env.API_KEY
const domain = process.env.DOMAIN

app.use(cors())
app.use(express.json())

app.get('/', (req, res) => {
  res.send('Backend is up')
})

app.get('/api/', (req, res) => {
  console.log('Backend is communicating')
})

const PORT = 5000
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})
