//chain...一筆一筆(path)のリスト
ArrayList <edge_connection> chain = new ArrayList <edge_connection> ();

boolean same_edge(edge _a, edge _b) {
  //edge a,bが一致すればtrue
  if (_a==null||_b==null)return false;

  if (_a.tiling_i==_b.tiling_i&&_a.tiling_j==_b.tiling_j&&_a.tiling_edge==_b.tiling_edge) {
    return true;
  }
  return false;
}

void path_connection() {

  chain.clear();

  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=1; j<tile_H_Num-2; j+=2 ) {//j=1,3,5,7,...

      //頂点を中心に右上上向きの三角形を(i,j)として考える
      /*
       line_hantei(0) →　真ん中上〜左下　→edge[0]
       line_hantei(1) →　真ん中上〜右下　→edge[1]
       line_hantei(2) →　左下〜右下   　→edge[2]
       */

      if (j%4==1) {//j=1,5,9,13...
        float centerX = Tiling[i][j].x1;//☆20190116
        float centerY = Tiling[i][j].y1;
        boolean a=false;
        edge e_a=null;
        if (j!=1 && i!=tile_W_Num-1) {
          a=Tiling[i][j].line_hantei(0);
          e_a=Tiling[i][j].Edge[0];
        }

        boolean b=false;
        edge e_b=null;

        if (i!=tile_W_Num-1) {
          b=Tiling[i][j].line_hantei(2);
          e_b=Tiling[i][j].Edge[2];
        }

        boolean c=false;
        edge e_c=null;
        if (j+2<tile_H_Num && i!=tile_W_Num-1) {
          c=Tiling[i][j+2].line_hantei(1);
          e_c=Tiling[i][j+2].Edge[1];
        }

        boolean d=false;
        edge e_d=null;    
        if (i!=0 && j+2<tile_H_Num) {
          d=Tiling[i][j+2].line_hantei(0);
          e_d=Tiling[i][j+2].Edge[0];
        }

        boolean e=false;
        edge e_e=null;   

        if (i!=0) {
          e=Tiling[i-1][j].line_hantei(2);
          e_e=Tiling[i-1][j].Edge[2];
        }


        boolean f=false;
        edge e_f=null;    
        if (i!=0 && j!=1 ) {
          f=Tiling[i-1][j].line_hantei(1);
          e_f=Tiling[i-1][j].Edge[1];
        }

        while (a||b||c||d||e||f) {

          if (a&&d) {//←まっすぐ
            chain.add(new edge_connection(e_a, e_d, centerX, centerY, false, false));
            a=false;
            d=false;
          } else if (b&&e) {
            chain.add(new edge_connection(e_b, e_e, centerX, centerY, false, false));
            b=false;
            e=false;
          } else if (c&&f) {
            chain.add(new edge_connection(e_c, e_f, centerX, centerY, false, false));
            c=false;
            f=false;
          } else if (a&&c) {//←120°
            chain.add(new edge_connection(e_a, e_c, centerX, centerY, true, false));
            a=false;
            c=false;
          } else if (b&&d) {
            chain.add(new edge_connection(e_b, e_d, centerX, centerY, true, false));
            b=false;
            d=false;
          } else if (c&&e) {
            chain.add(new edge_connection(e_c, e_e, centerX, centerY, true, false));
            c=false;
            e=false;
          } else if (d&&f) {
            chain.add(new edge_connection(e_d, e_f, centerX, centerY, true, false));
            d=false;
            f=false;
          } else if (e&&a) {
            chain.add(new edge_connection(e_e, e_a, centerX, centerY, true, false));
            e=false;
            a=false;
          } else if (f&&b) {
            chain.add(new edge_connection(e_f, e_b, centerX, centerY, true, false));
            f=false;
            b=false;
          } else if (a&&b) { //←60°
            chain.add(new edge_connection(e_a, e_b, centerX, centerY, false, false));
            a=false;
            b=false;
          } else if (b&&c) {
            chain.add(new edge_connection(e_b, e_c, centerX, centerY, false, false));
            b=false;
            c=false;
          } else if (c&&d) {
            chain.add(new edge_connection(e_c, e_d, centerX, centerY, false, false));
            c=false;
            d=false;
          } else if (d&&e) {
            chain.add(new edge_connection(e_d, e_e, centerX, centerY, false, false));
            d=false;
            e=false;
          } else if (e&&f) {
            chain.add(new edge_connection(e_e, e_f, centerX, centerY, false, false));
            e=false;
            f=false;
          } else if (f&&a) {
            chain.add(new edge_connection(e_f, e_a, centerX, centerY, false, false));
            f=false;
            a=false;
          } else if (a) { //←ペアなし
            chain.add(new edge_connection(e_a, null, centerX, centerY, false, false));
            a=false;
          } else if (b) { 
            chain.add(new edge_connection(e_b, null, centerX, centerY, false, false));
            b=false;
          } else if (c) { 
            chain.add(new edge_connection(e_c, null, centerX, centerY, false, false));
            c=false;
          } else if (d) { 
            chain.add(new edge_connection(e_d, null, centerX, centerY, false, false));
            d=false;
          } else if (e) { 
            chain.add(new edge_connection(e_e, null, centerX, centerY, false, false));
            e=false;
          } else if (f) { 
            chain.add(new edge_connection(e_f, null, centerX, centerY, false, false));
            f=false;
          }
        }
      } else if (j%4==3 && i>0) {//j=3,7,11,15...
        float centerX = Tiling[i][j].x1;//☆20190116
        float centerY = Tiling[i][j].y1;
        boolean a=false;
        edge e_a=null;

        a=Tiling[i][j].line_hantei(0);
        e_a=Tiling[i][j].Edge[0];


        boolean b=false;
        edge e_b=null;

        if (i!=tile_W_Num-1) {
          b=Tiling[i][j].line_hantei(2);
          e_b=Tiling[i][j].Edge[2];
        }

        boolean c=false;
        edge e_c=null;     
        if (j+2<tile_H_Num ) {
          c=Tiling[i-1][j+2].line_hantei(1);
          e_c=Tiling[i-1][j+2].Edge[1];
        }

        boolean d=false;
        edge e_d=null;
        if (j+2<tile_H_Num) {
          d=Tiling[i-1][j+2].line_hantei(0);
          e_d=Tiling[i-1][j+2].Edge[0];
        }

        boolean e=false;
        edge e_e=null;     
        if (i>1) {
          e=Tiling[i-1][j].line_hantei(2);
          e_e=Tiling[i-1][j].Edge[2];
        }

        boolean f=false;
        edge e_f=null;       

        f=Tiling[i-1][j].line_hantei(1);
        e_f=Tiling[i-1][j].Edge[1];




        while (a||b||c||d||e||f) {

          if (a&&d) {//←まっすぐ
            chain.add(new edge_connection(e_a, e_d, centerX, centerY, false, false));
            a=false;
            d=false;
          } else if (b&&e) {
            chain.add(new edge_connection(e_b, e_e, centerX, centerY, false, false));
            b=false;
            e=false;
          } else if (c&&f) {
            chain.add(new edge_connection(e_c, e_f, centerX, centerY, false, false));
            c=false;
            f=false;
          } else if (a&&c) {//←120°
            chain.add(new edge_connection(e_a, e_c, centerX, centerY, true, false));
            a=false;
            c=false;
          } else if (b&&d) {
            chain.add(new edge_connection(e_b, e_d, centerX, centerY, true, false));
            b=false;
            d=false;
          } else if (c&&e) {
            chain.add(new edge_connection(e_c, e_e, centerX, centerY, true, false));
            c=false;
            e=false;
          } else if (d&&f) {
            chain.add(new edge_connection(e_d, e_f, centerX, centerY, true, false));
            d=false;
            f=false;
          } else if (e&&a) {
            chain.add(new edge_connection(e_e, e_a, centerX, centerY, true, false));
            e=false;
            a=false;
          } else if (f&&b) {
            chain.add(new edge_connection(e_f, e_b, centerX, centerY, true, false));
            f=false;
            b=false;
          } else if (a&&b) { //←60°
            chain.add(new edge_connection(e_a, e_b, centerX, centerY, false, false));
            a=false;
            b=false;
          } else if (b&&c) {
            chain.add(new edge_connection(e_b, e_c, centerX, centerY, false, false));
            b=false;
            c=false;
          } else if (c&&d) {
            chain.add(new edge_connection(e_c, e_d, centerX, centerY, false, false));
            c=false;
            d=false;
          } else if (d&&e) {
            chain.add(new edge_connection(e_d, e_e, centerX, centerY, false, false));
            d=false;
            e=false;
          } else if (e&&f) {
            chain.add(new edge_connection(e_e, e_f, centerX, centerY, false, false));
            e=false;
            f=false;
          } else if (f&&a) {
            chain.add(new edge_connection(e_f, e_a, centerX, centerY, false, false));
            f=false;
            a=false;
          } else if (a) { //←ペアなし
            chain.add(new edge_connection(e_a, null, centerX, centerY, false, false));
            a=false;
          } else if (b) { 
            chain.add(new edge_connection(e_b, null, centerX, centerY, false, false));
            b=false;
          } else if (c) {
            chain.add(new edge_connection(e_c, null, centerX, centerY, false, false)); 
            c=false;
          } else if (d) { 
            chain.add(new edge_connection(e_d, null, centerX, centerY, false, false));
            d=false;
          } else if (e) { 
            chain.add(new edge_connection(e_e, null, centerX, centerY, false, false));
            e=false;
          } else if (f) { 
            chain.add(new edge_connection(e_f, null, centerX, centerY, false, false));
            f=false;
          }
        }
      }
    }
  }

  //たまったデータでなにかする
  //pathを全部描画
}



