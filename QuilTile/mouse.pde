void mousePressed() {
  frameRate(60);
 

  if (tab_num==0) {//paletteタブの時

    if (mouseButton==RIGHT) {
      //右クリックだったら色の設定
      for (int i=0; i<10; i++) {

        if (dist(mouseX, mouseY, canvas_W+canvas_H*42/750+canvas_H*54/750*(i%5), canvas_H*75/750+canvas_H*66/750*(i/5))<canvas_H*25/800) {
          javaColor  = JColorChooser.showDialog(this, "単色", new Color( select_color [i]));//★
          if (javaColor!=null) select_color [i]= color(javaColor.getRed(), javaColor.getGreen(), javaColor.getBlue());
          color_choice=select_color[i];
          selected=i+1;//1-10
        } else {
        }
      }
    } else if (mouseButton==LEFT) {
      //左クリックだったら筆にとる
      for (int i=0; i<10; i++) {
        if (dist(mouseX, mouseY, canvas_W+canvas_H*42/750+canvas_H*54/750*(i%5), canvas_H*75/750+canvas_H*66/750*(i/5))<canvas_H*25/800) {
          selecting=true;
          color_choice=select_color[i];
          selected=i+1;//1-10

          if (dragged) {
            drag_color=selected;
          }
        }
      }
    }
    if (mouseButton==RIGHT) {
      //右クリックだったら柄の色の設定
      for (int ii=0; ii<4; ii++) {
        if (dist(mouseX, mouseY, canvas_W+canvas_H*75/750+canvas_H*150/750*(ii%2), canvas_H*250/750+canvas_H*150/750*(ii/2) )<canvas_H*65/750) {

          javaColor  = JColorChooser.showDialog(this, "色１", new Color(texture_color_1[ii]));
          if (javaColor!=null) 
            texture_color_1[ii]= color(javaColor.getRed(), javaColor.getGreen(), javaColor.getBlue());
        } else {
        }
        if (dist(mouseX, mouseY, canvas_W+canvas_H*75/750+canvas_H*150/750*(ii%2), canvas_H*250/750+canvas_H*150/750*(ii/2) )<canvas_H*65/750) {

          javaColor  = JColorChooser.showDialog(this, "色２", new Color( texture_color_2[ii]));
          if (javaColor!=null) 
            texture_color_2[ii]= color(javaColor.getRed(), javaColor.getGreen(), javaColor.getBlue());

          texture_choice=texture[ii];
          selected=11+ii;//11,12,13,14（柄）
          textureFlag[ii]=true;
          drawTexture();
        } else {
        }
      }
    } else if (mouseButton==LEFT) {
      //左クリックだったら筆にとる
      for (int ii=0; ii<4; ii++) {
        if (dist(mouseX, mouseY, canvas_W+canvas_H*75/750+canvas_H*150/750*(ii%2), canvas_H*215/750+canvas_H*150/750*(ii/2) )<canvas_H*65/750) {

          selecting=true;
          texture_choice=texture[ii];
          selected=11+ii;//11,12,13,14（柄）

          if (dragged) {
            drag_color=selected;
          }

          /*fill(0);
           ellipse(canvas_W+canvas_H*75/750+canvas_H*150/750*(ii%2), canvas_H*200/750+canvas_H*215/750*(ii/2),130,130);*/
        } else {
        }
      }
    }


    if (dist(mouseX, mouseY, canvas_W+ui_W*3/10, canvas_H*720/800)<canvas_H*35/800) {
      //画像としてsave
      String imageName=str(year())+str(month())+str(day())+str(hour())+str(minute())+str(second())+".png";
      saveFrame("image/"+imageName);
      PImage img =loadImage("image/"+imageName);
      img = img.get(0, 0, canvas_W-1, canvas_H);
      img.save("save/"+imageName);
      println("save:"+imageName);
    }

    if (dist(mouseX, mouseY, canvas_W+ui_W*7/10, canvas_H*720/800)<canvas_H*35/800) {
      //ランダムで適当に塗る
      random_color();//色をランダムにする

      //↓★自動で塗る★

      path_num=0;

      for ( int i=0; i<tile_W_Num; i++ ) {
        for ( int j=0; j<tile_H_Num; j++ ) {

          if (i==0&&(j%4==0||j%4==3)) {
            //左端のときはタイルに色を塗らない
          } else if (j<2) {
            //一番上のときはタイルに色を塗らない
          } else if (i==tile_W_Num-1) {
            //右端のときはタイルに色を塗らない
          } else if (j==tile_H_Num-1||j==tile_H_Num-2) {
            //一番下のときはタイルに色を塗らない
          } else {
            Tiling[i][j].auto_color();
          }
        }
      }

      /*回数制限のre_auto
       
       for (int ii=0; ii<10; ii++) {
       int i=int(random(tile_W_Num));
       int j=int(random(tile_H_Num));
       Tiling[i][j].re_auto();
       }*/

      //無限re_auto

      /*for ( int i=0; i<tile_W_Num; i++ ) {
       for ( int j=0; j<tile_H_Num; j++ ) {
       
       Tiling[i][j].re_auto();
       draw2(i, j);
       }
       }*/
      tabs();
    }
  }


  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=0; j<tile_H_Num; j++ ) {
      boolean flag=Tiling[i][j].displayMouseOver();
      if (flag) {
        Tiling[i][j].display_change_color();
        if_count_set();
        draw1(i, j); 
        tabs();
        println("i =", i, "j =", j, "degree =", get_degree(i, j));

        break;
      }
    }
  }
}

