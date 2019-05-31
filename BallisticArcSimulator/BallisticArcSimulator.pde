import peasy.*;
PeasyCam CAM;
PeasyCam BUFFERCAM;
PGraphics buffer;

static float startT, endT, v0, theta, phi, g = 9.8, d;
/**
startT is the starting time, so 0
endT is the ending time, which is when the height (z) of the projectile is 0
v0 is the initial velocity
theta is the launch direction from the x axis in the clockwise direction
phi is the launch angle from the ground
g is the gravity constant
**/

float bounds = 500; //the size of just about everything
ArrayList <Line> lines; //arraylist of line objects
Line end;

void setup() {
  size(1920, 1080, P3D);  
  smooth();
  
  lines = new ArrayList <Line>(); //instantiate "line"

  //Camera setup - credit to peasycam
  CAM = new PeasyCam(this, bounds*bounds); //creates a camera at a distance of bounds^2, looking at the origin (0, 0, 0)
  CAM.rotateX(-45); //rotates the default view a little closer to what a person might actually use
  CAM.setMinimumDistance(bounds * 3); //set minimum distance
  CAM.setMaximumDistance(bounds * 10); //set maximum distance

  //segment setup
  v0 = 100; //set the initial velocity
  theta = PI/4; //set launch direction
  phi = PI/3; //set launch angle
  d = 0.005; //drag coefficient
  
  startT = 0;
  endT = (2*v0*sin(phi))/9.8; //calculate the time when the projectile hits the ground
  
  for (float i = startT; i < endT; i += .01) { //creates a small line for every .01 "t" - very high "resolution" of line thanks to that
    lines.add(new Line (i));
  }
  
  end = new Line (endT);
}

void draw() {
  background(0);
  lights();

  stroke(255, 0, 0);
  strokeWeight(2);
  textSize(bounds/10);
  line(0, 0, 0, -bounds * 2, 0, 0);//x axis
  text("x", -bounds * 2.25, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 0, bounds * 2);//y axis
  text("y", 0, bounds * 2.25, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, bounds * 2, 0);//z axis
  text("z", 0, 0, bounds * 2.25);
  
  text("BALLISTIC ARC SIMULATOR", 20, 20);
  text("Distance: " + round((float) Math.sqrt(Math.pow(end.endX, 2) + Math.pow(end.endY, 2))) + " meters", end.endX + 20, end.endY + 20);
  
  for(Line l : lines) { //draw all the lines
    l.show();
  }
}
