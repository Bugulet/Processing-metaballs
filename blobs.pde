Blob[] blobs = new Blob[20];

void setup() {
  size(1200, 700);
 // colorMode(HSB);
  //fullScreen();
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
  blobs[0].mouse=true;
}

void draw() {
  background(0);

  if(mousePressed)
  {
    for(Blob b:blobs)
    b.r=mouseY*3;
  }
  

  loadPixels();
  blobs[0].pos.x=mouseX;
  blobs[0].pos.y=mouseY;
  for (int x = 0; x < mouseY; x++) {
    
    for (int y = 0; y <  mouseY; y++) {
      int index = x + y * width;
      float sum = 0;
      
      
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 3 * b.r / d;

        
      }
      
      
        
        if(sum>100 && sum<105)
        sum=255;
        else sum=0;
        
        pixels[index] = color(sum,sum, sum);
      
     // if(sum>=300)
       // pixels[index] = color(50, 255, 255);
    }
  }

  updatePixels();

  for (Blob b : blobs) {
    b.update();
    //b.show();
  }
}