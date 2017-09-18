void setup() {
  size(600, 600);
  fill(#F50505);
  rect(250, 50, 200, 100);
  fill(#1A7416);
  rect(250, 250, 200, 100);
  fill(#2D47C4);
  rect(250, 450, 200, 100);
}

void draw() {
  if(mousePressed) {
    if(mouseX > 250 && mouseX < 450 && mouseY > 50 && mouseY < 150) {
      text("I am a button.", 70, 100);
    }
    else if(mouseX > 250 && mouseX < 450 && mouseY > 250 && mouseY < 350) {
      text("I am also a button. A green one.", 30, 300);
    }
    else if(mouseX > 250 && mouseX < 450 && mouseY > 450 && mouseY < 550) {
      text("We will create an army to destroy you.", 20, 500);
    }
  }
}