const exec = require('child_process').execSync,
sleep = require('sleep');
exec("gpio -g mode 12 out");
exec("gpio -g mode 16 out");
exec("gpio -g mode 20 out");
exec("gpio -g mode 21 out");

(function cycle(){
	exec("gpio -g write 12 0");
	exec("gpio -g write 16 0");
	exec("gpio -g write 20 0");
	exec("gpio -g write 21 1");
	console.log("0001 , 1 , 0x1");
	sleep.usleep(1000);

	exec("gpio -g write 12 0");
	exec("gpio -g write 16 0");
	exec("gpio -g write 20 1");
	exec("gpio -g write 21 0");
	console.log("0010 , 2 , 0x2");
	sleep.usleep(1000);

	exec("gpio -g write 12 0");
	exec("gpio -g write 16 0");
	exec("gpio -g write 20 1");
	exec("gpio -g write 21 1");
	console.log("0011 , 3 , 0x3");
	sleep.usleep(1000);

	exec("gpio -g write 12 0");
	exec("gpio -g write 16 0");
	exec("gpio -g write 20 0");
	exec("gpio -g write 21 0");
	console.log("0000 : 0");
	sleep.usleep(4000);
	exec("clear");
	cycle();

})();
