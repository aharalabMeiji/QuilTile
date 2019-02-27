int get_degree(int _i, int _j) {
  //次数カウンター
  int count_degree=0;

  if (_j%2==0) {//下向き三角で右左の両端を考える if（左右）&&右下の逆三角 j%2==奇数ならば下向き三角
    if ((_i==0||_i==tile_W_Num-2)&&_j!=tile_H_Num-2) {
      if (_j>2) {
        if (compare_tile(_i, _j, _i, _j-1)==false) count_degree=1;
      }
    }
  } else if (_i==tile_H_Num-2&&_j==tile_W_Num-2) {//一番右下の処理
    //1辺の長さが96のときのみ右下と左下でカウントがかわる
    count_degree=0;
    if (tile_W_Num%2==0) {//(96のとき)(実は奇数だけど０始まりのせいで偶数扱い)
     //if ( compare_tile(_i-1, _j+1, _i, _j)==false)count_degree=1;//★直接入力じゃないとうまくいかない
     if ( compare_tile(5, 10, 5, 11)==false)count_degree=1;
     } else {
     count_degree=0;
     
     }
    
  } else if (_j==tile_H_Num-2) {//一番下の処理★0802で悩んだ右下の原因
    if (_j%4==3) {
      if (compare_tile(_i, _j-3, _i, _j-2)==false) count_degree++;
      if (compare_tile(_i, _j-3, _i-1, _j-2)==false) count_degree++;
    } else if (_j%4==1) {
      if (compare_tile(_i, _j-3, _i+1, _j-2)==false) count_degree++;
      if (compare_tile(_i, _j-3, _i, _j-2)==false) count_degree++;
    }
  } else if (_i==tile_W_Num-1) {//右はじの時

    if (_j%4==3) {
      if (compare_tile(_i, _j-3, _i-1, _j-2)==false) count_degree++;
      if (compare_tile(_i-1, _j-2, _i-1, _j-1)==false) count_degree++;
      if (compare_tile(_i-1, _j-1, _i, _j)==false) count_degree++;
    } else if (_j%4==1) {
      if (compare_tile(_i, _j-3, _i, _j-2)==false) count_degree++;
      if (compare_tile(_i, _j-2, _i, _j-1)==false) count_degree++;
      if (compare_tile(_i, _j-1, _i, _j)==false) count_degree++;
    }
  } else if (_j%4==3) {//その他①
    if (compare_tile(_i, _j-3, _i, _j-2)==false) count_degree++;
    if (compare_tile(_i, _j-2, _i, _j-1)==false) count_degree++;
    if (compare_tile(_i, _j-1, _i, _j)==false) count_degree++;
    if (compare_tile(_i, _j, _i-1, _j-1)==false) count_degree++;
    if (compare_tile(_i-1, _j-1, _i-1, _j-2)==false) count_degree++;
    if (compare_tile(_i-1, _j-2, _i, _j-3)==false) count_degree++;
  } else  if (_j%4==1) {//その他②
    if (compare_tile(_i, _j-3, _i+1, _j-2)==false) count_degree++;
    if (compare_tile(_i+1, _j-2, _i+1, _j-1)==false) count_degree++;
    if (compare_tile(_i+1, _j-1, _i, _j)==false) count_degree++;
    if (compare_tile(_i, _j, _i, _j-1)==false) count_degree++;
    if (compare_tile(_i, _j-1, _i, _j-2)==false) count_degree++;
    if (compare_tile(_i, _j-2, _i, _j-3)==false) count_degree++;
  }
  return count_degree;
}

boolean odd_degree(int _i, int _j) {
  //次数カウンターの結果を偶数か奇数かに分別
  //true→→→→奇数
  if (get_degree(_i, _j)%2==1) {
    return true;
  }
  return false;
}

int count_odd() {
  int count=0;
  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=1; j<tile_H_Num; j+=2) {
      if (odd_degree(i, j)) {
        //↓キャンバスの範囲内なら
        if (-10<=Tiling[i][j].x3&&Tiling[i][j].x3<=canvas_W+10&&-10<=Tiling[i][j].y3&&Tiling[i][j].y3<=canvas_H+10) {
          count++;
        }
      }
    }
    if (i==0||i==tile_W_Num) {
      //端っこの半端なところの処理（下向き三角形のx3,y1を利用）
      for ( int jj=0; jj<tile_H_Num; jj+=4) {
        if (odd_degree(i, jj)) {
          if (-10<=Tiling[i][jj].x3&&Tiling[i][jj].x3<=canvas_W+10&&-10<=Tiling[i][jj].y1&&Tiling[i][jj].y1<=canvas_H+10) {
            count++;
          }
        }
      }
    }
  }
  return count;
}

void draw_odd() {
  //タブがdifficultyのときに上向き三角形の赤い奇数の点（それぞれのタイルのx3,y3の値を利用）を表示
  if (tab_num==2) {

    for ( int i=0; i<tile_W_Num; i++ ) {
      for ( int j=1; j<tile_H_Num; j+=2) {
        if (odd_degree(i, j)) {
          if (-10<=Tiling[i][j].x3&&Tiling[i][j].x3<=canvas_W+10&&-10<=Tiling[i][j].y3&&Tiling[i][j].y3<=canvas_H+10) {

            fill(255, 0, 0);
            noStroke();
            ellipse(Tiling[i][j].x3, Tiling[i][j].y3, 18, 18);
            stroke(150);
          }
        } else {
        }
      }

      if (i==0||i==tile_W_Num-1) {//左端と右端のとき
        for ( int jj=0; jj<tile_H_Num; jj+=4) {
          if (odd_degree(i, jj)) {
            fill(255, 0, 0);
            noStroke();
            ellipse(Tiling[i][jj].x3, Tiling[i][jj].y1, 18, 18);
            stroke(150);
          }
        }
      }
    }
  }
}


boolean compare_tile(int i1, int j1, int i2, int j2) {
  //隣のタイルと色、柄、texture_onが一緒かを調べる
  //一緒だったらtrueとして返す

  if (i1>=0&&j1>=0&& i1<tile_W_Num&&j1<tile_H_Num&&i2>=0&&j2>=0&& i2<tile_W_Num&&j2<tile_H_Num) {

    if (Tiling[i1][j1].texture_on!=Tiling[i2][j2].texture_on) return false;
    if (Tiling[i1][j1].texture_on==false&&Tiling[i1][j1].tileColor!=Tiling[i2][j2].tileColor) return false;    
    if (Tiling[i1][j1].texture_on==true&&Tiling[i1][j1].tileImage!=Tiling[i2][j2].tileImage) return false;
  }
  return true;
}

