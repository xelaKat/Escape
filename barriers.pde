class Barrier{ //barriers! aka walls
  float x;
  float y;
  float bwidth; //how WIDE
  float blength; //how TALL
  float midx; //the barrier's x coord midpoint - used for collision logic
  float midy; //the barrier's y coord midpoint - used for collision logic
  
  Barrier(){ //skeleton for testing
    x = 500;
    y = 100;
    bwidth = 775;
    blength = 5;
    midx = x + blength/2;
    midy = y + bwidth/2;
  }
  
  void display(){ //displays barriers on screen
    rect(x,y,blength,bwidth);
  }
}

//barrier collision logic
boolean check_horizontal(){ //checks if the player is in the x range of the barrier
  boolean check = false;
  for(Barrier b: map1){
    if(abs(b.midx-p1.x)<=b.blength/2+p1.size){
      check = true;
    }
  }
  return check;
}
boolean check_right(){ //checks if the player is touching the right of the barrier
  boolean check = false;
  for(Barrier b: map1){
    if(abs(b.midx-p1.x)<=b.blength/2+p1.size && p1.x>=b.midx){
      check = true;
    }
  }
  return check;
}
boolean check_left(){ //checks if the player is touching the left of the barrier
  boolean check = false;
  for(Barrier b: map1){
    if(abs(b.midx-p1.x)<b.blength/2+p1.size+p1.speed && p1.x<=b.x){
      check = true;
    }
  }
  return check;
}
boolean check_vertical(){ //checks if the player is in the y range of the barrier
  boolean check = false;
  for(Barrier b: map1){
    if(abs(b.midy-p1.y)<b.bwidth/2+p1.size){
      check = true;
    }
  }
  return check;
}
boolean check_up(){ //checks if the player is touching the top of the barrier
  boolean check = false;
  for(Barrier b: map1){
    if(abs(b.midy-p1.y)<b.bwidth/2+p1.size+p1.speed && p1.y<=b.y){
      check = true;
    }
  }
  return check;
}
boolean check_down(){ //checks if the player is touching the bottom of the barrier
  boolean check = false;
  for(Barrier b: map1){
    if(abs(b.midy-p1.y)<b.bwidth/2+p1.size-p1.speed && p1.y>=b.midy){
      check = true;
    }
  }
  return check;
}
