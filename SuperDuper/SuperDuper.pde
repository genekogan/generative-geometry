import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh;
WB_Render render;

float m1, n11, n12, n13, m2, n21, n22, n23, t1, t2, d1, d2, c1, c2, c3;
float m1a, n11a, n12a, n13a, m2a, n21a, n22a, n23a, t1a, t2a, d1a, d2a, c1a, c2a, c3a;
float m1b, n11b, n12b, n13b, m2b, n21b, n22b, n23b, t1b, t2b, d1b, d2b, c1b, c2b, c3b;
float[] w;

HEC_SuperDuper creator;

void setup() {
  size(1080, 1080, OPENGL);
  smooth(8);
  // This is bitcraft's super duper shape explorer in hemesh format.
  // http://www.openprocessing.org/visuals/?visualID=2638
  // http://www.k2g2.org/blog:bit.craft:superdupershape_explorer
  
  creator = new HEC_SuperDuper();
  render=new WB_Render(this);
  float z = 0.5;
  w = new float[20];
  for (int i=0; i<20; i++) {
    w[i] = random(z*0.05, z*0.08);
  } 
}

void draw() {
    
  int u = 2048;
  int rad = (int) map(sin(w[10]*frameCount+5), -1, 1, 55, 60);
  creator.setU(u);
  creator.setV(256);
  creator.setUWrap(true); // needs to be set manually
  creator.setVWrap(false); // needs to be set manually
  creator.setRadius(rad);
   
  //use any of these to set parameters
  //creator.setDonutParameters(0, 10, 10, 10, 5, 6, 12, 12,  3, 1);// parameters m1, n11, n12, n13, m2, n21, n22, n23, t, c
  //creator.setShellParameters(0, 10, 0, 0, 0, 10, 0, 0, 2, 1, 1, 5);// parameters m1, n11, n12, n13, m2, n21, n22, n23, t, d1, d2, c
  // creator.setSuperShapeParameters(4, 10, 10, 10, 4, 10,10, 10);// parameters m1, n11, n12, n13, m2, n21, n22, n23
  //HET_Diagnosis.validate(mesh);



 
  

  m1 = 0;
  n11 = map(sin(w[1]*frameCount+5), -1, 1, n11a, n11b); //11;
  n12 = map(sin(w[0]*frameCount+45), -1, 1, n12a, n12b); //0.5;
  
  n13 = map(sin(w[2]*frameCount+15), -1, 1, n13a, n13b);
  m2 = map(sin(w[3]*frameCount+25), -1, 1, m2a, m2b);
  n21 = map(sin(w[4]*frameCount+65), -1, 1, n21a, n21b);
  n22 = map(sin(w[5]*frameCount+35), -1, 1, n22a, n22b);
  n23 = map(sin(w[6]*frameCount+55), -1, 1, n23a, n23b);
  t1 = map(sin(w[8]*frameCount+55), -1, 1, t1a, t1b);
  t2 = map(sin(w[7]*frameCount+55), -1, 1, t2a, t2b);
  d1 = map(sin(w[9]*frameCount+55), -1, 1, d1a, d2b);
  d2 = 0;
  c1 = map(sin(w[6]*frameCount+55), -1, 1, c1a, c1b);
  c2 = map(sin(w[14]*frameCount+55), -1, 1, c2a, c2b);
  c3 = 2.2;
//
//creator.setGeneralParameters(0, 11, 0.5, 0,13, 10, 15, 10, 4, 0, 0, 0, 5, 0.3, 2.2);// parameters m1, n11, n12, n13, m2, n21, n22, n23, t1, t2, d1, d2, c1, c2, c3
  creator.setGeneralParameters(m1, n11, n12, n13, m2, n21, n22, n23, t1, t2, d1, d2, c1, c2, c3);// parameters m1, n11, n12, n13, m2, n21, n22, n23, t1, t2, d1, d2, c1, c2, c3
  // creator.setGeneralParameters(0, 10, 0, 0,6, 10, 6, 10, 3, 0, 0, 0, 4, 0.5, 0.25);
  mesh=new HE_Mesh(creator); 

float mx = map(0.1*sin(w[11]*frameCount+55), -1, 1, 0, TWO_PI);
float my = map(0.1*sin(w[10]*frameCount+105), -1, 1, 10,TWO_PI);
float mz = map(0.1*sin(w[12]*frameCount+105), -1, 1, 10,TWO_PI);

  background(255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  translate(width/2, height/2, 100);
  rotateY(mx);
  rotateX(my);
  rotateZ(mz);
  noStroke();
  render.drawFaces(mesh);
  
  saveFrame("data/frame#####.png");
  
  
  if (frameCount % 900 == 1) {
    
     n11a = random(5, 8);
    n11b = random(15, 25);
    
    n12a = random(-3,-1);
    n12b = random(1, 3);
    
    n13a = random(0.1, 1);
    n13b = random(3, 7);
    
    m2a = random(3, 10);
    m2b = random(10, 25);
    
    n21a = random(5, 12);
    n21b = random(10, 25);
    
    n22a = random(5, 12);
    n22b = random(10, 25);
    
    n23a = random(5, 12);
    n23b = random(10, 25);
    
    t1a = random(1, 2);
    t1b = random(2, 5);
    
    t2a = random(1);
    t2b = random(3);
    
    d1a = random(1);
    d1b = random(1.5);
    
    c1a = random(2, 5);
    c1b = random(5, 7);
    
    c2a = random(0.5);
    c2b = random(0.4, 1.0);
    
    
    
    float z = 0.5;
      w = new float[20];
  for (int i=0; i<20; i++) {
    w[i] = random(z*0.05, z*0.08);
  }
  }  
  
}


