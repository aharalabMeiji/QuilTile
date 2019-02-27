//周期的に繰り返す

void copy_rhombus_p1() {
  for ( int j=2; j<tile_H_Num; j+=8 ) { 
    for ( int i=1; i<tile_W_Num+2; i+=2 ) {


      copy_rhombus(i, j);
    }
  }
  for ( int j=6; j<tile_H_Num; j+=8 ) { 
    for ( int i=0; i<tile_W_Num+2; i+=2 ) {


      copy_rhombus(i, j);
    }
  }
}

//3,2が基準

void copy_rhombus_p2() {

  for ( int j=2; j<tile_H_Num; j+=8 ) { 
    for ( int i=-1; i<tile_W_Num+2+4; i+=2 ) {

      if (i%4==3&&j%16==2) {
        copy_rhombus(i, j);
      } else if (i%4==3&&j%16==10) {
        copy_rhombus_180rotated(i, j);
      } else if (i%4==1&&j%16==2) {
        copy_rhombus_180rotated(i, j);
      } else if (i%4==1&&j%16==10) {
        copy_rhombus(i, j);
      }
    }
  } 

  for ( int j=6; j<tile_H_Num; j+=8 ) { 
    for ( int i=-2; i<tile_W_Num+2+4; i+=2 ) {

      if (i%4==0&&j%16==6) {
        copy_rhombus(i, j);
      } else if (i%4==2&&j%16==6) {
        copy_rhombus_180rotated(i, j);
      } else if (i%4==2&&j%16==14) {
        copy_rhombus(i, j);
      } else if (i%4==0&&j%16==14) {
        copy_rhombus_180rotated(i, j);
      }
    }
  }
}

//初心者マークの横向き

void copy_tile_wakaba_p1() {

  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=2; j<tile_H_Num; j++ ) {
      
      if((i%2)==0){
        if((j%4)/2==0){
          copy_tile(i, j, 2, j%4+4);
        }else{
          copy_tile(i, j, 2, j%4);
        }
      }else{
        if((j%4)/2==0){
          copy_tile(i, j, 1, j%4+4);
        }else{
          copy_tile(i, j, 1, j%4);
        }
      }
      
      /*if ((i%2)==0 && (j%4)/2==1) {        
        copy_tile(i, j, 2, j%4);
      } else if ((i%2)==0 && (j%4)/2==0) {
        copy_tile(i, j, 2, j%4+4);
      } else if ((i%2)==1 && (j%4)/2==1) {
        copy_tile(i, j, 1, j%4);
      } else if ((i%2)==1 && (j%4)/2==0) {
        copy_tile(i, j, 1, j%4+4);
      }*/
      
    }
  }
}

void copy_tile_wakaba_pg() {

  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=0; j<tile_H_Num; j++ ) {


      if ((i!=2)||(j/4)!=0) {
         if ((i%4)==1 ){
           if( (j%4)/2==1){
          copy_tile(i, j, 1, j%4);
           }else{
             copy_tile(i, j, 1, j%4+4);
           }
        } else if((i%4)==2){
          if( (j%4)/2==1){
          copy_tile(i, j, 2, j%4);
           }else{
             copy_tile(i, j, 2, j%4+4);
           }         
        }else if((i%4)==3){
          if( (j%4)/2==1){
          copy_tile(i, j, 1, 7-j%4);
           }else{
             copy_tile(i, j, 1, 7-j%4);
           }         
        }else if((i%4)==0){
          if( (j%4)/2==1){
          copy_tile(i, j, 2, 7-j%4);
           }else{
             copy_tile(i, j, 2, 7-j%4);
           }         
        }
        
      }
           
      
    }
  }
}


void copy_hexagon_p1() {
  for ( int j=-1; j<tile_H_Num; j+=4 ) { 
    for ( int i=-1; i<tile_W_Num+3; i+=3 ) {

      copy_hexagon(i, j);
    }
  }
  for ( int j=1; j<tile_H_Num; j+=4 ) { 
    for ( int i=0; i<tile_W_Num+3; i+=3 ) {

      copy_hexagon(i, j);
    }
  }
}

void copy_hexagon_p3() {
  for ( int j=-1; j<tile_H_Num; j+=4 ) { 
    for ( int i=-1; i<tile_W_Num+3; i+=3 ) {

      if (j%12==3) {
        copy_hexagon(i, j);
      } else if (j%12==7) {
        copy_hexagon_240rotated(i, j);
      } else if (j%12==11) {
        copy_hexagon_120rotated(i, j);
      }
    }
  }
  for ( int j=1; j<tile_H_Num; j+=4 ) { 
    for ( int i=0; i<tile_W_Num+3; i+=3 ) {

      if (j%12==5) {
        copy_hexagon_120rotated(i, j);
      } else if (j%12==9) {
        copy_hexagon(i, j);
      } else if ((j+12)%12==1) {
        copy_hexagon_240rotated(i, j);
      }
    }
  }
}


