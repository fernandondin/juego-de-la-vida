import java.util.Random;
Random r;
boolean pausa;
JuegoVida jv;
void setup(){
  jv = new JuegoVida(30);
  pausa = true;
  background(157, 186, 227);
  size(700,600);
  r = new Random();
  fill(0);
  rect(300,300,600,0.5);
  fill(255);
  noStroke();
  triangle(685,150, 620, 100, 620, 200);
  rect(630,450,10,50);
  rect(660,450,10,50);
  stroke(0);
  for(int i=0;i<30;i++){
    for(int j=0;j<30;j++){
      rect(i*20,j*20,20,20);
    }
  }
}
void draw(){
   if(pausa){
    return;
   }
   jv.juega();
   pintaCelulas();
   
}
void pintaCelulas(){
   int[][] cel = jv.getCelulas();
   for(int i=0;i<30;i++){
     for(int j=0;j<30;j++){
       if(cel[i][j]==0){
         fill(250);
         rect(i*20,j*20,20,20);
       }else{
         fill(194, 138, 255);
         rect(i*20,j*20,20,20);
       }
     }
   }
}
void mousePressed() {
  int x =mouseX/20;
  int y = mouseY/20;
  if(x > 29 && y > 14){
    System.out.println("Pausa");
    pausa=true;
  }else if(x > 29 && y <= 14){
    System.out.println("Play");
    pausa = false;
  }else if(jv.getCelulas()[mouseX/20][mouseY/20] == 0){
    jv.colocaCelula(x,y,1);
  }else{
    jv.colocaCelula(x,y,0);
  }
  pintaCelulas();
}