void if_count_set() {
  if (tab_num==0) {

    for ( int i=0; i<tile_W_Num; i++ ) {
      for ( int j=0; j<tile_H_Num; j++ ) {
        Tiling[i][j].if_count=false;
      }
    }
  }
}

void mouseReleased() {
  if (tab_num==0) {
    if (dragged && selecting) {
      //ドラッグアンドドロップ
      for ( int i=0; i<tile_W_Num; i++ ) {
        for ( int j=0; j<tile_H_Num; j++ ) {
          boolean flag=Tiling[i][j].displayMouseOver();
          if (flag) {
            boolean Tiling_ij_texture_on=Tiling[i][j].texture_on;
            PImage Tiling_ij_tileImage=Tiling[i][j].tileImage;
            color Tiling_ij_tileColor=Tiling[i][j].tileColor;
            for ( int i_=0; i_<tile_W_Num; i_++ ) {
              for ( int j_=0; j_<tile_H_Num; j_++ ) {

                if ( Tiling[i_][j_].texture_on==Tiling_ij_texture_on) {
                  if (Tiling_ij_texture_on==true&&Tiling[i_][j_].tileImage==Tiling_ij_tileImage) {
                    Tiling[i_][j_].display_change_color();
                  }
                  if (Tiling_ij_texture_on==false  && Tiling[i_][j_].tileColor==Tiling_ij_tileColor) {
                    Tiling[i_][j_].display_change_color();
                  }
                }
              }
            }
          }
        }
      }
      for ( int i=0; i<tile_W_Num; i++ ) {
        for ( int j=0; j<tile_H_Num; j++ ) {
          draw2(i, j);
        }
      }
      tabs();
    }
    dragged=false;
    selecting=false;
  }
  if (tab_num==1) {//繰り返しタブ
    for (int ii=0; ii<6; ii++) {
      if (dist(mouseX, mouseY, canvas_W+canvas_H*75/750+canvas_H*150/750*(ii%2), canvas_H*140/750+canvas_H*150/750*(ii/2) )<canvas_H*65/750) {
        if (ii==0) {
          copy_rhombus_p1();
          println("rhombus_p1");
        } else if (ii==1) {
          copy_rhombus_p2();
          println("rhombus_p2");
        } else if (ii==2) {
          copy_tile_wakaba_p1();
          println("wakaba_p1");
        } else if (ii==3) {
          copy_tile_wakaba_pg();
          println("wakaba_pg");
        } else if (ii==4) {
          copy_hexagon_p1();
          println("hexagon_p1");
        } else if (ii==5) {
          copy_hexagon_p3();
          println("hexagon_p3");
        }
      }
    }


    if (dist(mouseX, mouseY, canvas_W+ui_W*3/10, canvas_H*720/800)<canvas_H*35/800) {
      String imageName=str(year())+str(month())+str(day())+str(hour())+str(minute())+str(second())+".png";
      saveFrame("image/"+imageName);
      PImage img =loadImage("image/"+imageName);
      img = img.get(0, 0, canvas_W, canvas_H);
      img.save("save/"+imageName);
      println("save:"+imageName);
    }

    if (dist(mouseX, mouseY, canvas_W+ui_W*7/10, canvas_H*720/800)<canvas_H*35/800) {

      random_color();// ランダムで色を選ぶ


      //↓★自動で塗る★
      path_num=0;

      for ( int i=0; i<tile_W_Num; i++ ) {
        for ( int j=0; j<tile_H_Num; j++ ) {
          if (i==0&&(j%4==0||j%4==3)) {
            //左端のときはタイルに色を塗らない
          } else if (j<2) {
            //一番上のときはタイルに色を塗らない
          } else if (i==tile_W_Num-1) {
            //右端のときはタイルに色を塗らない
          } else if (j==tile_H_Num-1||j==tile_H_Num-2) {
            //一番下のときはタイルに色を塗らない
          } else {
            Tiling[i][j].auto_color();
          }
        }
      }
    }
  }

  if (tab_num==2) {//難易度タブ
    for (int ii=0; ii<2; ii++) {
      if (dist(mouseX, mouseY, canvas_W+canvas_H*75/750+canvas_H*150/750*(ii%2), canvas_H*510/750+canvas_H*150/750*(ii/2) )<canvas_H*65/750) {
        //拡大縮小
        if (ii==0) {

          if (R_size==40) R_size=48;
          else if (R_size==48) R_size=60;
          else if (R_size==60) R_size=80;
          else if (R_size==80) R_size=96;
          else if (R_size==96) R_size=120;


          temp= new tiling[tile_W_Num][tile_H_Num];

          for ( int i=0; i<tile_W_Num; i++ ) {
            for ( int j=0; j<tile_H_Num; j++ ) {
              temp[i][j]=new tiling(fake.R, 0, 0, 0, i, j);
            }
          }


          for ( int i=0; i<tile_W_Num; i++ ) {
            for ( int j=0; j<tile_H_Num; j++ ) {
              if (i>=0&&j>=0&& i<tile_W_Num&&j<tile_H_Num) {
                temp[i][j].tileColor=Tiling[i][j].tileColor;
                temp[i][j].tileImage=Tiling[i][j].tileImage;
                temp[i][j].texture_on=Tiling[i][j].texture_on;
              }
            }
          }

          set_size(R_size);



          for ( int i=0; i<tile_W_Num; i++ ) {
            for ( int j=0; j<tile_H_Num; j++ ) {
              if (i>=0&&j>=2&& i<tile_W_Num-1&&j<tile_H_Num-2) {//★0911周囲を無視する
                Tiling[i][j].tileColor=temp[i][j].tileColor;
                Tiling[i][j].tileImage=temp[i][j].tileImage;
                Tiling[i][j].texture_on=temp[i][j].texture_on;
              }
            }
          }

          println(R_size, "↑　lineNum:", (count_all_line()/2 ));
        } else {
          if (R_size==48) R_size=40;
          else if (R_size==60) R_size=48;
          else if (R_size==80) R_size=60;
          else if (R_size==96) R_size=80;
          else if (R_size==120) R_size=96;


          temp= new tiling[tile_W_Num][tile_H_Num];

          for ( int i=0; i<tile_W_Num; i++ ) {
            for ( int j=0; j<tile_H_Num; j++ ) {
              temp[i][j]=new tiling(fake.R, 0, 0, 0, i, j);
            }
          }

          int temp_W=tile_W_Num;
          int temp_H=tile_H_Num;

          for ( int i=0; i<tile_W_Num; i++ ) {
            for ( int j=0; j<tile_H_Num; j++ ) {
              if (i>=0&&j>=0&& i<tile_W_Num&&j<tile_H_Num) {//★0911周囲を無視する
                temp[i][j].tileColor=Tiling[i][j].tileColor;
                temp[i][j].tileImage=Tiling[i][j].tileImage;
                temp[i][j].texture_on=Tiling[i][j].texture_on;
              }
            }
          }



          set_size(R_size);


          for ( int i=0; i<tile_W_Num; i++ ) {
            for ( int j=0; j<tile_H_Num; j++ ) {
              if (i>=0&&j>=2&& i<temp_W-1&&j<temp_H-2) {
                Tiling[i][j].tileColor=temp[i][j].tileColor;
                Tiling[i][j].tileImage=temp[i][j].tileImage;
                Tiling[i][j].texture_on=temp[i][j].texture_on;
              } else {
                Tiling[i][j].tileColor=color(254);                
                Tiling[i][j].texture_on=false;
              }
            }
          }
          println(R_size, "↓　lineNum:", (count_all_line()/2 ));
        }
      }
    }
  }

  if (tab_num==3) {//経路タブ
  anime_count=0;//☆20190124☆

    for (int i=0; i<2; i++) {
      //all_strokesとone_by_oneの切り替え
      if (canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2)<mouseX&&mouseX<canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2)+canvas_H*135/800&&
        canvas_H*250/750+canvas_H*150/750*(i/2)<mouseY&&mouseY<canvas_H*250/750+canvas_H*150/750*(i/2)+canvas_H*100/800) {
        path_change=i;
        
      }
    }

