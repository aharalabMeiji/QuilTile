class strokes{
  ArrayList<edge> one_stroke;
  float e1x,e1y,e2x,e2y;
  strokes(){
    one_stroke=new ArrayList<edge>();
   
  }
}
ArrayList<strokes> all_strokes;
boolean used[];

void find_all_strokes(){
  all_strokes=new ArrayList<strokes>();
  used=new boolean[chain.size()];
  for(int i=0; i<chain.size(); i++){
    used[i]=false;
  }
  for(int i=0; i<chain.size(); i++){
    if(used[i]==false){
      make_one_stroke(i); //one_strokeを作ってall_strokesに追加する
    }
  }

}
