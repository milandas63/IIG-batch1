var events = require('events');
var util = require('util');

var Student = function(name) {
    this.name = name;
}

util.inherits(Student, events.EventEmitter);

var sandip = new Student('Sandip');
sandip.on('exam', function(marks) {
    console.log(sandip.name+" has secured "+marks+" marks");
});
sandip.emit('exam', 10);


var x = new Student('Milan');
x.on('failed', function(marks) {
    console.log(x.name+' failed');
})
x.emit('failed');
