
for(i=2; i<10; i++) {
    for(j=0; j<=10; j++) {
        console.log(padL(i,3) + " x " + padL(j,2) + " = " + padL((i*j),3));
    }
    console.log();
}
console.log();

function padL(n,l) {
    buffer = ""+n;
    for(k=buffer.length; k<l; k++) {
        buffer = " " + buffer;
    }
    return buffer;
}