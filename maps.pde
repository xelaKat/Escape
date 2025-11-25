void map0(){
    Barrier[] map0 = new Barrier[4];
    map0[0] = new Barrier(200,200,200,5);
    map0[1] = new Barrier(595,200,5,200);
    map0[2] = new Barrier(400,595,200,5);
    map0[3] = new Barrier(200,400,5,200);
    Maps.add(map0);
}

void map1(){ //testing for now - not the actual map
    Barrier[] map1 = new Barrier[10];
    for(int i = 0; i<5;i++){
        map1[i] = new Barrier(100*i,20*i*2,100,5);
    }
    for(int i = 5; i<10;i++){
        map1[i] = new Barrier(20*i*2,100*i,5,100);
    }
    Maps.add(map1);
}

void map2(){
    Barrier[] map2 = new Barrier[5];
}
