class Key{ //UNFINISHED
    float x,y;
    float size = 50;
    boolean collected;
    boolean used;
    int map; //determines which map the key shows up in
    boolean special; //is it a special key? only used for room 4

    Key(float _x, float _y, int m, boolean s){
        x = _x;
        y = _y;
        map = m;
        special = s;
        collected = false;
        used = false;
    }

    void display(){
        if(special) image(special_key,x,y);
        else image(keys,x,y);
    }

    boolean collision(){
        //slightly modified the collision code from barriers for the shape of the key
        boolean overlapX = p1.x + p1.size >= x + size/2 && p1.x - p1.size <= x + size/2;
        boolean overlapY = p1.y + p1.size >= y && p1.y - p1.size <= y + size;
        return overlapX && overlapY;
    }
}
