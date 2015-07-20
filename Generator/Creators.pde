// todo:
// - HEMC_Panelizer, HEMC_Voronoi spheres

void createSphere(int radius, int ufacets, int vfacets) {
  HEC_Sphere creator=new HEC_Sphere();
  creator.setRadius(radius); 
  creator.setUFacets(ufacets);
  creator.setVFacets(vfacets);
  mesh=new HE_Mesh(creator); 
}  

void createBox(int width_, int height_, int depth_, int wseg, int hseg, int dseg) {
  HEC_Box creator=new HEC_Box();
  creator.setWidth(width_).setHeight(height_).setDepth(depth_); 
  creator.setWidthSegments(wseg).setHeightSegments(hseg).setDepthSegments(dseg);
  mesh=new HE_Mesh(creator); 
}

void createCube(int edge, int wseg, int hseg, int dseg) {
  HEC_Cube creator=new HEC_Cube();
  creator.setEdge(edge); 
  creator.setWidthSegments(wseg).setHeightSegments(hseg).setDepthSegments(dseg);
  mesh=new HE_Mesh(creator);
}

void createCylinder(int radius1, int radius2, int height_, int facets, int steps) {
  HEC_Cylinder creator=new HEC_Cylinder();
  creator.setRadius(radius1, radius2); // upper and lower radius. If one is 0, HEC_Cone is called. 
  creator.setHeight(height_);
  creator.setFacets(facets).setSteps(steps);
  creator.setCap(true,true);// cap top, cap bottom?
  creator.setZAxis(0,1,1);
  mesh=new HE_Mesh(creator); 
}

void createCone(int radius, int height_, int facets, int steps) {
  HEC_Cone creator=new HEC_Cone();
  creator.setRadius(radius).setHeight(height_); 
  creator.setFacets(facets).setSteps(steps);
  creator.setCap(true);
  creator.setReverse(false);// flip cone?
  //Default axis of the cone is (0,1,0). To change this use the HEC_Creator method setZAxis(..).
  creator.setZAxis(0,0,1);
  mesh=new HE_Mesh(creator); 
}

void createIcosahedron(int edge) {
  HEC_Icosahedron creator=new HEC_Icosahedron();
  creator.setEdge(edge); 
  mesh=new HE_Mesh(creator); 
}

void createDodecahedron(int edge) {
  HEC_Dodecahedron creator=new HEC_Dodecahedron();
  creator.setEdge(edge); 
  mesh=new HE_Mesh(creator); 
}

void createOctahedron(int edge) {
  HEC_Octahedron creator=new HEC_Octahedron();
  creator.setEdge(edge); 
  mesh=new HE_Mesh(creator); 
}

void createTetrahedron(int edge) {
  HEC_Tetrahedron creator=new HEC_Tetrahedron();
  creator.setEdge(edge); 
  mesh=new HE_Mesh(creator); 
}

void createGeodesic(int B, int C, int radius, int type) {
  HEC_Geodesic creator=new HEC_Geodesic();
  creator.setRadius(radius); 
  // http://stackoverflow.com/questions/3031875/math-for-a-geodesic-sphere
  // N=B+C=number of divisions
  // B=N and C=0 or B=0 and C=N: class I
  // B=C=N/2: class II
  // Other: class III 
  creator.setB(B);
  creator.setC(C);

  // class I, II and III: TETRAHEDRON,OCTAHEDRON,ICOSAHEDRON
  // class II only: CUBE, DODECAHEDRON
  if      (type == 1)  creator.setType(HEC_Geodesic.ICOSAHEDRON);
  else if (type == 2)  creator.setType(HEC_Geodesic.OCTAHEDRON);
  else if (type == 3)  creator.setType(HEC_Geodesic.ICOSAHEDRON);
  else if (type == 4 && B==C)  creator.setType(HEC_Geodesic.CUBE);
  else if (type == 5 && B==C)  creator.setType(HEC_Geodesic.DODECAHEDRON);
  else                 creator.setType(HEC_Geodesic.ICOSAHEDRON);
  mesh=new HE_Mesh(creator); 
}

void createArchimedes(int type, int edge) {
  HEC_Archimedes creator=new HEC_Archimedes();
  creator.setEdge(edge); // edge length of the polyhedron
  creator.setType(type);// type of archimedean solid, 1 to 13
  println(creator.getName());// retrieve name of current polyhedron
  mesh=new HE_Mesh(creator); 
}

void createPlato(int type, int edge) {
  HEC_Plato creator=new HEC_Plato();
  creator.setEdge(edge); // edge length of the polyhedron
  creator.setType(2);// type of platonian solid, 1 to 5
  println(creator.getName());// retrieve name of current polyhedron
  mesh=new HE_Mesh(creator); 
}

