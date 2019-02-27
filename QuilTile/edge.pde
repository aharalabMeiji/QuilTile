class edge {
  //edgeは自分の番号（tiling[i][j]）を知らない
  float sx, sy, gx, gy;

  int tiling_i, tiling_j, tiling_edge;
  boolean ori;//順向きだったらture 

  edge() {
  }

  // edge に対して、(x, y)と反対側の頂点(opposite_x, opposite_y)をfloat[0]=opposite_x, float[1]=opposite_yの形で持ってくる
  // 本当はelseにはいかなくて、-10000の値は入らないはず。
  float[] get_opposite_vertex(float x, float y) {
    float[] coord = new float[2];
    println("-----");
    println("(sx,sy)=("+sx+","+sy+")" );
    println("(gx,gy)=("+gx+","+gy+")" );
    println("( x, y)=("+x+","+y+")" );    
    println("-----");

    if (same_position(sx, sy, x, y)) {
      println("gx, gy");
      coord[0] = gx;
      coord[1] = gy;
    } else if (same_position(gx, gy, x, y)) {
      println("sx, sy");
      coord[0] = sx;
      coord[1] = sy;
    } else {
      println("error");

      coord[0] = -10000;
      coord[1] = -10000;
    }
    return coord;
  }
}
boolean same_position(float x0, float y0, float x1, float y1) {    
  if (Math.abs(x0-x1)<2 && Math.abs(y0-y1)<2) return true;
  else return false;
}

class edge_connection {

  edge Edge1, Edge2;
  float ex, ey;//☆20190116
  boolean ori1, ori2;

  edge_connection(edge _e1, edge _e2) {

    Edge1=_e1;
    Edge2=_e2;
  }
  //☆20190116
  edge_connection(edge _e1, edge _e2, float _ex, float _ey) {

    Edge1=_e1;
    Edge2=_e2;
    ex=_ex;
    ey=_ey;
  }

  edge_connection(edge _e1, edge _e2, float _ex, float _ey, boolean _ori1, boolean _ori2) {

    Edge1=_e1;
    Edge2=_e2;
    ex=_ex;
    ey=_ey;
    ori1=_ori1;
    ori2=_ori2;
  }


  /*float get_center_vertex_X(){
   if(int(Edge1.sx+0.5)==int(Edge2.sx+0.5)&&int(Edge1.sy+0.5)==int(Edge2.sy+0.5)){
   return Edge1.sx;
   }
   if(int(Edge1.sx+0.5)==int(Edge2.gx+0.5)&&int(Edge1.sy+0.5)==int(Edge2.gy+0.5)){
   return Edge1.sx;
   }
   if(int(Edge1.gx+0.5)==int(Edge2.sx+0.5)&&int(Edge1.gy+0.5)==int(Edge2.sy+0.5)){
   return Edge1.gx;
   }
   if(int(Edge1.gx+0.5)==int(Edge2.gx+0.5)&&int(Edge1.gy+0.5)==int(Edge2.gy+0.5)){
   return Edge1.gx;
   }
   
   return 0;
   
   }
   float get_center_vertex_Y(){
   if(int(Edge1.sx+0.5)==int(Edge2.sx+0.5)&&int(Edge1.sy+0.5)==int(Edge2.sy+0.5)){
   return Edge1.sy;
   }
   if(int(Edge1.sx+0.5)==int(Edge2.gx+0.5)&&int(Edge1.sy+0.5)==int(Edge2.gy+0.5)){
   return Edge1.sy;
   }
   if(int(Edge1.gx+0.5)==int(Edge2.sx+0.5)&&int(Edge1.gy+0.5)==int(Edge2.sy+0.5)){
   return Edge1.gy;
   }
   if(int(Edge1.gx+0.5)==int(Edge2.gx+0.5)&&int(Edge1.gy+0.5)==int(Edge2.gy+0.5)){
   return Edge1.gy;
   }
   
   return 0;
   
   }*/

  //edge_connectionのアレイリストに追加していく
}