for (int i=0; i<2; i++) {
      //animation_on/offの切り替え
      if (canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2)<mouseX&&mouseX<canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2)+canvas_H*135/800&&
        canvas_H*400/750+canvas_H*150/750*(i/2)<mouseY&&mouseY<canvas_H*400/750+canvas_H*150/750*(i/2)+canvas_H*100/800) {
        animation_change=i;
        if(animation_change==0)animation=true;
        if(animation_change==1)animation=false;
        
      }
    }


    for (int ii=0; ii<2; ii++) {
      if (dist(mouseX, mouseY, canvas_W+canvas_H*75/750+canvas_H*150/750*(ii%2), canvas_H*140/750+canvas_H*150/750*(ii/2) )<canvas_H*65/750) {
        if (ii==0) {
          if (path_num!=0)path_num--;
        } else if (ii==1) {
          if (path_num!=all_strokes.size ()-1)path_num++;
        }

        println("path_num:"+path_num);
      }
    }

    for ( int i=0; i<tile_W_Num; i++ ) {
      for ( int j=0; j<tile_H_Num; j++ ) {

        boolean test []=new boolean[3];

        for ( int n=0; n<3; n++ ) {
          test[n]=Tiling[i][j].edge_mouse(n);
          if (test[n]) {
            for ( int c=0; c<chain.size (); c++ ) {
              edge_connection ch=chain.get(c);
              edge e1=ch.Edge1;
              edge e2=ch.Edge2;

              if (e1!=null && e1.tiling_i==i && e1.tiling_j==j && e1.tiling_edge==n) {

                path_num=c;
              } else if (e2!=null && e2.tiling_i==i && e2.tiling_j==j && e2.tiling_edge==n)
                path_num=c;
            }
          }
        }
      }
    }
  }
  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=0; j<tile_H_Num; j++ ) {
      draw2(i, j);
    }
  }

  if (tab_num==3) {
  }
  tabs();
  path_connection();
  mouseClicked=false;
}


void mouseClicked() {
  mouseClicked=true;
}

void mouseDragged() {
  //色柄をドラッグ中の描画
  dragged=true;

  if (selecting) {
    if (selected>=1&&selected<=10) {
      // rect(mouseX,mouseY,10,10);
      noStroke();
      fill(color_choice, 25);
      rect(mouseX-canvas_H*65/800, mouseY-canvas_H*65/800, canvas_H*130/800, canvas_H*130/800);
    } else {
      for (int i=0; i<4; i++) {
        if (selected==i+11) {
          tint( 255.0, 84 );
          image(imgTextureUI[i], mouseX-canvas_H*65/800, mouseY-canvas_H*65/800);
          tint( 255.0, 255 );
        }
      }
    }
  }
}

