const express = require('express');
const redis = require('redis');

const app = express();

// This host name isn't a redis thing in fact redis has no clue what it is
// When you send the request out docker will see it and redirect it to the container with that name
const client = redis.createClient({
  host: 'redis-server',
  port: 6379
});

client.set('visits', 0)

app.get('/', (req,res) => {
  // exit with 0 means everything is ok
  // exit with any other number means error occurred
  client.get('visits', (err, visits) => {
    res.send('Number of visits is ' + visits)
    client.set('visits', parseInt(visits) + 1)
  })
})

app.listen(8081, () => {
  console.log('Listening on port 8081')
})