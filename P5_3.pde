// Linea 96
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

//------------------------------------------------------------------------------------------
// Linea 263
// COLLISION RESPONSE
    if (collision)
    {
      fire = false; // remove bullet
      
      // Apicar impulso
      
      //Calcular lambda CalcularImpulso(...)
      //float CalcularImpulso
      float lambda = CalcularImpulso(colNormal, new PVector ( 0, bulletVel), boxVel, boxOmega, bulletMass, boxMass, boxInertia, PVector.sub(colPos, boxPos), restitution);
      PVector impulso = PVector.mult(colNormal, -lambda);
      boxVel.add(PVector.mult(impulso, 1.0/boxMass));
      boxOmega += (PVector.sub(colPos, boxPos).cross(impulso)).z/boxInertia;
    }
  }
