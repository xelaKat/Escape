void map0(){
    Barrier[] map0 = new Barrier[8];
    map0[0] = new Barrier(200,200,200,5);
    map0[1] = new Barrier(595,200,5,200);
    map0[2] = new Barrier(400,595,200,5);
    map0[3] = new Barrier(200,400,5,200);

    //walls
    map0[4] = new Barrier(0,-5,700,5);
    map0[5] = new Barrier(800,0,5,700);
    map0[6] = new Barrier(100,800,700,5);
    map0[7] = new Barrier(-5,100,5,700);
    Maps.add(map0);
}

void map1(){ //testing for now - not the actual map
    Barrier[] map1 = new Barrier[6];
    map1[0] = new Barrier(0,395,200,10);
    map1[1] = new Barrier(600,395,200,10);

    //walls
    map1[2] = new Barrier(0,-5,800,5);
    map1[3] = new Barrier(800,100,5,700);
    map1[4] = new Barrier(0,800,800,5);
    map1[5] = new Barrier(-5,0,5,700);
    Maps.add(map1);
}

void map2(){
    Barrier[] map2 = new Barrier[8];
    map2[0] = new Barrier(500,200,300,15);
    map2[1] = new Barrier(200,230,300,15);
    map2[2] = new Barrier(500,600,300,15);
    map2[3] = new Barrier(200,570,300,15);

    //walls
    map2[4] = new Barrier(0,-5,800,5);
    map2[5] = new Barrier(800,0,5,800);
    map2[6] = new Barrier(0,800,700,5);
    map2[7] = new Barrier(-5,0,5,800);
    Maps.add(map2);
}

void map3(){
    Barrier[] map3 = new Barrier[26];
    //vertical walls
    map3[0] = new Barrier(695,0,10,500);
    map3[1] = new Barrier(595,150,10,200);
    map3[2] = new Barrier(495,0,10,300);
    map3[3] = new Barrier(195,100,10,600);
    map3[4] = new Barrier(95,150,10,400);
    map3[5] = new Barrier(95,700,10,100);
    map3[6] = new Barrier(495,400,10,200);
    map3[7] = new Barrier(495,700,10,100);
    map3[18] = new Barrier(295,265,10,160);
    map3[21] = new Barrier(310,540,10,100);

    //horizontal
    map3[8] = new Barrier(95,90,300,10);
    map3[9] = new Barrier(295,190,200,10);
    map3[10] = new Barrier(200,490,200,10);
    map3[11] = new Barrier(400,590,400,10);
    map3[12] = new Barrier(200,690,305,10);
    map3[13] = new Barrier(600,690,305,10);
    map3[14] = new Barrier(500,490,105,10);
    map3[15] = new Barrier(0,190,100,10);
    map3[16] = new Barrier(0,390,100,10);
    map3[17] = new Barrier(0,610,100,10);
    map3[19] = new Barrier(750,295,50,10);
    map3[20] = new Barrier(695,500,50,10);

    //walls
    map3[22] = new Barrier(0,-5,800,5);
    map3[23] = new Barrier(800,100,5,700);
    map3[24] = new Barrier(0,800,800,5);
    map3[25] = new Barrier(-5,0,5,700);
    Maps.add(map3);
}

void map4(){
    Barrier[] map4 = new Barrier[17];
    //cell1
    map4[0] = new Barrier(150,0,10,100);
    map4[1] = new Barrier(0,150,100,10);
    //cell2
    map4[2] = new Barrier(650,0,10,100);
    map4[3] = new Barrier(700,150,100,10);
    //cell3
    map4[4] = new Barrier(0,650,100,10);
    map4[5] = new Barrier(150,700,10,100);
    //cell4
    map4[6] = new Barrier(700,650,100,10);
    map4[7] = new Barrier(650,700,10,100);
    //square
    map4[8] = new Barrier(345,335,110,10);
    map4[9] = new Barrier(345,335,10,110);
    map4[10] = new Barrier(445,335,10,110);
    map4[11] = new Barrier(345,435,110,10);

    //walls
    map4[12] = new Barrier(100,-5,700,5);
    map4[13] = new Barrier(800,0,5,800);
    map4[14] = new Barrier(0,800,345,5);
    map4[15] = new Barrier(455,800,345,5);
    map4[16] = new Barrier(-5,0,5,800);
    Maps.add(map4);
}

void map5(){
    Barrier[] map5 = new Barrier[5];
    map5[0] = new Barrier();

    //walls
    map5[1] = new Barrier(0,-5,800,5);
    map5[2] = new Barrier(800,0,5,800);
    map5[3] = new Barrier(0,800,800,5);
    map5[4] = new Barrier(-5,100,5,700);
    Maps.add(map5);
}

void map6(){
    Barrier[] map6 = new Barrier[5];
    map6[0] = new Barrier();

    //walls
    map6[1] = new Barrier(0,-5,800,5);
    map6[2] = new Barrier(800,0,5,700);
    map6[3] = new Barrier(0,800,800,5);
    map6[4] = new Barrier(-5,0,5,800);
    Maps.add(map6);
}

void map7(){
    Barrier[] map7 = new Barrier[6];
    map7[0] = new Barrier(0,120,150,10);
    map7[1] = new Barrier(0,580,150,10);

    //walls
    map7[2] = new Barrier(0,-5,345,5);
    map7[3] = new Barrier(455,-5,345,5);
    map7[4] = new Barrier(800,0,5,800);
    map7[5] = new Barrier(-5,0,5,800);
    Maps.add(map7);
}

void map8(){
    Barrier[] map8 = new Barrier[1];
    map8[0] = new Barrier();
    Maps.add(map8);
}
