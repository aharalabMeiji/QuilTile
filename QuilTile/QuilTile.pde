tiling [][] Tiling; 
tiling fake;
tiling [][] temp; 

int canvas_W, canvas_H, ui_W;

import javax.swing.JColorChooser;
import java.awt.Color;

color [] select_color = new color [10];

color [] texture_color_1 = new color [4];//背景
color [] texture_color_2 = new color [4];//水玉

int selected=0;
int drag_color=0;
boolean dragged=false;
boolean selecting=false;

boolean []textureFlag= new boolean[4];
PImage [] texture = new PImage[4];//本物のテクスチャ
PImage [] imgTextureUI = new PImage [4];//テクスチャのUI

PImage [] Escher_UI= new PImage[6];//周期的タイリングのUI
PImage [] scaling = new PImage [2];//拡大縮小のUI
PImage [] undo_redo = new PImage [2];//右左ボタンのUI

Color javaColor;

color color_choice=color(255, 255, 255);//筆の色(元パレット)
PImage texture_choice;//筆の色の柄バージョン


int tile_W_Num, tile_H_Num;

int init_strokeWeight=3;
int plus_strokeWeight=0;
int stroke_lineY;
boolean mouseClicked=false;


int[] Df_tileColor=new int[2];
int[] Df_tileImage=new int[2];

int R_size=60;//三角形の大きさ

int tweak=-1;//表示を数ピクセルずらしたいときに使う

void setup() {
  frameRate(60);


  canvas_W=int(480*sqrt(3));
  canvas_H=720;

  //sew_level=canvas_W+canvas_H*50/750;

  fill(255);

  ui_W=300;

  stroke_lineY=int(canvas_H*6/8);

  size(canvas_W+ui_W, canvas_H);

  strokeCap(ROUND);

  for (int ii=0; ii<4; ii++) {
    texture[ii]=loadImage("texture/defaultTextureImage"+ii+".png");
    imgTextureUI [ii] =loadImage("texture/defaultTextureUI"+ii+".png");
    textureFlag[ii]=false;
  }

  for (int ii=0; ii<6; ii++) {
    Escher_UI[ii]=loadImage("Escher_UI/escher"+ii+".png");
  }
  for (int ii=0; ii<2; ii++) {
    scaling[ii]=loadImage("scaling"+ii+".png");
  }

  for (int ii=0; ii<2; ii++) {
    undo_redo[ii]=loadImage("undo_redo/arrow"+ii+".png");
  }

  texture_color_1[0]=color(#FFFF99);
  texture_color_2[0]=color(#66ff66);

  texture_color_1[1]=color(#FFCC66);
  texture_color_2[1]=color(#CCFFCC);

  texture_color_1[2]=color(#ff99cc);
  texture_color_2[2]=color(255);

  texture_color_1[3]=color(#CCFFFF);
  texture_color_2[3]=color(#FFFFCC);



  select_color[0]=color(#ff9999);
  select_color[1]=color(#ffcc66);
  select_color[2]=color(#ffff99);
  select_color[3]=color(#ccff66);
  select_color[4]=color(#ccffff);

  select_color[5]=color(#ccccff);
  select_color[6]=color(#888865);
  select_color[7]=color(#dfb199);
  select_color[8]=color(#cbcbcb);
  select_color[9]=color(255);

  random_color();


  cursor(HAND);
  strokeWeight(init_strokeWeight);

  set_size(R_size);

  background(255);

  tabs();
}

int anime_count=0;//☆20190124☆
void draw() {
  if (tab_num==0&&selecting) {//色や柄がドラックアンドドロップされたら
    background( 255 ); 
    for ( int i=0; i<tile_W_Num; i++ ) {
      for ( int j=0; j<tile_H_Num; j++ ) {
        draw2(i, j);
      }
    }
  }

  if (tab_num==1) draw_escher_guide();

  if (tab_num==2)draw_odd();

  draw_anime();//☆20190124☆
  
  tabs();

  tab_change();
  anime_count++;//☆20190124☆
}


void random_color() {
  //色と柄をランダムに選ぶ
  for (int i=0; i<2; i++) {
    Df_tileColor[i]=int(random(10));
    Df_tileImage[i]=int(random(4));
  }
}

void draw1(int _i, int _j) {
  //自分と隣タイルだけ描く
  for (int i=0; i<3; i++) {
    if (Tiling[_i][_j].tonariTile[i]!=null)Tiling[_i][_j].tonariTile[i].displayTile1();
  }
  Tiling[_i][_j].displayTile1();

  for (int i=0; i<3; i++) {
    if (Tiling[_i][_j].tonariTile[i]!=null)Tiling[_i][_j].tonariTile[i].displayTile2();
  }
  Tiling[_i][_j].displayTile2();
}

void draw2(int _i, int _j) {
  //自分のタイルだけ描く
  Tiling[_i][_j].displayTile1();
  Tiling[_i][_j].displayTile2();
}

