class Line {
  float startX, startY, startZ, endX, endY, endZ;
  //float t;
  public Line (float time) {
    //t = time;
    endX = xFunction (time);
    endY = yFunction (time);
    endZ = zFunction (time);
    startX = xFunction (time - .01);
    startY = yFunction (time - .01);
    startZ = zFunction (time - .01);
  }
  public float xFunction (float t) {
    //return **INSERT FUNCTION HERE**;
    return 2*t;
  }
  public float yFunction (float t) {
    //return **INSERT FUNCTION HERE**;
    //return t*2;
    return (float) Math.pow(t, 2);
  }
  public float zFunction (float t) {
    //return **INSERT FUNCTION HERE**;
    //return (float) -Math.pow(t, 2) + 5*t + 5;
    return 10 * sin(t);
  }
  
  void show() {
    stroke(255);
    strokeWeight(2);
    line (startX, startY, startZ, endX, endY, endZ);
  }
}
