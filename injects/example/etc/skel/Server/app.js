const express = require("express"),
app = express(),
async = require("async"),
exec = require("child_process").exec;
var getResult = null;

app.use((req, res, next)=>{
   res.setHeader("Content-Type", "text/html");
   if(getResult == null){
     async.parallel([function(callb){
        exec("gpio i2cdetect", function(err, result){
           callb(null, result);
        });
     }, function(callb){
        exec("forever list", function(err, result){
           callb(null, result);
        });
     }, function(callb){
         exec("gpio readall", function(err, result){
            callb(null, result);
         });
     }, function(callb){
         exec("uname -a", function(err, result){
            callb(null, result);
         });
     }, function(callb){
         exec("sudo ifconfig", function(err, result){
            callb(null, result);
         });
     }, function(callb){
         exec("lsusb", function(err, result){
            callb(null, result);
         });
     }, function(callb){
         exec("lsmod", function(err, result){
            callb(null, result);
         });
     }, function(callb){
         exec("cat /proc/modules", function(err, result){
            callb(null, result);
         });
     }], function(err, data){
       getResult = "<pre><h3>i2c</h3>\n"+data[0]+"<h3>Nodejs forver</h3>\n"+data[1]+"<h3>gpio readall</h3>\n"+data[2]+"<h3>uname</h3>\n"+data[3]+"<h3>ifconfig</h3>\n"+data[4]+"<h3>lsusb</h3>\n"+data[5]+"<h3>lsmod</h3>\n"+data[6]+"<h3>proc/modules</h3>\n"+data[7]+"</pre>";
       req.RESULT = getResult;
       next();
     });
   } else {
     req.RESULT = getResult;
      next();
   }
});

app.get("/", (req, res)=>{
  res.send(req.RESULT);
});
app.get("/err", (req, res)=>{
  throw new TypeError("Error Occured");
});
app.get("/next", (req, res, next)=>{
  next(null);
});
/* catch next() in chain */
app.use(function(req, res, next){
  res.send("<h3> Next in line </h3>");
});
/* Catch thown errors */
app.use(function(err, req, res, next){
  res.json({
    error : true,
    message : err.message,
    name : err.name
  });
});

app.listen(1374);

console.log("Listening on port 1374")
