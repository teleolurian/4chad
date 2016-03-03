request     = require 'request-promise'
_           = require 'lodash'
express     = require 'express'
app         = express()


pick = (array) ->
  array[Math.floor(Math.random() * array.length)]


app.get '/', (req, res) ->
  args =
    uri: 'http://api.4chan.org/r9k/1.json'
    json: true
  request(args)
    .then (result) ->
      res.send pick(pick(result.threads).posts).com
    .catch (err) ->
      res.send "Broke with error message: #{err}"


app.listen 3000, -> console.log 'Example app listening on port 3000!'




