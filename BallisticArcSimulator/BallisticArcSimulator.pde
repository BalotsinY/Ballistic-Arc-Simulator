import peasy.*;
PeasyCam CAM;
PeasyCam BUFFERCAM;
PGraphics buffer;

float startT, endT;

float bounds = 50;
ArrayList <Line> lines;

void setup() {
  size(1920, 1080, P3D);  
  smooth();
  
  lines = new ArrayList <Line>();

  // Camera setup - credit to Greg Hilmes at https://github.com/GregHilmes/RubiksCube/blob/master/RubiksCube.pde
  CAM = new PeasyCam(this, 100);
  CAM.setResetOnDoubleClick(true);
  CAM.setMinimumDistance(bounds * 3); //set minimum distance
  CAM.setMaximumDistance(bounds * 5); //set maximum distance

  buffer = createGraphics(width, height, P3D);
  BUFFERCAM = new PeasyCam(this, buffer, 100);
  BUFFERCAM.setResetOnDoubleClick(true);
  BUFFERCAM.setMinimumDistance(bounds * 3);
  BUFFERCAM.setMaximumDistance(bounds * 5);
  
  //segment setup
  startT = -10;
  endT = 10;
  for (float i = startT + .1; i < endT; i += .01) {
    lines.add(new Line (i));
  }
}

void draw() {
  background(0);
  lights();

  stroke(255, 0, 0);
  strokeWeight(2);
  line(0, 0, 0, bounds * 2, 0, 0);//x axis
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 0, bounds * 2);//y axis
  stroke(0, 0, 255);
  line(0, 0, 0, 0, bounds * 2, 0);//z axis
  
  for(Line l : lines) {
    l.show();
  }
}
