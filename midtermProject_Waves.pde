import processing.pdf.*;

Waves myWaves = new Waves();

void setup() {
  size(1650, 1275, PDF, "Waves.pdf"); //1600x900 for my laptop
  background(0);
}

void draw() {
  myWaves.display();
  if (frameCount > 3400) exit();
}