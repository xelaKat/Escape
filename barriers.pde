class Barrier{ //barriers! aka walls
  float x;
  float y;
  float bwidth; //how WIDE
  float blength; //how TALL
  float midx; //the barrier's x coord midpoint - used for collision logic
  float midy; //the barrier's y coord midpoint - used for collision logic
  float endx;
  float endy;
  
Barrier(float _x, float _y, float w, float l){ //skeleton for testing
    x = _x;
    y = _y;
    bwidth = w;
    blength = l;
    midx = x + blength/2;
    midy = y + bwidth/2;
    endx = x + blength;
    endy = y + bwidth;
  }
  
  void display(){ //displays barriers on screen
    rect(x,y,blength,bwidth);
  }
}

//barrier collision logic
boolean check(){ //checks if the player is touching the barrier
  for(Barrier b: map1){
    boolean overlapX = p1.x + p1.size >= b.x && p1.x - p1.size <= b.endx;
    boolean overlapY = p1.y + p1.size >= b.y && p1.y - p1.size <= b.endy;
      if (overlapX && overlapY)
        return true;
  }
  return false;
}
boolean check_right(){ //checks if the player is on the right of the barrier
  for(Barrier b: map1){
    if(abs(b.midx-p1.x)<=b.blength/2+p1.size && p1.x>=b.endx)
      return true;
  }
  return false;
}
boolean check_left(){ //checks if the player is on the left of the barrier
  for(Barrier b: map1){
    if(abs(b.midx-p1.x)<b.blength/2+p1.size+p1.speed && p1.x<=b.x)
      return true;
  }
  return false;
}
boolean check_up(){ //checks if the player is on the top of the barrier
  for(Barrier b: map1){
    if(abs(b.midy-p1.y)<b.bwidth/2+p1.size+p1.speed && p1.y<=b.y){
      return true;
    }
  }
  return false;
}
boolean check_down(){ //checks if the player is on the bottom of the barrier
  for(Barrier b: map1){
    if(abs(b.midy-p1.y)<b.bwidth/2+p1.size && p1.y>=b.endy){
      return true;
    }
  }
  return false;
}
