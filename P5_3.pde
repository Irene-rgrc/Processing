float CollisionImpulse(PVector normal, PVector va, PVector posb, PVector vb, float wb, float ma, float mb, float inertiab, float rest)
{
  PVector wbvec = new PVector(0,0,wb);
  PVector vq = PVector.add(vb,wbvec.cross(posb));
  
  // (va-vb)
  PVector vrel = Pvector.sub(va,vq);
  
  // sa
  PVector sa = PVector.mult(normal, 1/ma);
  
  // sb
  PVector sb = PVector.add(PVector.mult(normal, 1/mb), PVector.mult((posb.cross(normal)).cross(posb), 1/inertiab));
  
  // return -(1 + e) * (normal*vel) / normal*(sa + sb)
  return -(1+rest)*PVector.dot(normal,vrel) /PVector.dot(normal, PVector.add(sa,sb));
}
