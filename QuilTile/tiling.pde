
class tiling {
  float R;

  int muki;

  int tiling_i, tiling_j;

  int degree=6;//次数

  color tileColor=color(255);

  PImage tileImage;
  boolean texture_on;

  float x1, x2, x3, Gx;
  float y1, y2, y3, Gy;

  float teihen, takasa;


  edge [] Edge = new edge[3];

  tiling [] tonariTile=new tiling [3];//線で隣
  tiling [] tonariTile2=new tiling [9];//点で隣

  boolean if_count=false;

  tiling(float _R, int _muki, float _x1, float _y1, int _tiling_i, int _tiling_j) {
    tiling_i=_tiling_i;
    tiling_j=_tiling_j;
    
    tileColor=color(254);
    texture_on=false;

    R=_R;
    teihen=R*sqrt(3);
    takasa=R*3/2;

    x1=_x1;
    y1=_y1;
    x2=_x1+teihen;
    y2=_y1;
    x3=_x1+teihen/2;
    //左端の処理
    if (tiling_i==0&&(tiling_j%4==1||tiling_j%4==2)) {//
      x1=x1+teihen/2+tweak;
      x3=x3+tweak;
    } else if (tiling_i==0&&(tiling_j%4==0||tiling_j%4==3)) {  
      x3=x2+tweak;
      x2=x2+tweak;
    }
    //右端の処理   
    if (tiling_i==tile_W_Num-2&&(tiling_j%4==1||tiling_j%4==2)) {
      x1=x1-tweak;
      x2=x3-tweak;
      x3=x3-tweak;
    } else if (tiling_i==tile_W_Num-2&&(tiling_j%4==0||tiling_j%4==3)) {
      x1=x1-tweak;
      x2=x2-tweak;
      x3=x3-tweak;
    } else if (tiling_i==tile_W_Num-1&&(tiling_j%4==0||tiling_j%4==3)) {      
      x1=x1-tweak;
      x3=x1-tweak;
    }else if (tiling_i==tile_W_Num-1&&(tiling_j%4==1||tiling_j%4==2)) {      
      x1=x1-teihen/2-tweak;;
      x3=x1-tweak;
    }

    muki=_muki;

    if (muki==0) {
      y3=_y1-takasa;
    } else if (muki==1) {
      y3=_y1+takasa;
    }




    for (int i=0; i<3; i++) {
      Edge[i]=new edge();
    }

    Edge[0].sx=x3;
    Edge[1].sx=x2;
    Edge[2].sx=x1;

    Edge[0].gx=x1;
    Edge[1].gx=x3;
    Edge[2].gx=x2;

    Edge[0].sy=y3;
    Edge[1].sy=y2;
    Edge[2].sy=y1;

    Edge[0].gy=y1;
    Edge[1].gy=y3;
    Edge[2].gy=y2;

    for (int i=0; i<3; i++) {
      Edge[i].tiling_i=tiling_i;
      Edge[i].tiling_j=tiling_j;
      Edge[i].tiling_edge=i;
    }



    Gx=(x1+x2+x3)/3;
    Gy=(y1+y2+y3)/3;
  }



  void displayTile1() {
    //色または柄ぬり

    if (texture_on==false) {
      fill(tileColor);
      noStroke();
      triangle(x1, y1, x2, y2, x3, y3);
    } else {
      displayTileImage();
    }
  }

  void displayTile2() {
    //strokeの描画
    stroke(150);    

    if (init_strokeWeight + plus_strokeWeight<=0) {
      plus_strokeWeight = -init_strokeWeight;
      noStroke();
    } else {
      strokeWeight( init_strokeWeight + plus_strokeWeight);
    }

    if (muki==0) {
      if (line_hantei(2)) {
        line(x1, y1, x2, y2);
      }
      if (line_hantei(1)) {
        line(x2, y2, x3, y3);
      }
      if (line_hantei(0)) {
        line(x3, y3, x1, y1);
      }
    } else if ( muki==1) {
      if (line_hantei(0)) {
        line(x1, y1, x2, y2);
      }
      if (line_hantei(2)) {
        line(x2, y2, x3, y3);
      }
      if (line_hantei(1)) {
        line(x3, y3, x1, y1);
      }
    }
  }

  boolean displayMouseOver() {
    if (muki==0) {
      if (mouseOver0()==true) {

        return true;
      }
    } else if (muki==1) {
      if (mouseOver1()==true) {

        return true;
      }
    }
    return false;
  }

  void display_change_color() {
    if (selected>0&&selected<=10) {
      tileColor=color_choice;
      texture_on=false;
    } else {
      for (int i=0; i<4; i++) {
        if (selected==i+11) {
          tileImage=texture[i];
          texture_on=true;
        }
      }
    }
  }

