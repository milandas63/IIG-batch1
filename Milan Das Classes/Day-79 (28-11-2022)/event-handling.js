var events = require('events');

var event_handler = new events.EventEmitter();

event_handler.on('pressed', function(name,age) {
    console.log("My event is handled!");
    console.log("Hello "+name+" you are "+age);
});

event_handler.emit('pressed','Milan','60');

event_handler.on('clicked', function(name,age) {
    console.log("We are students of Full Stack development!");
    console.log("Hello "+name+" you are "+age);
});

event_handler.emit('clicked','Ryan Dahl', '40');
