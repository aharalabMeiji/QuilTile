//柄を描画

void drawTexture() {
  for (int ii=0; ii<4; ii++) {

    if (ii==0) mizutama(texture_color_1[ii], texture_color_2[ii]);
    if (ii==1) ohana(texture_color_1[ii], texture_color_2[ii]);
    if (ii==2) gingamu(texture_color_1[ii], texture_color_2[ii]);
    if (ii==3) stripe(texture_color_1[ii], texture_color_2[ii]);

    if (textureFlag[ii]==true) {
      String imageName="textureSave.png";
      saveFrame("image/"+imageName);
      PImage imgTexture =loadImage("image/"+imageName);
      imgTexture = imgTexture.get(0, 0, canvas_W, canvas_H);
      imgTexture.save("texture/texture"+ii+".png");


      imgTextureUI[ii] =loadImage("image/"+imageName);
      imgTextureUI[ii] = imgTexture.get(0, 0, canvas_H*130/800, canvas_H*130/800);
      imgTextureUI[ii].save("texture/imgTextureUI"+ii+".png");



      texture[ii]=loadImage("texture/texture"+ii+".png");
    }
    textureFlag[ii]=false;
  }

  for ( int i=0; i<tile_W_Num; i++ ) {
    for ( int j=0; j<tile_H_Num; j++ ) {
      draw1(i, j);
    }
  }
}

void mizutama(color _texture_color_1, color _texture_color_2) {
  fill(_texture_color_1);
  noStroke();
  rect(0, 0, canvas_W, canvas_H);


  for ( int i=0; i<tile_W_Num*3.5; i++ ) {
    for ( int j=0; j<tile_H_Num*2.5; j++ ) {

      noStroke();
      fill(_texture_color_2);
      ellipse(i*30, j*30, 10, 10);
      ellipse(i*30+15, j*30+15, 10, 10);
    }
  }
}

void gingamu(color _texture_color_1, color _texture_color_2) {

  fill(lerpColor(_texture_color_1, _texture_color_2, 0.5));
  noStroke();
  rect(0, 0, canvas_W, canvas_H);

  for ( int i=0; i<tile_W_Num*3.5; i++ ) {
    for ( int j=0; j<tile_H_Num*3; j++ ) {

      noStroke();
      fill(_texture_color_1);

      rect(i*30, j*30, 15, 15);
      fill(_texture_color_2);
      rect(i*30+15, j*30+15, 15, 15);
    }
  }
}

void ohana(color _texture_color_1, color _texture_color_2) {
  //fill(lerpColor(_texture_color_1, _texture_color_2, 0.5));
  fill(255);
  noStroke();
  rect(0, 0, canvas_W, canvas_H);


  for ( int i=0; i<tile_W_Num*3.5; i++ ) {
    for ( int j=0; j<tile_H_Num*2.5; j++ ) {

      noStroke();
      
      fill(_texture_color_1);
         
      ellipse(i*30+15-5, j*30+15-5, 10, 10);
      ellipse(i*30+15+5, j*30+15+5, 10, 10);
      ellipse(i*30+15+5, j*30+15-5, 10, 10);
      ellipse(i*30+15-5, j*30+15+5, 10, 10);
       
      fill(_texture_color_2);

      ellipse(i*30+15, j*30+15, 7, 7);
    }
  }
}

void stripe(color _texture_color_1, color _texture_color_2){
  
  fill(_texture_color_2);
  noStroke();
  rect(0, 0, canvas_W, canvas_H);

  for ( int i=0; i<tile_W_Num*5; i++ ) { 

      noStroke();
      fill(_texture_color_1);

      rect(i*20, 0, 10, canvas_H);
     

  }
}