  boolean edge_mouse(int _num) {//edgeのマウス判定
    float kyoriX, kyoriY;

    if (muki==0) {
      if (_num==0) {
        if (x1<mouseX&&mouseX<x3) {
          kyoriX=mouseX-x1;
          kyoriY=-kyoriX*sqrt(3);
          if (y1+kyoriY-10<mouseY&&mouseY<y1+kyoriY+10) {
            println(tiling_i, tiling_j, "edge[0]_ture");
            return true;
          }
        }
      }

      if (_num==1) {
        if (x3<mouseX&&mouseX<x2) {
          kyoriX=x2-mouseX;
          kyoriY=-kyoriX*sqrt(3);
 
          if (y1+kyoriY-10<mouseY&&mouseY<y1+kyoriY+10) {
            //println(tiling_i, tiling_j, "edge[1]_ture");
            return true;
          }
        }
      }

      if (_num==2) {
        if (x1<mouseX&&mouseX<x2&&y1-5<mouseY&&mouseY<y1+5) {
          //println(tiling_i, tiling_j, "edge[2]_ture");
          return true;
        }
      }
    }
    return false;
  }


  boolean mouseOver0() {
    //向きが0のときのマウス判定

    float kyoriX;
    float kyoriY;

    if (mouseX>canvas_W) {
      //なにもしない
    } else if (mouseX>x1&&mouseX<Gx) {
      kyoriX=mouseX-x1;
      kyoriY=kyoriX*sqrt(3);
      if (mouseY<Gy+teihen/2/sqrt(3)&&mouseY>Gy+teihen/2/sqrt(3)-kyoriY) {
        //あたり
        return true;
      } else {
        return false;
      }
    } else if (mouseX>=Gx&&mouseX<x2) {
      kyoriX=x2-mouseX;
      kyoriY=kyoriX*sqrt(3);
      if (mouseY<Gy+teihen/2/sqrt(3)&&mouseY>Gy+teihen/2/sqrt(3)-kyoriY) {
        //あたり
        return true;
      }
    }
    return false;
  }

  boolean mouseOver1() {
    //向きが1のときのマウス判定

    float kyoriX;
    float kyoriY;

    if (mouseX>canvas_W) {
      //なにもしない
    } else if (mouseX>x1&&mouseX<Gx) {
      kyoriX=mouseX-(x1);
      kyoriY=kyoriX*sqrt(3);
      if (mouseY>Gy-teihen/2/sqrt(3)&&mouseY<Gy-teihen/2/sqrt(3)+kyoriY) {
        //あたり
        return true;
      } else {
        return false;
      }
    } else if (mouseX>=Gx&&mouseX<x2) {
      kyoriX=x2-mouseX;
      kyoriY=kyoriX*sqrt(3);
      if (mouseY>Gy-teihen/2/sqrt(3)&&mouseY<Gy-teihen/2/sqrt(3)+kyoriY) {
        //あたり
        return true;
      }
    }

    return false;
  }

  void displayTileImage() {

    //textureの色を一個一個取って三角形に貼る
    loadPixels();
    if (y1>y3) {
      for (int y= (int)y3; y<=y1; y++) {
        int A=int(x1+(y1-y)*sqrt(3)/3);
        if (x1==x3)A=int(x1);
        int B=int(x2-(y1-y)*sqrt(3)/3);
        if (x2==x3)B=int(x2);
        for (int x=A; x<=B; x++) {
          color c=tileImage.get(x, y);

          if (0<=x && x<canvas_W && 0<=y && y<canvas_H) {
            pixels[x+width*y]=c;
          }
        }
      }
    } else {
      for (int y= (int)y1; y<=y3; y++) {
        int A=int(x1+(y-y1)*sqrt(3)/3);
        if (x1==x3)A=int(x1);
        int B=int(x2-(y-y1)*sqrt(3)/3);
        if (x2==x3)B=int(x2);
        for (int x=A; x<=B; x++) {
          color c=tileImage.get(x, y);

          if (0<=x && x<canvas_W && 0<=y && y<canvas_H) {
            pixels[x+width*y]=c;
          }
        }
      }
    }
    updatePixels();
  }
  boolean line_hantei(int _i) {
    //隣タイルとのあいだの線を描くかどうかの判定
    //線を描く→→→→true
    if (tonariTile[_i]==null) return true;     
    if (tonariTile[_i]!=null&&tonariTile[_i].texture_on!=texture_on) return true;
    if (tonariTile[_i]!=null&&((tonariTile[_i].texture_on==false&&tonariTile[_i].tileColor!=tileColor))) return true;    
    if (tonariTile[_i].texture_on==true&&tonariTile[_i].tileImage!=tileImage) return true;

    return false;
  }

  void auto_color() {
    //ランダムで色を塗る
    tileColor=select_color[Df_tileColor[int(random(2))]];
    tileImage=texture[Df_tileImage[int(random(2))]];

    int boolean_texure=int(random(2));
    if (boolean_texure==0) {
      texture_on=true;
    } else {
      texture_on=false;
    }
  }
 
  int count_line() {
    int count=0;
    for (int i=0; i<3; i++) {
      if (line_hantei(i)==true) {
        count++;
      }
    }
    return count;
  }
}

