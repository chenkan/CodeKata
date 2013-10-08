// Usage
// 1. install node and libs
// 2. run 'node upload_file.js' to start server
// 3. run 'curl -F "upload=@/The/File/Path" http://localhost:8888/upload' to upload
// 4. Then you can see uploaded file under current dir
// 5. run 'curl localhost:8888' to show all uploaded files

var formidable = require('formidable');
var fs = require('fs');
http = require('http');
sys = require('sys');

http.createServer(function(req, res) {
  if (req.url == '/upload' && req.method.toLowerCase() == 'post') {
    var form = new formidable.IncomingForm();
    form.parse(req, function(err, fields, files) {
      res.writeHead(200, {'content-type': 'text/plain'});
      res.write('received upload:\n\n');
      sys.puts(files.upload.name);
      sys.puts(files.upload.path);
      // Copy tmp file to current folder
      fs.createReadStream(files.upload.path).pipe(fs.createWriteStream(files.upload.name));
      res.end(sys.inspect({fields: fields, files: files}));
    });
    return;
  }

  res.writeHead(200, {'content-type': 'text/html'});
  res.end(
    // List all files
    sys.inspect(fs.readdirSync("./"))
    // '<form action="/upload" enctype="multipart/form-data" '+
    // 'method="post">'+
    // '<input type="text" name="title"><br>'+
    // '<input type="file" name="upload" multiple="multiple"><br>'+
    // '<input type="submit" value="Upload">'+
    // '</form>'
  );
}).listen(8888);