strokes Stk;

void make_one_stroke(int start_i) {
  if (0<=start_i&&start_i<chain.size()) {
    edge_connection start=chain.get(start_i);
    used[start_i]=true;//無限に探さないため

    Stk = new strokes();
    Stk.e2x=start.ex;//☆20190116
    Stk.e2y=start.ey;

    Stk.e1x=start.ex;
    Stk.e1y=start.ey;

    if (start.Edge1!=null)start.Edge1.ori=start.ori1;
    if (start.Edge2!=null)start.Edge2.ori=start.ori2;

    if (start.Edge1!=null)Stk.one_stroke.add(start.Edge1);
    if (start.Edge2!=null)Stk.one_stroke.add(start.Edge2);
    if (start.Edge2!=null) {
      edge a = start.Edge2;
      int a_i=start_i;

      boolean found=false;

      do {
        //Edge2方向に探す
        //chainの中から、aを持つものを探す
        //見つかったら、「おとなりのedge」をone_strokeに追加
        //aをお隣のedgeに更新して繰り返し


        found=false;

        for (int i=0; i<chain.size (); i++) {
          if (i!=a_i) {

            edge_connection ec=chain.get(i);
            edge ec_e1=ec.Edge1;
            edge ec_e2=ec.Edge2;


            if (same_edge(a, ec_e1)) {
              if (used[i])break;//無限ループ防止

              found=true;
              a=ec_e2;
              a_i=i;
              used[a_i]=true;

              if (ec_e1!=null&&ec_e2!=null) {
                if (ec_e1.ori==ec.ori1) {
                  ec_e2.ori=ec.ori2;
                } else {
                  ec_e2.ori=!ec.ori2;//ひっくり返して代入
                }
              }
              Stk.one_stroke.add(ec_e2);
              Stk.e2x=ec.ex;
              Stk.e2y=ec.ey;

              break;
            }
            if (same_edge(a, ec_e2)) {
              if (used[i])break;//無限ループ防止


              found=true;
              a=ec_e1;
              a_i=i;
              used[a_i]=true;

              if (ec_e1!=null&&ec_e2!=null) {
                if (ec_e2.ori==ec.ori2) {
                  ec_e1.ori=ec.ori1;
                } else {
                  ec_e1.ori=!ec.ori1;//ひっくり返して代入
                }
              }

              Stk.one_stroke.add(ec_e1);
              Stk.e2x=ec.ex;
              Stk.e2y=ec.ey;

              break;
            }
          }
        }
      }
      while (found);
    }

    if (start.Edge1!=null) {
      edge a = start.Edge1;
      int a_i=start_i;

      boolean found=false;

      do {
        //Edge1方向に探す
        //chainの中から、aを持つものを探す
        //見つかったら、「おとなりのedge」をone_strokeに追加
        //aをお隣のedgeに更新して繰り返し

        found=false;

        for (int i=0; i<chain.size (); i++) {
          if (i!=a_i) {

            edge_connection ec=chain.get(i);
            edge ec_e1=ec.Edge1;
            edge ec_e2=ec.Edge2;

            if (same_edge(a, ec_e1)) {
              if (used[i])break;//無限ループ防止
              found=true;
              a=ec_e2;
              a_i=i;
              used[a_i]=true;

              if (ec_e1!=null&&ec_e2!=null) {
                if (ec_e1.ori==ec.ori1) {
                  ec_e2.ori=ec.ori2;
                } else {
                  ec_e2.ori=!ec.ori2;//ひっくり返して代入
                }
              }

              Stk.one_stroke.add(0, ec_e2);
              Stk.e1x=ec.ex;
              Stk.e1y=ec.ey;
              break;
            }
            if (same_edge(a, ec_e2)) {
              if (used[i])break;//無限ループ防止
              found=true;
              a=ec_e1;
              a_i=i;
              used[a_i]=true;

              if (ec_e1!=null&&ec_e2!=null) {
                if (ec_e2.ori==ec.ori2) {
                  ec_e1.ori=ec.ori1;
                } else {
                  ec_e1.ori=!ec.ori1;//ひっくり返して代入
                }
              }

              Stk.one_stroke.add(0, ec_e1);
              Stk.e1x=ec.ex;
              Stk.e1y=ec.ey;
              break;
            }
          }
        }
      }
      while (found);
    }
    //println("ここから一筆書き");

    direction_check(Stk);
    all_strokes.add(Stk);
  }
}

