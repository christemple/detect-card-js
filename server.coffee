http = require 'http'
url = require 'url'
path = require('path');
fs = require 'fs'

http.createServer (request, response) ->

  uri = url.parse(request.url).pathname;
  filename = if uri is '/' then 'index.html' else path.join(process.cwd(), uri)

  response.writeHead 200, "Content-Type": "text/#{get_file_type(filename)}"
  fs.readFile filename, (error, contents) ->
    response.end contents

.listen 1337, "127.0.0.1"

console.log('Server running at http://127.0.0.1:1337/');

get_file_type = (file) ->
  return "html" if file.match(/\.html$/)
  return "javascript" if file.match(/\.js$/)
