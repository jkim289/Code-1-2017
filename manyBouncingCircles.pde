//border
float lineYA = 25;
float lineYB = 375;
float lineXA = 25;
float lineXB = 475;
//arrays for circles
float[] elX = new float[2800];    
float[] elY = new float[2800];
float elDiam = 15;
float elRad = elDiam/2;
//corresponding arrays for speed
float[] elXSpeed = new float[2800];    
float[] elYSpeed = new float[2800];  
//rectangle dimensions
int rX = 175;
int rY = 150;
int rW = 150;
int rH = 100;

void setup() {
  size (500, 400);
 // background(#C6ECF2);
  for (int i = 0; i < 2800; i++) {
    elY[i] = random(25, 375);
    elX[i] = random(25, 475);
    elYSpeed[i] = random(1, 10);
    elXSpeed[i] = random(1, 10);
  }
}

void draw () {
  background(#C6ECF2);
  fill(0);
  rect(rX, rY, rW, rH);
  
  for (int i = 0; i < 2800; i++) {
    
    fill(#25F226);
    ellipse(elX[i], elY[i], elDiam, elDiam);
    
    elY[i] += elYSpeed[i];
    elX[i] += elXSpeed[i];

    //border hit detection
    if (elY[i] > lineYB) {
      elYSpeed[i] *= -1;
      elY[i] = lineYB;
    }
    if (elY[i] <lineYA) {
      elYSpeed[i] *= -1;
      elY[i] = lineYA;
    }
    if (elX[i] > lineXB) {
      elXSpeed[i] *= -1;
      elX[i] = lineXB;
    }
    if (elX[i] < lineXA) {
      elXSpeed[i] *= -1;
      elX[i] = lineXA;
    }
    //rectangle hit detection
    if((elX[i] > rX - elRad) && (elY[i] > rY - elRad) &&
       (elY[i] < rY + rH + elRad) && (elX[i] < rX + rW + elRad)
    ) { 
      if(elX[i] < rX) {
        elXSpeed[i] *= -1;
        elX[i] = rX - elRad;
      } else if(elX[i] > rX + rW) {
        elXSpeed[i] *= -1;
        elX[i] = rX + rW + elRad;
      } else if(elY[i] < rY) {
        elYSpeed[i] *= -1;
        elY[i] = rY - elRad;
      } else {
        elYSpeed[i] *= -1;
        elY[i] = rY + rH + elRad;
      }
    }
  }
  //could probably make this a rectangle but eh
  line(lineXB, lineYB, lineXA, lineYB);
  line(lineXA, lineYA, lineXB, lineYA);
  line(lineXB, lineYB, lineXB, lineYA);
  line(lineXA, lineYA, lineXA, lineYB);
}
