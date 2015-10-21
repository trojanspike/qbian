var Gpio = require('onoff').Gpio,
sleep = require('sleep');

const GPIO23 = new Gpio(23, "out"),
GPIO24 = new Gpio(24, "out"),
GPIO18 = new Gpio(18, "out");

(function run(){

  GPIO23.writeSync(0);
  GPIO18.writeSync(0);
  GPIO24.writeSync(1);
  sleep.usleep( 2  * 1000000 );
  GPIO23.writeSync(1);
  GPIO18.writeSync(0);
  GPIO24.writeSync(0);
  sleep.usleep( 3  * 1000000 );
  GPIO23.writeSync(0);
  GPIO18.writeSync(1);
  GPIO24.writeSync(0);
  sleep.usleep( 3  * 1000000 );
  run();

})();
