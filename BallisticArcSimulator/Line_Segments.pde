class Line {
  float startX, startY, startZ, endX, endY, endZ;
  public Line (float time) {
    //t = time;
    endX = xCalc (time); //calculate the x position at time "t"
    endY = yCalc (time); //calculate the y position at time "t"
    endZ = zCalc (time); //calculate the z position at time "t"
    startX = xCalc (time - .01); //calculate the x position at previous time "t"
    startY = yCalc (time - .01); //calculate the y position at previous time "t"
    startZ = zCalc (time - .01); //calculate the z position at previous time "t"
  }
  public float xCalc (float t) {
    return -(xFunction(t) + xVectorField(t)); //add together the displacement and vector field for x
  }
  public float yCalc (float t) {
    return yFunction(t) + yVectorField(t); //add together the displacement and vector field for y
  }
  public float zCalc (float t) {
    return zFunction(t) + zVectorField(t); //add together the displacement and vector field for z
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
  
  private float xVectorField (float t) {
    return -t*t; //x component of vector at time "t"
  }
  private float yVectorField (float t) {
    return -3*t*t; //y component of vector at time "t"
  }
  private float zVectorField (float t) {
    return t*0; //z component of vector at time "t"
  }
  
  void show() {
    stroke(255);
    strokeWeight(2);
    line (startX, startY, startZ, endX, endY, endZ); //draw a line from the starting x,y,z to the ending x,y,z
  }
}
