
int count_all_line() {
  //線を数える
  int count=0;
  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=0; j<tile_H_Num; j++ ) {
      count+=Tiling[i][j].count_line();
      if (i!=0&&j!=0&&i!=(tile_W_Num-1)&&j!=(tile_H_Num-1)) {
      } else {
        count--;
      }
    }
  }
  return count;
}

void set_size(int _R) {
  //Tilingに座標、三角形の大きさを代入
  //隣タイルも決める
  fake=new tiling(_R, 0, 0, 0, 0, 0);

  tile_W_Num=int(canvas_W/fake.teihen)+2+1;
  tile_H_Num=int(canvas_H/fake.takasa)*2+2+2;
  
  

  Tiling = new tiling[tile_W_Num][tile_H_Num];
  
  println("tile_W_Num:"+tile_W_Num,"tile_H_Num:"+tile_H_Num);

  float XX1=0;
  float YY1=0;
  int MUKI=0;


  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=0; j<tile_H_Num; j++ ) {
      if (j%4==0) {
        XX1=-fake.teihen/2+i*fake.teihen;
        YY1=j*fake.takasa/2;
        MUKI=1;
      } else if (j%4==1) {
        XX1=i*fake.teihen;
        YY1=fake.takasa/2+j*fake.takasa/2;
        MUKI=0;
      } else if (j%4==2) {
        XX1=i*fake.teihen;
        YY1=j*fake.takasa/2;
        MUKI=1;
      } else if (j%4==3) {
        XX1=-fake.teihen/2+i*fake.teihen;
        YY1=+fake.takasa/2+j*fake.takasa/2;
        MUKI=0;
      }


      Tiling[i][j]=new tiling(fake.R+0.3, MUKI, XX1-1-fake.teihen/2, YY1-1-fake.takasa, i, j);
      Tiling[i][j].tileColor=color(254);
      Tiling[i][j].texture_on=false;
      
    }
  }

  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=2; j<tile_H_Num; j++ ) {

      if (j%4==0) {

        if (j>0) {

          Tiling[i][j].tonariTile[0]=Tiling[i][j-1];
        } else {
          Tiling[i][j].tonariTile[0]=null;
        }

        if (i>0&&j<tile_H_Num-1) {

          Tiling[i][j].tonariTile[1]=Tiling[i-1][j+1];
        } else {
          Tiling[i][j].tonariTile[1]=null;
        }
        if (j<tile_H_Num-1) {

          Tiling[i][j].tonariTile[2]=Tiling[i][j+1];
        } else {
          Tiling[i][j].tonariTile[2]=null;
        }
      } else if (j%4==1) {

        if (j>0) {

          Tiling[i][j].tonariTile[0]=Tiling[i][j-1];
        } else {
          Tiling[i][j].tonariTile[0]=null;
        }

        if (i<tile_W_Num-1&&j>0) {

          Tiling[i][j].tonariTile[1]=Tiling[i+1][j-1];
        } else {
          Tiling[i][j].tonariTile[1]=null;
        }
        if (j<tile_H_Num-1) {

          Tiling[i][j].tonariTile[2]=Tiling[i][j+1];
        } else {
          Tiling[i][j].tonariTile[2]=null;
        }
      } else if (j%4==2) {

        if (j>0) {

          Tiling[i][j].tonariTile[0]=Tiling[i][j-1];
        } else {
          Tiling[i][j].tonariTile[0]=null;
        }

        if (j<tile_H_Num-1) {

          Tiling[i][j].tonariTile[1]=Tiling[i][j+1];
        } else {
          Tiling[i][j].tonariTile[1]=null;
        }
        if (i<tile_W_Num-1&&j<tile_H_Num-1) {

          Tiling[i][j].tonariTile[2]=Tiling[i+1][j+1];
        } else {
          Tiling[i][j].tonariTile[2]=null;
        }
      } else if (j%4==3) {

        if (i>0&&j>0) {

          Tiling[i][j].tonariTile[0]=Tiling[i-1][j-1];
        } else {
          Tiling[i][j].tonariTile[0]=null;
        }

        if (j>0) {

          Tiling[i][j].tonariTile[1]=Tiling[i][j-1];
        } else {
          Tiling[i][j].tonariTile[1]=null;
        }
        if (j<tile_H_Num-1) {

          Tiling[i][j].tonariTile[2]=Tiling[i][j+1];
        } else {
          Tiling[i][j].tonariTile[2]=null;
        }
      }
    }
  }
}

