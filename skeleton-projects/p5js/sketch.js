var debugText = textStackFn(20, 40, 20);

function setup(){
    createCanvas(1200, 800);
}

function draw(){
    background(120);
    debugText("frame rate: ", int(frameRate()));
}
