const exec = require('child_process').execSync,
sleep = require('sleep');
exec("gpio -g mode 12 out");
exec("gpio -g mode 16 out");
exec("gpio -g mode 20 out");
exec("gpio -g mode 21 out");

exec("gpio -g write 12 1");
sleep.usleep(500);
exec("gpio -g write 16 0");
sleep.usleep(500);
exec("gpio -g write 20 0");
sleep.usleep(500);
exec("gpio -g write 21 0");
sleep.usleep(500);
exec("gpio -g write 12 1");
sleep.usleep(500);
exec("gpio -g write 16 1");
sleep.usleep(500);
exec("gpio -g write 20 0");
sleep.usleep(500);
exec("gpio -g write 21 0");
sleep.usleep(500);
exec("gpio -g write 12 1");
sleep.usleep(500);
exec("gpio -g write 16 1");
sleep.usleep(500);
exec("gpio -g write 20 1");
sleep.usleep(500);
exec("gpio -g write 21 0");
sleep.usleep(500);
exec("gpio -g write 12 1");
sleep.usleep(500);
exec("gpio -g write 16 1");
sleep.usleep(500);
exec("gpio -g write 20 1");
sleep.usleep(500);
exec("gpio -g write 21 1");
sleep.usleep(500);

sleep.sleep(3);

(function cycle(){
exec("gpio -g write 12 0");
exec("gpio -g write 16 0");
exec("gpio -g write 20 0");
exec("gpio -g write 21 1");
console.log("0001 , 1 , 0x1");
sleep.usleep(2000);

exec("gpio -g write 12 0");
exec("gpio -g write 16 0");
exec("gpio -g write 20 1");
exec("gpio -g write 21 0");
console.log("0010 , 2 , 0x2");
sleep.usleep(2000);

exec("gpio -g write 12 0");
exec("gpio -g write 16 0");
exec("gpio -g write 20 1");
exec("gpio -g write 21 1");
console.log("0011 , 3 , 0x3");
sleep.usleep(2000);

exec("gpio -g write 12 0");
exec("gpio -g write 16 1");
exec("gpio -g write 20 0");
exec("gpio -g write 21 0");
console.log("0100 , 4 , 0x4");
sleep.usleep(2000);

exec("gpio -g write 12 0");
exec("gpio -g write 16 1");
exec("gpio -g write 20 0");
exec("gpio -g write 21 1");
console.log("0101 , 5 , 0x5");
sleep.usleep(2000);

exec("gpio -g write 12 0");
exec("gpio -g write 16 1");
exec("gpio -g write 20 1");
exec("gpio -g write 21 0");
console.log("0110 , 6 , 0x6");
sleep.usleep(2000);

exec("gpio -g write 12 0");
exec("gpio -g write 16 1");
exec("gpio -g write 20 1");
exec("gpio -g write 21 1");
console.log("0111 , 7 , 0x7");
sleep.usleep(2000);

exec("gpio -g write 12 1");
exec("gpio -g write 16 0");
exec("gpio -g write 20 0");
exec("gpio -g write 21 0");
console.log("1000 , 8 , 0x8");
sleep.usleep(2000);

exec("gpio -g write 12 1");
exec("gpio -g write 16 0");
exec("gpio -g write 20 0");
exec("gpio -g write 21 1");
console.log("1001 , 9 , 0x9");
sleep.usleep(2000);

exec("gpio -g write 12 1");
exec("gpio -g write 16 0");
exec("gpio -g write 20 1");
exec("gpio -g write 21 0");
console.log("1010 , 10 , 0xA");
sleep.usleep(2000);

exec("gpio -g write 12 1");
exec("gpio -g write 16 0");
exec("gpio -g write 20 1");
exec("gpio -g write 21 1");
console.log("1011 , 11 , 0xB");
sleep.usleep(2000);

exec("gpio -g write 12 1");
exec("gpio -g write 16 1");
exec("gpio -g write 20 0");
exec("gpio -g write 21 0");
console.log("1100 , 12 , 0xC");
sleep.usleep(2000);

exec("gpio -g write 12 1");
exec("gpio -g write 16 1");
exec("gpio -g write 20 0");
exec("gpio -g write 21 1");
console.log("1101 , 13 , 0xD");
sleep.usleep(2000);

exec("gpio -g write 12 1");
exec("gpio -g write 16 1");
exec("gpio -g write 20 1");
exec("gpio -g write 21 0");
console.log("1110 , 14 , 0xE");
sleep.usleep(2000);

exec("gpio -g write 12 1");
exec("gpio -g write 16 1");
exec("gpio -g write 20 1");
exec("gpio -g write 21 1");
console.log("1111 , 15 , 0xF");
sleep.usleep(2000);

exec("gpio -g write 12 0");
exec("gpio -g write 16 0");
exec("gpio -g write 20 0");
exec("gpio -g write 21 0");
console.log("0000 : 0 , 0x0");
sleep.usleep(2000);
exec("clear");
cycle();

})();
