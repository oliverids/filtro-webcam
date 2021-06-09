import processing.video.*;
Capture video;
boolean mirror;


void setup() {
  size(1000, 700);
  video = new Capture(this, width, height);
  video.start();
  mirror = false;
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  for ( int i = 0; i < 7000; i++) { 
    float x = random(width);
    float y = random(height);
    float f = random(1, 5);
    int index;

    if (mirror) {
      index = (int) y * width + (int) x;
    } else {
      index = (int) (video.width - (int)x - 1) + (int) y * video.width;
    }

    float r = red(video.pixels[index]);
    float g = green(video.pixels[index]);
    float b = blue(video.pixels[index]);

    noStroke();
    fill(r*f/2, g, b*f);
    circle(x, y, 5);
  }
}

void keyPressed() {
  if (key == 'm' || key == 'M') {
    mirror = !mirror;
  }
}
