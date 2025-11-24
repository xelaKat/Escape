class Ghost{
    float x, y;
    float speed;
    float size;

    Ghost(){ //skeleton for testing
        x = 500;
        y = 500;
        speed = final_speed/2;
        size = 10; //radius of the ghost (which is a circle)
    }

    void display(){
        fill(255,150);
        circle(x,y,size*2);
    }

    //check player position vs ghost position
    float player_right(float px, float gx){
        return px - gx;
    }
    float player_up(float py, float gy){
        return gy - py;
    } 

    //movement logic
    void move_right() { //move right
        x+=speed;
    }
     void move_left() { //move left
       x-=speed;
     }
      void move_up() { //move up
        y-=speed;
     }
     void move_down() { //move down
       y+=speed;
     } 

    void collision(){
        boolean overlapX = p1.x + p1.size >= x && p1.x - p1.size <= x + size;
        boolean overlapY = p1.y + p1.size >= y && p1.y - p1.size <= y + size;
        if (overlapX && overlapY) {
            game_over();
          }
    }
}