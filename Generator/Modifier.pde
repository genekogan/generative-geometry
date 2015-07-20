
void modifyExtrude(int distance, int chamfer, int hardEdgeChamfer, float threshAngle, float fuseAngle) {
  HEM_Extrude modifier=new HEM_Extrude();
  modifier.setDistance(distance);// extrusion distance, set to 0 for inset faces
  modifier.setRelative(false);// treat chamfer as relative to face size or as absolute value
  modifier.setChamfer(chamfer);// chamfer for non-hard edges
  modifier.setHardEdgeChamfer(hardEdgeChamfer);// chamfer for hard edges
  modifier.setThresholdAngle(threshAngle);// treat edges sharper than this angle as hard edges
  modifier.setFuse(true);// try to fuse planar adjacent planar faces created by the extrude
  modifier.setFuseAngle(fuseAngle);// threshold angle to be considered coplanar
  modifier.setPeak(true);//if absolute chamfer is too large for face, create a peak on the face
  mesh.modify(modifier);
}

void modifyNoise(int distance) {
  HEM_Noise modifier=new HEM_Noise();
  modifier.setDistance(distance);
  mesh.modify(modifier);
}

void modifyTwist(float angle) {
  WB_Line L;
  HEM_Twist modifier=new HEM_Twist();
  L=new WB_Line(100,0,0,0,0,1);
  modifier.setTwistAxis(L);// Twist axis
  //you can also pass the line as two points:  modifier.setBendAxis(0,0,-200,1,0,-200)
  modifier.setAngleFactor(angle);// Angle per unit distance (in degrees) to the twist axis
  // points which are a distance d from the axis are rotated around it by an angle d*angleFactor;
  mesh.modify(modifier);  
}

void modifyWireframe(float radius, int facets, float angleOffset, int maximumStrutOffset) {
  HEM_Wireframe modifier=new HEM_Wireframe();
  modifier.setStrutRadius(radius);// strut radius
  modifier.setStrutFacets(facets);// number of faces in the struts, min 3, max whatever blows up the CPU
  modifier.setMaximumStrutOffset(maximumStrutOffset);// limit the joint radius by decreasing the strut radius where necessary. Joint offset is added after this limitation.
  modifier.setAngleOffset(angleOffset);// rotate the struts by a fraction of a facet. 0 is no rotation, 1 is a rotation over a full facet. More noticeable for low number of facets.
  modifier.setTaper(false);// allow struts to have different radii at each end?
  mesh.modify(modifier);
  //mesh.modify(new HEM_Slice().setPlane(0,0,-50,0,0,1));
}

