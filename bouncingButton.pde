boolean isClicked = false;

float elX = 30;    
float elY = 40;
float elDiam = 20;


float elXSpeed = 4;    
float elYSpeed = 1.5;  

float lineYA = 25;
float lineYB = 375;
float lineXA = 25;
float lineXB = 475;

void setup() {
  size (500, 400);
}

void draw () {
  background(200);
  
  if (!isClicked) {
    fill(0);
    rect(175, 150, 150, 100);
  }

  elX += elXSpeed;
  elY += elYSpeed;
  fill(0);
  ellipse(elX, elY, elDiam, elDiam);
  
  //border hit detection
  if (elY > lineYB) {
    elYSpeed = elYSpeed * -1;
    elY = lineYB;
  }
  if (elY <lineYA) {
    elYSpeed = elYSpeed * -1;
    elY = lineYA;
  }
  if (elX > lineXB) {
    elXSpeed = elXSpeed * -1;
    elX = lineXB;
  }
  if (elX < lineXA) {
    elXSpeed = elXSpeed * -1;
    elX = lineXA;
  }
  //rectangle hit detection not quite working
  if ((elX > 175) && (elY > 150 && elY < 250)) {
    elXSpeed = elXSpeed * -1;
    elX = 175;
    fill(#00FFFD);
    rect(175, 150, 150, 100);
  }
  if ((elX < 325) && (elY > 150 && elY < 250)) {
    elXSpeed = elXSpeed * -1;
    elX = 325;
    fill(#00FFFD);
    rect(175, 150, 150, 100);
  }
  if ((elY > 150) && (elX > 175 && elX < 325)) {
    elYSpeed = elYSpeed * -1;
    elY = 150;
    fill(#00FFFD);
    rect(175, 150, 150, 100);
  }
  if ((elY < 250) && (elX > 175 && elX <325)) {
    elYSpeed = elYSpeed * -1;
    elY = 250;
    fill(#00FFFD);
    rect(175, 150, 150, 100);
  }
  
  line(lineXB, lineYB, lineXA, lineYB);
  line(lineXA, lineYA, lineXB, lineYA);
  line(lineXB, lineYB, lineXB, lineYA);
  line(lineXA, lineYA, lineXA, lineYB);

  if (mousePressed) {
    //if (isClicked = true); messes up the thingy when added
      if(mouseX > 175 && mouseX < 325 && mouseY > 150 && mouseY < 250) {
        fill(#00FFFD);
        rect(175, 150, 150, 100);
    }
  }
}

void keyPressed() {
  isClicked = false;
}