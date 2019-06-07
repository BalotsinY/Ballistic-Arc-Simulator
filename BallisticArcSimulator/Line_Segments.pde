class Line {
  float startX, startY, startZ, endX, endY, endZ;
  public Line (float time) {
    //t = time;
    endX = xCalc (time); //calculate the x position at time "t"
    endY = yCalc (time); //calculate the y position at time "t"
    endZ = zCalc (time); //calculate the z position at time "t"
    startX = xCalc (time - res); //calculate the x position at previous time "t"
    startY = yCalc (time - res); //calculate the y position at previous time "t"
    startZ = zCalc (time - res); //calculate the z position at previous time "t"
  }
  public float xCalc (float t) {
    return -(xFunction(t) + xVectorField(xFunction(t), yFunction(t), zFunction(t))); //add together the displacement and vector field for x
    //This is negative in order to make the graph look more natural. By default, positive x goes in the opposite direction.
  }
  public float yCalc (float t) {
    return yFunction(t) + yVectorField(xFunction(t), yFunction(t), zFunction(t)); //add together the displacement and vector field for y
  }
  public float zCalc (float t) {
    return zFunction(t) + zVectorField(xFunction(t), yFunction(t), zFunction(t)); //add together the displacement and vector field for z
  }
  
  private float xFunction (float t) {
    return v0 * t * cos(theta); //x displacement after time "t"
  }
  private float yFunction (float t) {
    return v0 * t * sin(theta); //y displacement after time "t"
  }
  private float zFunction (float t) {
    return v0 * t * sin(phi) -  g * t * t / 2 + (0); //z displacement after time "t"
  }
  
  private float xVectorField (float x, float y, float z) { //x component of the vector field - manipulate the return statement for desired function
    return d*x; //x component of vector at time "t"
  }
  private float yVectorField (float x, float y, float z) { //y component of the vector field - manipulate the return statement for desired function
    return d*y; //y component of vector at time "t"
  }
  private float zVectorField (float x, float y, float z) { //z component of the vector field - manipulate the return statement for desired function
    return d*0; //z component of vector at time "t"
  }
  
  void show() {
    stroke(255);
    strokeWeight(3);
    line (startX, startY, startZ, endX, endY, endZ); //draw a line from the starting x,y,z to the ending x,y,z
  }
}