void copy_rhombus_180rotated(int _i, int _j) {
  //ひし形は3,2が起点(修正)
  copy_tile(_i-1, _j+1, 3, 4);//22-34 23
  copy_tile(_i-1, _j+2, 3, 3);//21-33 24
  copy_tile(_i-2, _j+3, 3, 2);//30-32 15
  copy_tile(_i, _j+1, 2, 4);//12-24 33
  copy_tile(_i, _j+2, 2, 3);//11-23 34
  copy_tile(_i-1, _j+3, 2, 2);//20-22 25
  copy_tile(_i-1, _j, 2, 5);//23-25 22
  copy_tile(_i, _j, 1, 5);//13-15 32
}





void copy_rhombus(int _i, int _j) {
  //ひし形は3,2が起点(修正)

  copy_tile(_i-1, _j+1, 2, 3);
  copy_tile(_i-1, _j+2, 2, 4);
  copy_tile(_i-2, _j+3, 1, 5);
  copy_tile(_i-1, _j, 2, 2);
  copy_tile(_i, _j+1, 3, 3);
  copy_tile(_i, _j+2, 3, 4);
  copy_tile(_i-1, _j+3, 2, 5);
  copy_tile(_i, _j, 3, 2);
}


void copy_hexagon(int _i, int _j) {
  //六角形は2,3が起点(修正)

  copy_tile(_i, _j, 2, 3);
  copy_tile(_i, _j+1, 2, 4);
  copy_tile(_i-1, _j, 1, 3);
  copy_tile(_i-1, _j+1, 1, 4);

  if(_i%3==2){
    copy_tile(_i-1, _j-1, 1, 2);
    copy_tile(_i-1, _j+2, 1, 5);

  }else if(_i%3==0){
    copy_tile(_i, _j-1, 1, 2);
    copy_tile(_i, _j+2, 1, 5);

  }
}


void copy_hexagon_120rotated(int _i, int _j) {
  //六角形は2,3が起点(修正)

  copy_tile(_i, _j, 1, 3);
  copy_tile(_i, _j+1, 1, 2);
  copy_tile(_i-1, _j+1, 2, 4);
  copy_tile(_i-1, _j, 1, 5);

  if (_i%3==2) {
    copy_tile(_i-1, _j-1, 1, 4);
    copy_tile(_i-1, _j+2, 2, 3);
  } else if (_i%3==0) {
    copy_tile(_i, _j-1, 1, 4);
    copy_tile(_i, _j+2,2, 3);
  } else {
  }
}

void copy_hexagon_240rotated(int _i, int _j) { 
  //六角形は2,3が起点(修正)

  copy_tile(_i, _j, 1, 5);
  copy_tile(_i, _j+1, 1, 4);
  copy_tile(_i-1, _j+1, 1, 2);
  copy_tile(_i-1, _j, 2, 3);

  if (_i%3==2) {
    copy_tile(_i-1, _j-1, 2, 4);
    copy_tile(_i-1, _j+2, 1, 3);
  } else if (_i%3==0) {
    copy_tile(_i, _j-1, 2, 4);
    copy_tile(_i, _j+2, 1, 3);
  } else {
  }
}



void copy_tile(int i, int j, int _i, int _j) {
  //タイルの色、柄、texture_onをコピーする

  //↓★自動で塗る★
  random_color();

  if (i==0&&(j%4==0||j%4==3)) {
    //左端のときはタイルに色を塗らない
  } else if (j<2) {
    //一番上のときはタイルに色を塗らない
  } else if (i==tile_W_Num-1) {
    //右端のときはタイルに色を塗らない
  } else if (j==tile_H_Num-1||j==tile_H_Num-2) {
    //一番下のときはタイルに色を塗らない
  } else if (i>=0&&j>=0&& i<tile_W_Num&&j<tile_H_Num) {
    Tiling[i][j].tileColor=Tiling[_i][_j].tileColor;
    Tiling[i][j].tileImage=Tiling[_i][_j].tileImage;
    Tiling[i][j].texture_on=Tiling[_i][_j].texture_on;
  }
}



