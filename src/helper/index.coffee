fs = require "fs"
sysPath = require "path"

# utils 
pad = (num) ->
  if num<10 then "0"+num else num
  

extendOne = (obj, index ,item)->
  obj[index] = item
  # ...

    
    
  
  


module.exports = helper =
  colorify :require "./colorify"
  Parser: require "./parser"

  getLocalIP: () ->

  # formatting date
  formatDate: (d) ->
    d = new Date parseInt date unless typeOf(date) is "date" 
    "#{d.getFullYear()}-#{pad d.getMonth()+1}-#{pad d.getDate()}  #{pad d.getHours()}:#{pad d.getMinutes()}:#{pad d.getSeconds()}"

  # direct send static resource if exisits
  send: (path, res, type = "text/html") ->
    res.setHeader "Content-Type", type
    stream = fs.createReadStream path, encoding : 'utf8'
    stream.pipe res

  # credible type , no dom related version
  typeOf : (obj) ->
    if obj is null or obj is undefined then String obj 
    else Object::toString.call(obj).slice 8, -1
  # simple extend   
  extend: (obj1, obj2, override, callback = extendOne) ->
    callback(obj1, i, item) for i, item of obj2 when not obj1[i] or override
  merge: (obj1, obj2)->
    helper.extend(obj1, obj2, true)

  # just for deletting the addons's configure file
  requireFolder: (dir) ->
    files = fs.readdirSync dir
    $exports = {}

    files.forEach (file, index) ->
      unless sysPath.extname(file) is ".js" then return
      base = sysPath.basename file, ".js"
      $exports[base] = require sysPath.join dir, file
    $exports

    
    

    
    
  
  
  