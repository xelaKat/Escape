void create_map1(){
    for(int i = 0; i<5;i++){
        map1[i] = new Barrier(100*i,20*i*2,100,2);
    }
    for(int i = 5; i<10;i++){
        map1[i] = new Barrier(20*i*2,100*i,2,100);
    }
}
