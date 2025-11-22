void create_map1(){ //testing for now - not the actual map
    for(int i = 0; i<5;i++){
        map1[i] = new Barrier(100*i,20*i*2,100,5);
    }
    for(int i = 5; i<10;i++){
        map1[i] = new Barrier(20*i*2,100*i,5,100);
    }
}


//NOTICE!! Make a system so that the barrier logic will use the correct barriers
//         when switching maps.
