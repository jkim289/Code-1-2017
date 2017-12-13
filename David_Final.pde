import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

OpenCV opencv;
Movie myMovie;

PImage src, colorFilteredImage;

int STATE = 0;
int MAX_STATES = 2;
int playbackStartTime = 0;
int recordStartTime = -1;
int ellipseDrawIndex = 0;

//store color data
int rangeLow, rangeHigh;
int rangeTolerance = 3;
int hue = 25; // I got this number through trial and error. 

//contour - region of image that openCV pulls out for you
ArrayList<Contour> contours;
PVector lastPosition = new PVector();
int distanceTolerance = 40; // if the point is greater than this, don't record it
// the above line helps reduce unnecessary jitter

//used for storing the center of the tracked color
ArrayList<Time_Positions> positions;
//**ArrayList<timePositions> positions;

Rectangle ROI;

void setup() {
  size(1000, 400);
  myMovie = new Movie(this, "David480.mov");
  myMovie.loop();

  opencv = new OpenCV(this, 640, 360);
  contours = new ArrayList<Contour>();
  //positions = new ArrayList<PVector>();
  positions = new ArrayList<Time_Positions>();

  //color c = color(237, 187, 15); //color of blob
  //println("r: " + red(c) + " g: " + green(c) + " b: " + blue(c));
  //int hue = int(map(hue(c), 0, 255, 0, 100));
  //println("hue to detect: " + hue);

  //opencv wants a range of values (margin of error for color tracking)
  rangeLow = hue - rangeTolerance;
  rangeHigh = hue +rangeTolerance;

  ROI = new Rectangle(120, 60, 300, 180); //pretty wide range
}
void draw() {
  if (STATE == 0) {
    if (keyPressed) {
      // if you want to manually detect the hue, this is one way of doing it
      if (keyCode == UP) hue+=1;
      if (keyCode == DOWN) hue -=1;
      println(hue);
      rangeLow = hue - rangeTolerance;
      rangeHigh = hue +rangeTolerance;
    }
    if (myMovie.width > 0) recordState();
  } else if (STATE == 1) {
    playbackState();
  }
}
void recordState() {
  opencv.setROI(ROI.x, ROI.y, ROI.width, ROI.height);
  opencv.loadImage(myMovie);

  opencv.useColor();

  src = opencv.getSnapshot();

  //tell openCV to work in HSB color space
  opencv.useColor(HSB);

  //copy the hue channel of image into gray channel, which is then processed
  opencv.setGray(opencv.getH().clone());

  //filter image based on range of hue values that match the tracked object
  opencv.inRange(rangeLow, rangeHigh);

  //get the processed image for reference
  colorFilteredImage = opencv.getSnapshot();

  //find contours in range image (passing true sorts by descending area)
  contours = opencv.findContours(false, true);

  //display background images
  image(myMovie, 0, 0);
  image(src, ROI.x, ROI.y);
  image(colorFilteredImage, src.width + ROI.x *2, ROI.y);

  //check to make sure we've found any contours
  if (contours.size() > 0) {
    Contour biggestContour = contours.get(0);
    boolean doRecord = true;
    if (positions.size() > 0) {
      //on the first point, there's no lastPosition: it hasn't been recorded yet
      PVector currentPosition = new PVector(biggestContour.getBoundingBox().x, biggestContour.getBoundingBox().y);
      if (dist(currentPosition.x, currentPosition.y, lastPosition.x, lastPosition.y) > distanceTolerance) {
        // if there's too much space, openCV is probably detecting something that isn't the baton
        doRecord = false;
      }
    }
    if (doRecord) {
      //find bounding box of largest contour
      Rectangle r = biggestContour.getBoundingBox();

      //draw bounding box of object
      noFill();
      strokeWeight(2);
      stroke(255, 0, 0);
      rect(r.x + ROI.x, r.y + ROI.y, r.width, r.height);

      //draw dot in middle of bounding box on object
      noStroke();
      fill(255, 0, 0);
      ellipse(r.x + r.width/2 + ROI.x, r.y + r.height/2 + ROI.y, 30, 30);
      if (recordStartTime == -1) {
        recordStartTime = millis();
      }
      positions.add( new Time_Positions( r.x + r.width/2 + ROI.x, r.y + r.height/2 + ROI.y, millis() - recordStartTime));
      lastPosition = new PVector(r.x, r.y);
    }
  }
}

void playbackState() { //drawing code
  background(100);

  Time_Positions ellipsePosition = new Time_Positions(0, 0, 0);
  int currentTime = millis()%playbackStartTime;
  //draw path
  noFill();
  stroke(200, 200, 90);
  beginShape();
  for (int i = 0; i<positions.size(); i++) {
    Time_Positions lastPoint = (i>0) ? positions.get(i-1) : positions.get(i);
    Time_Positions tp = positions.get(i);
    Time_Positions nextPoint = (i<positions.size()-1) ? positions.get(i+1) : positions.get(i); //trinary operator: if this then that but if not this then that other thing
    curveVertex(tp.x, tp.y);
    
    if (currentTime >= lastPoint.time && currentTime <= nextPoint.time) {
       ellipsePosition = tp;
      //for(int j = i; j<i+10; j++) { //disappearing trace
      //  Time_Positions nextDownLinePoint = positions.get(j %positions.size() );
      // curveVertex(nextDownLinePoint.x, nextDownLinePoint.y);
     // }
    }
  }
  endShape();

  //move circle along path
  fill(0);
  noStroke();
  ellipse(ellipsePosition.x, ellipsePosition.y, 10, 10);
}

void mousePressed() {
  STATE++;
  STATE%=MAX_STATES;

  if (STATE == 0) {
    //reset playback and recording
    positions = new ArrayList<Time_Positions>();
    lastPosition = new PVector();
    myMovie.jump(0);
    myMovie.play();
    recordStartTime = -1;
  }

  if (STATE == 1) {
    myMovie.stop(); //will keep playing otherwise
    playbackStartTime = millis() - recordStartTime; //delay
  }
}
void movieEvent(Movie m) {
  m.read();
}