void direction_check(strokes STK) {
  float x = STK.e1x;  // strokes に入っている.elx, .elyはストロークのスタートにあたる座標？
  float y = STK.e1y;
  //  println("direction_check: x,y="+x+","+y);
  //  println("STK.onestroke size "+STK.one_stroke.size());

  //for (int i=0; i<STK.one_stroke.size (); i++) {
  edge e = STK.one_stroke.get(0);
  if (e==null)e=STK.one_stroke.get(1);
  boolean e_ori=e.ori;
  /* //    println("e="+e);
  /*if (e==null) { // ここでエッジがnullになるのはおかしい？
   continue;
   }
   */
  //float[] next = e.get_opposite_vertex(x, y);  
  //    println("(e.sx, e.sy)="+e.sx+","+e.sy+")");
  //    println("(e.gx, e.gy)="+e.gx+","+e.gy+")");
  //    println("(x,y)="+x+","+y+")");
  //    println("(next x,next y)="+next[0]+","+next[1]+")");
  //   
  //println(x,y,e.sx,e.sy,e.gx,e.gy,e.ori);
  if (same_position(e.sx, e.sy, x, y)) {
    if (e_ori==false) {
      //逆向きにする
      //println("逆向きにする１");
      for (int i=0; i<STK.one_stroke.size (); i++) {
        e = STK.one_stroke.get(i);
        if (e!=null) {
          e.ori = !e.ori;
        }
      }
    }
  } else {
    if (e_ori==true) {
      //逆向きにする
      // println("逆向きにする２");
      for (int i=0; i<STK.one_stroke.size (); i++) {
        e = STK.one_stroke.get(i);
        if (e!=null) {
          e.ori = !e.ori;
        }
      }
    }
  }
}
void draw_one_stroke(strokes STK, boolean draw_endV) {
  edge substitute_e;

  if (animation==false) {//☆20190124☆

    for (int ii=0; ii<STK.one_stroke.size (); ii++) {

      //one_strokeに追加したものを全部取ってくる
      edge get_e=STK.one_stroke.get(ii);
      if (get_e!=null) {
        //Tiling[i][j]に代入
        substitute_e = Tiling[get_e.tiling_i][get_e.tiling_j].Edge[get_e.tiling_edge];

        strokeWeight(10);

        line(substitute_e.sx, substitute_e.sy, substitute_e.gx, substitute_e.gy);
        float theta=degrees(atan2(substitute_e.sy-substitute_e.gy, substitute_e.sx-substitute_e.gx));

        float cx, cy;
        cx=(substitute_e.sx+substitute_e.gx)/2;
        cy= (substitute_e.sy+substitute_e.gy)/2;
        strokeWeight(3);
        //↓矢印
        if (substitute_e.ori==true) {
          line(cx, cy, cx+20*cos(radians(30+theta)), cy+20*sin(radians(30+theta)));
          line(cx, cy, cx+20*cos(radians(-30+theta)), cy+20*sin(radians(-30+theta)));
        } else {   
          line(cx, cy, cx+20*cos(radians(210+theta)), cy+20*sin(radians(210+theta)));
          line(cx, cy, cx+20*cos(radians(150+theta)), cy+20*sin(radians(150+theta)));
        }
      }
    }

    for (int ii=0; ii<STK.one_stroke.size (); ii++) {
      if (ii==STK.one_stroke.size ()-2&&draw_endV) {
        fill(#4080FF);
        strokeWeight(0);
        ellipse(STK.e2x, STK.e2y, 40, 40);
        fill(#FF0000);
        
        ellipse(STK.e1x, STK.e1y, 40, 40);
      }
    }
  } else {//animation=trueのとき
    frameRate(3);
    for (int ii=0; ii<STK.one_stroke.size (); ii++) {
      if (anime_count==ii) {//☆20190124☆
        //one_strokeに追加したものを全部取ってくる
        edge get_e=STK.one_stroke.get(ii);
        if (get_e!=null) {
          //Tiling[i][j]に代入
          substitute_e = Tiling[get_e.tiling_i][get_e.tiling_j].Edge[get_e.tiling_edge];

          strokeWeight(10);

          line(substitute_e.sx, substitute_e.sy, substitute_e.gx, substitute_e.gy);
          float theta=degrees(atan2(substitute_e.sy-substitute_e.gy, substitute_e.sx-substitute_e.gx));

          float cx, cy;
          cx=(substitute_e.sx+substitute_e.gx)/2;
          cy= (substitute_e.sy+substitute_e.gy)/2;
          strokeWeight(3);
          //↓矢印
          if (substitute_e.ori==true) {
            line(cx, cy, cx+20*cos(radians(30+theta)), cy+20*sin(radians(30+theta)));
            line(cx, cy, cx+20*cos(radians(-30+theta)), cy+20*sin(radians(-30+theta)));
          } else {       
            line(cx, cy, cx+20*cos(radians(210+theta)), cy+20*sin(radians(210+theta)));
            line(cx, cy, cx+20*cos(radians(150+theta)), cy+20*sin(radians(150+theta)));
          }
        }
      }
    }
    for (int ii=0; ii<STK.one_stroke.size (); ii++) {//いらない
      if (ii==STK.one_stroke.size ()-2&&draw_endV) {
        fill(#4080FF);
        strokeWeight(0);
        ellipse(STK.e2x, STK.e2y, 40, 40);

        fill(#FF0000);
        ellipse(STK.e1x, STK.e1y, 40, 40);
        println(STK.e1x, STK.e1y);
      }
    }
  }
}
void draw_anime() {//☆20190124☆
  if (animation==true) {
    if (all_strokes.size()!=0) {      
      if (path_change==1) {

        stroke(stroke_color[path_num]);
        draw_one_stroke(all_strokes.get(path_num), true);
      } else if (path_change==0) {

        for (int i=0; i<all_strokes.size (); i++) {
          stroke(stroke_color[i]);
          draw_one_stroke(all_strokes.get(i), false);
        }
      }
    }
  }
}

