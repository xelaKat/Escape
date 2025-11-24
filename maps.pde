void map0(){
    Barrier[] map0 = new Barrier[4];
    map0[0] = new Barrier(200,200,100,50);
    map0[1] = new Barrier(350,100,50,100);
    map0[2] = new Barrier(300,350,100,50);
    map0[3] = new Barrier(200,300,100,50);
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


//NOTICE!! Make a system so that the barrier logic will use the correct barriers
//         when switching maps.
