import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh;
WB_Render render;

int creator_ = 0;
int modifier_ = 0;

void setup() {
  size(800, 800, OPENGL);
  smooth(8); 
  render=new WB_Render(this);
}

void update() {

  // update creator
  if      (creator_ ==  0)  createSphere(200, 16, 16);
  else if (creator_ ==  1)  createBox(400, 60, 200, 14, 3, 20);
  else if (creator_ ==  2)  createCube(200, 4, 3, 2);
  else if (creator_ ==  3)  createCylinder(150, 50, 400, 7, 5);
  else if (creator_ ==  4)  createCone(200, 400, 7, 5);
  else if (creator_ ==  5)  createIcosahedron(200);
  else if (creator_ ==  6)  createDodecahedron(200);
  else if (creator_ ==  7)  createOctahedron(350);
  else if (creator_ ==  8)  createTetrahedron(350);
  else if (creator_ ==  9)  createGeodesic(1, 1, 200, 1); // class (1-5)
  else if (creator_ == 10)  createArchimedes(8, 100); //type (1-13)
  else if (creator_ == 11)  createPlato(2, 100); // type (1-5)
  else if (creator_ == 12)  createJohnson(91, 100); // type (1-92)
  else if (creator_ == 13)  createGrid(11, 11, 300, 500);
  else if (creator_ == 14)  createSuperDuper(256, 32, 50);
  else if (creator_ == 15)  createTorus(40, 200, 8, 64, 3);
  else if (creator_ == 16)  createSweepTube(20, 40, 8);
  else if (creator_ == 17)  createUVParametric(40, 40, 100);
  
  HET_Diagnosis.validate(mesh);
  
  // update modifer
  if      (modifier_ ==  0)  modifyExtrude(15, 10, 200, 1.5*HALF_PI, 0.05*HALF_PI);
  else if (modifier_ ==  1)  modifyNoise(20);
  else if (modifier_ ==  2)  modifyTwist(0.51);
  else if (modifier_ ==  3)  modifyWireframe(6, 6, 0.5, 20);

  HET_Diagnosis.validate(mesh);
}


void draw() {
  update();
  
  background(255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  translate(400, 400, 100);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);
  stroke(0);
  render.drawEdges(mesh);
  noStroke();
  render.drawFaces(mesh);
}

void keyPressed() {
  // creators
  if      (key=='1')  creator_ = 0;
  else if (key=='2')  creator_ = 1;
  else if (key=='3')  creator_ = 2;
  else if (key=='4')  creator_ = 3;
  else if (key=='5')  creator_ = 4;
  else if (key=='6')  creator_ = 5;
  else if (key=='7')  creator_ = 6;
  else if (key=='8')  creator_ = 7;
  else if (key=='9')  creator_ = 8;
  else if (key=='0')  creator_ = 9;
  else if (key=='-')  creator_ = 10;
  else if (key=='=')  creator_ = 11;
  else if (key=='!')  creator_ = 12;
  else if (key=='@')  creator_ = 13;
  else if (key=='#')  creator_ = 14;
  else if (key=='$')  creator_ = 15;
  else if (key=='%')  creator_ = 16;
  else if (key=='&')  creator_ = 17;
  else if (key=='*')  creator_ = 18;
  else if (key=='(')  creator_ = 19;
  else if (key==')')  creator_ = 20;
  else if (key=='_')  creator_ = 21;
  else if (key=='+')  creator_ = 22;  
  
  // modifiers
  else if (key=='q')  modifier_ = 0;
  else if (key=='w')  modifier_ = 1;
  else if (key=='e')  modifier_ = 2;
  else if (key=='r')  modifier_ = 3;
  else if (key=='t')  modifier_ = 4;
  else if (key=='y')  modifier_ = 5;
  else if (key=='u')  modifier_ = 6;
  else if (key=='i')  modifier_ = 7;
  else if (key=='o')  modifier_ = 8;
  else if (key=='p')  modifier_ = 9;
  else if (key=='[')  modifier_ = 10;
  else if (key==']')  modifier_ = 11;
}


