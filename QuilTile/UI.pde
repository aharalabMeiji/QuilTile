//ひたすらUIを描画

int tab_num=0;
int tab_size=4;
int tab_W;
int path_num=0;


void drawPalette() {

  stroke(150);
  fill(#FFE5F2);
  rect(canvas_W-tweak, 0, ui_W+tweak, canvas_H);//UI

  for (int i=0; i<10; i++) {

    fill(select_color[i]);
    if (selected==i+1) stroke(255);
    strokeWeight(3);
    ellipse(canvas_W+canvas_H*42/750+canvas_H*58/750*(i%5), canvas_H*75/750+canvas_H*66/750*(i/5), canvas_H*50/800, canvas_H*50/800);

    fill(50);
    textAlign(CENTER, CENTER);
    textSize(int(canvas_H*15/800));
    if (selected==i+1)fill(255);
    stroke(150);
  }

  for (int i=0; i<4; i++) {
    image(imgTextureUI[i], canvas_W+canvas_H*21/750+canvas_H*150/750*(i%2), canvas_H*200/750+canvas_H*150/750*(i/2), canvas_H*130/800, canvas_H*130/800);
    noFill();
    if (selected==i+11) stroke(255);
    rect(canvas_W+canvas_H*21/750+canvas_H*150/750*(i%2), canvas_H*200/750+canvas_H*150/750*(i/2), canvas_H*130/800, canvas_H*130/800);
    stroke(150);    
    fill(50);
    textAlign(CENTER, CENTER);
    textSize(int(canvas_H*18/800));
    if (selected==i+11)fill(255);
  }

  fill(200);
  ellipse(canvas_W+ui_W*3/10, canvas_H*720/800, canvas_H*70/800, canvas_H*70/800);
  fill(50);
  textAlign(CENTER, CENTER);
  textSize(int(canvas_H*18/800));
  text("save", canvas_W+ui_W*3/10, canvas_H*720/800);

  fill(200);
  ellipse(canvas_W+ui_W*7/10, canvas_H*720/800, canvas_H*70/800, canvas_H*70/800);
  fill(50);
  textAlign(CENTER, CENTER);
  textSize(int(canvas_H*18/800));
  text("random", canvas_W+ui_W*7/10, canvas_H*720/800);
}


void tab0() {
  animation=false;//☆20190124☆
  if (mouseClicked==true) {
    if (dist(mouseX, mouseY, canvas_W+ui_W*1.8/10, stroke_lineY)< canvas_H*30/750) {
      if (init_strokeWeight + plus_strokeWeight>0) {
        plus_strokeWeight--;
        /*println(plus_strokeWeight);
         println("-");*/
      }
    }
    if (dist(mouseX, mouseY, canvas_W+ui_W*8.2/10, stroke_lineY)< canvas_H*30/750) {
      plus_strokeWeight++;
      /*println(plus_strokeWeight);
       println("+");*/
    }
    mouseClicked=false;

    for ( int i=0; i<tile_W_Num; i++ ) {
      for ( int j=0; j<tile_H_Num; j++ ) {
        Tiling[i][j].displayTile1();
      }
    }
    for ( int i=0; i<tile_W_Num; i++ ) {
      for ( int j=0; j<tile_H_Num; j++ ) {
        Tiling[i][j].displayTile2();
      }
    }
  }
  drawPalette();


  noStroke();
  for (int i=1; i<6; i++) {

    ellipse(canvas_W+ui_W*19/100+i*30, stroke_lineY, 5+i*4, 5+i*4);
  }

  stroke(150);

  strokeWeight(3);
  fill(255);
  triangle(canvas_W+ui_W*1/10, stroke_lineY, canvas_W+ui_W*2.5/10, stroke_lineY-canvas_H*20/750, canvas_W+ui_W*2.5/10, stroke_lineY+canvas_H*20/750);
  triangle(canvas_W+ui_W*9/10, stroke_lineY, canvas_W+ui_W*7.5/10, stroke_lineY-canvas_H*20/750, canvas_W+ui_W*7.5/10, stroke_lineY+canvas_H*20/750);
}

void tab1() {
  animation=false;//☆20190124☆
  strokeWeight(3);
  stroke(150);
  fill(#FFE5F2);
  rect(canvas_W-tweak, 0, ui_W+tweak, canvas_H);

  for (int i=0; i<6; i++) {

    image(Escher_UI[i], canvas_W+canvas_H*21/750+canvas_H*150/750*(i%2), canvas_H*80/750+canvas_H*150/750*(i/2), canvas_H*130/800, canvas_H*130/800);
    noFill(); 
    rect(canvas_W+canvas_H*21/750+canvas_H*150/750*(i%2), canvas_H*80/750+canvas_H*150/750*(i/2), canvas_H*130/800, canvas_H*130/800);
    stroke(150);    
    fill(50);
    textAlign(CENTER, CENTER);
    textSize(int(canvas_H*18/800));
  }

  fill(200);
  ellipse(canvas_W+ui_W*3/10, canvas_H*720/800, canvas_H*70/800, canvas_H*70/800);
  fill(50);
  textAlign(CENTER, CENTER);
  textSize(int(canvas_H*18/800));
  text("save", canvas_W+ui_W*3/10, canvas_H*720/800);

  fill(200);
  ellipse(canvas_W+ui_W*7/10, canvas_H*720/800, canvas_H*70/800, canvas_H*70/800);
  fill(50);
  textAlign(CENTER, CENTER);
  textSize(int(canvas_H*18/800));
  text("random", canvas_W+ui_W*7/10, canvas_H*720/800);

  noStroke();
  for (int i=1; i<6; i++) {

    ellipse(canvas_W+ui_W*19/100+i*30, stroke_lineY, 5+i*4, 5+i*4);
  }

  stroke(150);

  strokeWeight(3);
  fill(255);
  triangle(canvas_W+ui_W*1/10, stroke_lineY, canvas_W+ui_W*2.5/10, stroke_lineY-canvas_H*20/750, canvas_W+ui_W*2.5/10, stroke_lineY+canvas_H*20/750);
  triangle(canvas_W+ui_W*9/10, stroke_lineY, canvas_W+ui_W*7.5/10, stroke_lineY-canvas_H*20/750, canvas_W+ui_W*7.5/10, stroke_lineY+canvas_H*20/750);



  if (mouseClicked==true) {
    if (dist(mouseX, mouseY, canvas_W+ui_W*1.8/10, stroke_lineY)< canvas_H*30/750) {
      if (init_strokeWeight + plus_strokeWeight>0) {
        plus_strokeWeight--;
      }
    }
    if (dist(mouseX, mouseY, canvas_W+ui_W*8.2/10, stroke_lineY)< canvas_H*30/750) {
      plus_strokeWeight++;
    }
    mouseClicked=false;
  }
}
void tab2() {

  //土台
  fill(#FFE5F2);
  //fill(0);
  strokeWeight(3);  
  stroke(150);
  rect(canvas_W-tweak, 0, ui_W+tweak, canvas_H);



   fill(50);
  textSize(30);
  int line_num=(count_all_line()/2);
 
  float sewing_constant_a=0.002;
  float sewing_constant_b=0.55;
 

  int sewing_time=int(R_size*line_num*sewing_constant_a+count_odd()*sewing_constant_b);
  println(line_num,sewing_constant_a, sewing_constant_b);
  //時間と分に分ける
  int h=sewing_time/60;
  int min =sewing_time%60;
  text("It takes about...", canvas_W+ui_W*1/2, canvas_H*150/800);
  text(h+" h "+min+" min", canvas_W+ui_W*1/2, canvas_H*200/800);
  text("Odd point : "+count_odd(), canvas_W+ui_W*1/2, canvas_H*300/800);
  int stroke_num;
  if (count_odd()==0)stroke_num=1;
  else stroke_num=count_odd()/2;
  text(stroke_num+"-stroke sketch", canvas_W+ui_W*1/2, canvas_H*400/800);



  for (int i=0; i<2; i++) {

    image(scaling[i], canvas_W+canvas_H*21/750+canvas_H*150/750*(i%2), canvas_H*450/750+canvas_H*150/750*(i/2), canvas_H*130/800, canvas_H*130/800);
    noFill(); 
    rect(canvas_W+canvas_H*21/750+canvas_H*150/750*(i%2), canvas_H*450/750+canvas_H*150/750*(i/2), canvas_H*130/800, canvas_H*130/800);
    stroke(150);    
    fill(50);
    textAlign(CENTER, CENTER);
    textSize(int(canvas_H*18/800));
  }
}


int path_change=0;
int animation_change=0;
boolean animation=false;//☆20190124☆
color []  stroke_color;//☆20190124☆
void tab3() {

  //経路を書く
  find_all_strokes();

  if (animation==false) {//☆20190124☆
    anime_count=0;
    if (all_strokes.size()!=0) {
      if(animation_change==0)stroke_color=new color[all_strokes.size()];
      for (int i=0; i<all_strokes.size (); i++) {

        if(animation_change==0)stroke_color[i]=color(int(random(255)), int(random(255)), int(random(255)));
      }
      if (path_change==0) {
        println("all_strokes_size:"+all_strokes.size());

        for (int i=0; i<all_strokes.size (); i++) {
          stroke(stroke_color[i]);
          //draw_one_stroke(all_strokes.get(i), false);
        }
        if (animation_change==0) {
          animation=true;
        } else {
          for (int i=0; i<all_strokes.size (); i++) {  
            stroke(stroke_color[i]); 
            draw_one_stroke(all_strokes.get(i), false);
          }
        }
      }
    }
    if (path_change==1) {
      anime_count=0;
      if(animation_change==0)animation=true;
      stroke(stroke_color[path_num]);
      draw_one_stroke(all_strokes.get(path_num), true);
    }
  }

  strokeWeight(3);
  stroke(150);
  fill(#FFE5F2);
  rect(canvas_W-tweak, 0, ui_W, canvas_H);

  for (int i=0; i<2; i++) {
    //routeのundo,redoのUI
    image(undo_redo[i], canvas_W+canvas_H*21/750+canvas_H*150/750*(i%2), canvas_H*80/750+canvas_H*150/750*(i/2), canvas_H*130/800, canvas_H*130/800);
    noFill(); 
    rect(canvas_W+canvas_H*21/750+canvas_H*150/750*(i%2), canvas_H*80/750+canvas_H*150/750*(i/2), canvas_H*130/800, canvas_H*130/800);
    stroke(150);    
    fill(50);
    textAlign(CENTER, CENTER);
    textSize(int(canvas_H*18/800));
  }
  for (int i=0; i<2; i++) {
    //all_strokesとone_by_oneの切り替え

    if (path_change==0) {
      if (i==0)fill(#FFC4C4);
      else if (i==1)fill(240);
    } else {
      if (i==0)fill(240);
      else if (i==1) fill(#C4D5FF);
    }
    rect(canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2), canvas_H*250/750+canvas_H*150/750*(i/2), canvas_H*135/800, canvas_H*100/800);
    stroke(150);    
    fill(50);
    textAlign(CENTER, CENTER);
    textSize(int(canvas_H*18/800));
    if (i==0)text("all routes", canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2)+canvas_H*135/800/2, canvas_H*250/750+canvas_H*150/750*(i/2)+canvas_H*100/800/2);
    if (i==1)text("one by one", canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2)+canvas_H*135/800/2, canvas_H*250/750+canvas_H*150/750*(i/2)+canvas_H*100/800/2);
  }
  for (int i=0; i<2; i++) {
    //animationの切り替え

    if (animation_change==0) {
      if (i==0)fill(#FFC4C4);
      else if (i==1)fill(240);
    } else {
      if (i==0)fill(240);
      else if (i==1) fill(#C4D5FF);
    }
    rect(canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2), canvas_H*400/750+canvas_H*150/750*(i/2), canvas_H*135/800, canvas_H*100/800);
    stroke(150);    
    fill(50);
    textAlign(CENTER, CENTER);
    textSize(int(canvas_H*18/800));
    if (i==0)text("animation on", canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2)+canvas_H*135/800/2, canvas_H*400/750+canvas_H*150/750*(i/2)+canvas_H*100/800/2);
    if (i==1)text("animation off", canvas_W+canvas_H*25/750+canvas_H*130/750*(i%2)+canvas_H*135/800/2, canvas_H*400/750+canvas_H*150/750*(i/2)+canvas_H*100/800/2);
  }
}

void tab_change() {  
  tab_W=ui_W/tab_size;

  if (mousePressed) {
    for (int i=0; i<tab_size; i++) {
      if (canvas_W+2+tab_W*i<=mouseX&&mouseX<=canvas_W+2+tab_W*i+canvas_H*tab_W/750&&0<=mouseY&&mouseY<=canvas_H*40/750) {
        tab_num=i;
      }
    }
  }
}

void tabs() {
  tab_W=ui_W/tab_size;

  if (tab_num==0) {
    tab0();
  } else if (tab_num==1) {
    tab1();
  } else if (tab_num==2) {
    all_strokes=new ArrayList<strokes>();
    tab2();
  } else if (tab_num==3) {
    all_strokes=new ArrayList<strokes>();
    tab3();
  }

  for (int i=0; i<tab_size; i++) {
    fill(200);
    if (i==tab_num) fill(240);
    rect(canvas_W+tab_W*i-tweak, 0, tab_W, canvas_H*40/750);
    fill(50);
    textSize(int(canvas_H*18/800));
    if (i==0) {   
      text("palette", canvas_W+2+tab_W*i+tab_W/2-tweak, canvas_H*20/750);
    } else if (i==1) {
      text("Escher", canvas_W+2+tab_W*i+tab_W/2-tweak, canvas_H*20/750);
    } else if (i==2) {
      text("difficulty", canvas_W+2+tab_W*i+tab_W/2-tweak, canvas_H*20/750);
    } else if (i==3) {
      text("route", canvas_W+2+tab_W*i+tab_W/2-tweak, canvas_H*20/750);
    }
  }

  noFill();
  strokeWeight( init_strokeWeight + plus_strokeWeight);
  rect(0, 0, canvas_W-tweak, height);
}

