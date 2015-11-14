var gpio = require("pi-gpio"),
usleep = require("sleep").usleep,
pin = 17,
_runs = 0;

gpio.open(pin, "output", function(err) {     // Open pin 16 for output
  var on = function(callb){
    gpio.write(pin, 1, callb);
  };
  var off = function(callb){
    gpio.write(pin, 0, callb);
  };
  console.log("Value 1400 holding voltage between 1v and 1.6v");
  (function  run(){
    usleep( 1400);
    on(function(){
      process.nextTick(function(){
        off(run);
      });
    });
  })();
});
