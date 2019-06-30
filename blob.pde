class Blob {
  PVector pos;
  float r;
  PVector vel;
  
  boolean mouse=false;

  Blob(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(1, 2));
    r = random(400, 800);
  }

  void update() {
    pos.add(vel); 
    if (pos.x >  mouseY || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y >  mouseY || pos.y < 0) {
      vel.y *= -1;
    }
  }

  void show() {
    noFill();
    stroke(0);
    strokeWeight(4);
    ellipse(pos.x, pos.y, r/20, r/20);
  }
}