void draw_escher_guide() {//★直す
  //繰り返しボタンにカーソルを合わせると赤いguideが出現

  if (tab_num==1) {
    boolean escher_p_overed=false;
    for (int ii=0; ii<6; ii++) {
      if (dist(pmouseX, pmouseY, canvas_W+canvas_H*75/750+canvas_H*150/750*(ii%2), canvas_H*140/750+canvas_H*150/750*(ii/2) )<canvas_H*65/750) {
        escher_p_overed=true;
        stroke(255, 0, 0);
        if (escher_p_overed) {
          if (ii==0) {
            line(Tiling[2][3].x3, Tiling[2][3].y3, Tiling[1][5].x1, Tiling[1][5].y1);
            line(Tiling[1][5].x1, Tiling[1][5].y1, Tiling[2][5].x2, Tiling[2][5].y2);
            line(Tiling[3][4].x3, Tiling[3][4].y3, Tiling[3][2].x2, Tiling[3][2].y2);
            line(Tiling[2][2].x1, Tiling[2][2].y1+3, Tiling[3][2].x2, Tiling[3][2].y2+3);
          } else if (ii==1) {
            line(Tiling[2][3].x3, Tiling[2][3].y3, Tiling[1][5].x1, Tiling[1][5].y1);
            line(Tiling[1][5].x1, Tiling[1][5].y1, Tiling[2][5].x2, Tiling[2][5].y2);
            line(Tiling[3][4].x3, Tiling[3][4].y3, Tiling[3][2].x2, Tiling[3][2].y2);
            line(Tiling[2][2].x1, Tiling[2][2].y1+3, Tiling[3][2].x2, Tiling[3][2].y2+3);
          } else if (ii==2) {
            line(Tiling[1][2].x1, Tiling[1][2].y1+3, Tiling[2][2].x2, Tiling[2][2].y2+3);
            line(Tiling[1][5].x1, Tiling[1][5].y1, Tiling[2][5].x2, Tiling[2][5].y2);  
            line(Tiling[1][2].x1, Tiling[1][2].y1, Tiling[1][3].x1, Tiling[1][3].y1);  
            line(Tiling[1][3].x1, Tiling[1][3].y1, Tiling[1][5].x1, Tiling[1][5].y1);
            line(Tiling[3][2].x1, Tiling[3][2].y1, Tiling[3][3].x1, Tiling[3][3].y1);  
            line(Tiling[3][3].x1, Tiling[3][3].y1, Tiling[3][5].x1, Tiling[3][5].y1);
          } else if (ii==3) {
            line(Tiling[1][2].x1, Tiling[1][2].y1+3, Tiling[2][2].x2, Tiling[2][2].y2+3);
            line(Tiling[1][5].x1, Tiling[1][5].y1, Tiling[2][5].x2, Tiling[2][5].y2);  
            line(Tiling[1][2].x1, Tiling[1][2].y1, Tiling[1][3].x1, Tiling[1][3].y1);  
            line(Tiling[1][3].x1, Tiling[1][3].y1, Tiling[1][5].x1, Tiling[1][5].y1);
            line(Tiling[3][2].x1, Tiling[3][2].y1, Tiling[3][3].x1, Tiling[3][3].y1);  
            line(Tiling[3][3].x1, Tiling[3][3].y1, Tiling[3][5].x1, Tiling[3][5].y1);
          } else if (ii==4) {
            line(Tiling[1][2].x1, Tiling[1][2].y1+3, Tiling[1][2].x2, Tiling[1][2].y2+3);
            line(Tiling[1][2].x1, Tiling[1][2].y1, Tiling[1][3].x1, Tiling[1][3].y1);
            line(Tiling[1][4].x1, Tiling[1][4].y1, Tiling[1][5].x1, Tiling[1][5].y1);
            line(Tiling[1][5].x1, Tiling[1][5].y1, Tiling[1][5].x2, Tiling[1][5].y2);
            line(Tiling[1][5].x2, Tiling[1][5].y2, Tiling[2][4].x2, Tiling[2][4].y2);
            line(Tiling[2][4].x2, Tiling[2][4].y2, Tiling[1][2].x2, Tiling[1][2].y2);
          } else if (ii==5) {
            line(Tiling[1][2].x1, Tiling[1][2].y1+3, Tiling[1][2].x2, Tiling[1][2].y2+3);
            line(Tiling[1][2].x1, Tiling[1][2].y1, Tiling[1][3].x1, Tiling[1][3].y1);
            line(Tiling[1][4].x1, Tiling[1][4].y1, Tiling[1][5].x1, Tiling[1][5].y1);
            line(Tiling[1][5].x1, Tiling[1][5].y1, Tiling[1][5].x2, Tiling[1][5].y2);
            line(Tiling[1][5].x2, Tiling[1][5].y2, Tiling[2][4].x2, Tiling[2][4].y2);
            line(Tiling[2][4].x2, Tiling[2][4].y2, Tiling[1][2].x2, Tiling[1][2].y2);
          }
        }
      } else {
        escher_p_overed=false;
      }

      if ( escher_p_overed&&dist(mouseX, mouseY, canvas_W+canvas_H*75/750+canvas_H*150/750*(ii%2), canvas_H*140/750+canvas_H*150/750*(ii/2) )>canvas_H*65/750)
        for ( int i=0; i<tile_W_Num; i++ ) {
          for ( int j=0; j<tile_H_Num; j++ ) {
            draw2(i, j);
          }
        }
    }
  }
}

