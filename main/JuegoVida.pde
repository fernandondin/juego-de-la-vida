public class JuegoVida{
  private int[][] celulas;
  private int tam;
  public JuegoVida(int tam){
    this.tam=tam;
    celulas = new int[tam][tam];
  }
  private void revisaVecinos(int i,int j,int[][] aux){
      int nVecinos=0;
      boolean viva = aux[i][j]==1?true:false;
      try{nVecinos+=aux[i-1][j-1];}catch(IndexOutOfBoundsException iobe){}
      try{nVecinos+=aux[i][j-1];}catch(IndexOutOfBoundsException iobe){}
      try{nVecinos+=aux[i+1][j-1];}catch(IndexOutOfBoundsException iobe){}
      try{nVecinos+=aux[i-1][j];}catch(IndexOutOfBoundsException iobe){}
      try{nVecinos+=aux[i+1][j];}catch(IndexOutOfBoundsException iobe){}
      try{nVecinos+=aux[i-1][j+1];}catch(IndexOutOfBoundsException iobe){}
      try{nVecinos+=aux[i][j+1];}catch(IndexOutOfBoundsException iobe){}
      try{nVecinos+=aux[i+1][j+1];}catch(IndexOutOfBoundsException iobe){}
      if(viva && nVecinos == 2 || viva && nVecinos == 3){
        return;
      }
      if(!viva && nVecinos==3){
        celulas[i][j]=1;
        return;
      }
      if(viva && nVecinos > 3 || viva && nVecinos < 2){
        celulas[i][j]=0;
      }
  }
  public int[][] copiaArreglo(){
    int[][] aux = new int[tam][tam];
    for (int i=0;i<tam;i++) {
      for(int j=0;j<tam;j++){
        aux[i][j]=celulas[i][j];
      }
    }
    return aux;
  }
  public void juega(){
    imprimeMundo();
      int[][] aux = copiaArreglo();
      for (int i=0;i<tam;i++) {
        for(int j=0;j<tam;j++){
          revisaVecinos(i,j,aux);
        }
      }
      imprimeMundo();
      System.out.println();
      try{
        Thread.sleep(500);
      }catch(InterruptedException e){}
  }
  public void colocaCelula(int i,int j,int vivaMuerta){
    celulas[i][j]=vivaMuerta;
  }
  public int[][] getCelulas(){
    return celulas; 
  }
  public void imprimeMundo(){
    for (int i=0;i<tam;i++) {
      for(int j=0;j<tam;j++){
        if(celulas[i][j]==1)
          System.out.print("0");
        else
          System.out.print("*");
      }
      System.out.println();
    }
    System.out.println();
  }
}
