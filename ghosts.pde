class Ghost{
    float x, y;
    float speed;
    float size;

    Ghost(){ //default
        x = 400;
        y = 400;
        speed = final_speed/2;
        size = 20; //radius of the ghost (which is a circle)
    }

    Ghost(float _x, float _y){ //controls where it spawns
        x = _x;
        y = _y;
        speed = final_speed/2;
        size = 20; //radius of the ghost (which is a circle)
    }

    Ghost(float _x, float _y, float s, float sz){ //controls all aspects of the ghost
        x = _x;
        y = _y;
        speed = s;
        size = sz; //radius of the ghost (which is a circle :) )
    }

    void display(){
        fill(255,150);
        circle(x,y,size*2);

        textSize(size*3/2); //makes text proportional to the ghost size
        fill(0);
        text(">:)", x,y+textWidth(">")/2); //ghosts are evil! >:)
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
        if(!tutorial){
            x+=speed;
        }
    }
     void move_left() { //move left
        if(!tutorial){
            x-=speed;
        }
     }
      void move_up() { //move up
        if(!tutorial){
            y-=speed;
        }
     }
     void move_down() { //move down
        if(!tutorial){
            y+=speed;
       }
     } 

    void collision(){
        if (dist(p1.x, p1.y, x, y) <= p1.size + size) {
            game_over();
        }
    }
}
