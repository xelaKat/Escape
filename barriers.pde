class Barrier{
  float x;
  float y;
  float bwidth;
  float blength;
  float midx; //the x coord midpoint - used for hitbox logic
  float midy; //the y coord midpoint - used for hitbox logic
  
  Barrier(){ //skeleton for now
    x = 200;
    y = 100;
    bwidth = 5;
    blength = 200;
    midx = x + blength/2;
    midy = y + bwidth/2;
  }
  
  void display(){
    rect(x,y,blength,bwidth);
  }
}