void createJohnson(int type, int edge) {
  HEC_Johnson creator=new HEC_Johnson();
  creator.setEdge(edge); // edge length of the polyhedron
  creator.setType(type);// type of platonian solid, 1 to 92
  mesh=new HE_Mesh(creator);
}

void createGrid(int sizex, int sizey, int width_, int height_) {
  float[][] values=new float[sizex][sizey];
  for (int j = 0; j < sizex; j++) {
    for (int i = 0; i < sizey; i++) {
      values[i][j]=200*noise(0.35*i, 0.35*j);
    }
  }

  HEC_Grid creator=new HEC_Grid();
  creator.setU(sizex-1);// number of cells in U direction
  creator.setV(sizey-1);// number of cells in V direction
  creator.setUSize(width_);// size of grid in U direction
  creator.setVSize(height_);// size of grid in V direction
  creator.setWValues(values);// displacement of grid points (W value)
  mesh=new HE_Mesh(creator);
}

void createSuperDuper(int u, int v, int radius) {
  HEC_SuperDuper creator=new HEC_SuperDuper();
  creator.setU(u);
  creator.setV(v);
  creator.setUWrap(true); // needs to be set manually
  creator.setVWrap(false); // needs to be set manually
  creator.setRadius(radius);
   
  //use any of these to set parameters
  creator.setDonutParameters(0, 10, 10, 10, 5, 6, 12, 12,  3, 1);// parameters m1, n11, n12, n13, m2, n21, n22, n23, t, c
  //creator.setShellParameters(0, 10, 0, 0, 0, 10, 0, 0, 2, 1, 1, 5);// parameters m1, n11, n12, n13, m2, n21, n22, n23, t, d1, d2, c
  // creator.setSuperShapeParameters(4, 10, 10, 10, 4, 10,10, 10);// parameters m1, n11, n12, n13, m2, n21, n22, n23
  //creator.setGeneralParameters(0, 11, 0, 0,13, 10, 15, 10, 4, 0, 0, 0, 5, 0.3, 2.2);// parameters m1, n11, n12, n13, m2, n21, n22, n23, t1, t2, d1, d2, c1, c2, c3
  // creator.setGeneralParameters(0, 10, 0, 0,6, 10, 6, 10, 3, 0, 0, 0, 4, 0.5, 0.25);
  mesh=new HE_Mesh(creator); 
}

void createTorus(int radius1, int radius2, int tubeFacets, int torusFacets, int twists) {
  HEC_Torus creator=new HEC_Torus();
  creator.setRadius(radius1,radius2); 
  creator.setTubeFacets(tubeFacets);
  creator.setTorusFacets(torusFacets);
  creator.setTwist(twists);//twist the torus a given number of facets
  mesh=new HE_Mesh(creator); 
}

void createSweepTube(int radius, int steps, int facets) {
  WB_BSpline C;
  WB_Point[] points;

  //Generate a BSpline
  points=new WB_Point[11];
  for (int i=0;i<11;i++) {
    points[i]=new WB_Point(5*(i-5)*(i-5), -200+40*i, 0);
  }
  C=new WB_BSpline(points, 4);

  HEC_SweepTube creator=new HEC_SweepTube();
  creator.setCurve(C);//curve should be a WB_BSpline
  creator.setRadius(radius);
  creator.setSteps(steps);
  creator.setFacets(facets);
  creator.setCap(true, true); // Cap start, cap end?

  mesh=new HE_Mesh(creator); 
}

void createUVParametric(int u, int v, int radius) {
  HEC_UVParametric creator=new  HEC_UVParametric();
  creator.setUVSteps(40, 40);
  creator.setRadius(100); //scaling factor
  creator.setUWrap(true); // needs to be set manually
  creator.setVWrap(true); // needs to be set manually
  creator.setEvaluator(new UVFunction());// expects an implementation of the WB_Function2D<WB_Point3d> interface, taking u and v from 0 to 1
  mesh=new HE_Mesh(creator);
}
class UVFunction implements WB_Function2D<WB_Point> {
  WB_Point f(double u, double v) {
    double pi23=2*Math.PI/3;
    double ua=Math.PI*2*u;
    double va=Math.PI*2*v;
    double sqrt2=Math.sqrt(2.0d);
    double px = Math.sin(ua) / Math.abs(sqrt2+ Math.cos(va));
    double py = Math.sin(ua+pi23) / Math.abs(sqrt2 +Math.cos(va + pi23));
    double pz = Math.cos(ua-pi23) / Math.abs(sqrt2 +Math.cos(va - pi23));
    return new WB_Point(px, py, pz);
  }
}

