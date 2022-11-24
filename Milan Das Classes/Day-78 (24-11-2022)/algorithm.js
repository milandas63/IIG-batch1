//module.exports = {
const myModule = {
    hello : function() {
        return "Hello";
    },
    oddNo : function(n) {
        if(n%2==0) return false;
        else return true;
    },
    evenNo : function(n) {
        if(n%2==0) return true;
        else return false;
    },
    primeNo : function(n) {
        var retval = true;
        for(var i=2; i<(n/2); i++) {
            if(n%2==0) {
                retval = false;
                break;
            }
        }
        return retval;
    }
}
module.exports = myModule;

