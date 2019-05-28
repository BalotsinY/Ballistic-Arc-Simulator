import peasy.*;
PeasyCam CAM;
PeasyCam BUFFERCAM;
PGraphics buffer;

float bounds = 400;

void setup() {
  size(1920, 1080, P3D);  
  smooth();

  // Camera setup - credit to Greg Hilmes at https://github.com/GregHilmes/RubiksCube/blob/master/RubiksCube.pde
  CAM = new PeasyCam(this, 600);
  CAM.setResetOnDoubleClick(false);
  CAM.setMinimumDistance(bounds * 1.5); //set minimum distance
  CAM.setMaximumDistance(bounds * 5); //set maximum distance

  buffer = createGraphics(width, height, P3D);
  BUFFERCAM = new PeasyCam(this, buffer, 600);
  BUFFERCAM.setResetOnDoubleClick(false);
  BUFFERCAM.setMinimumDistance(500);
  BUFFERCAM.setMaximumDistance(1500);
  
  //segment setup
}

void draw() {
  background(0);
  lights();

  noFill();
  stroke(255);
  strokeWeight(2);
  box(bounds);
  translate(-bounds/2, bounds/2, bounds/2);
  
  strokeWeight(5);
  stroke(0, 0, 255);
  point(0,0,0);
}
