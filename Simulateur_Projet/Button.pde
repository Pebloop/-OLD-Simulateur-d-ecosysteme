class Button{
  
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*======================================================================================================================================================================================================
==================================================================================================VARIABLES============================================================================================
======================================================================================================================================================================================================*/

  private float x,y, sizeX, sizeY;                                                           //position {x,y} de taille {sizeX,sizeY} du bouton
  private boolean isCircle, isImage = false;                                                 //{isCircle} est un cercle ? //{isImage} est une image
  private PImage image;                                                                      //PImage du bouton
  
/*======================================================================================================================================================================================================
==================================================================================================CONSTRUCTEURS============================================================================================
======================================================================================================================================================================================================*/
  
  Button(float n_x, float n_y, float n_sizeX, float n_sizeY){                                //Constructeur Bouton rectangle de position (n_x,n_y), de longueur n_sizeX et de hauteur n_sizeY
      x = n_x;
      y = n_y;
      sizeX = n_sizeX;
      sizeY = n_sizeY;
      isCircle = false;
    
  }
  
  Button(float n_x, float n_y, float n_sizeX){                                               //Constructeur Bouton rond de position (n_x,n_y), de diamètre n_sizeX
      x = n_x;
      y = n_y;
      sizeX = n_sizeX;
      sizeY = n_sizeX;
      isCircle = true;
    
  }
  
  Button(float n_x, float n_y, float n_sizeX, float n_sizeY, PImage n_image){                //Constructeur Bouton rectangle de position (n_x,n_y), de longueur n_sizeX et de hauteur n_sizeY et d'apparence n_image
      x = n_x;
      y = n_y;
      sizeX = n_sizeX;
      sizeY = n_sizeY;
      isCircle = false;
      image = n_image;
      isImage = true;
    
  }
  
  Button(float n_x, float n_y, float n_sizeX, PImage n_image){                              //Constructeur Bouton rond de position (n_x,n_y), de diamètre n_sizeX et d'apparence n_image
      x = n_x;
      y = n_y;
      sizeX = n_sizeX;
      sizeY = n_sizeX;
      isCircle = true;
      image = n_image;
      isImage = true;
  }
  
/*======================================================================================================================================================================================================
==================================================================================================FONCTIONS============================================================================================
======================================================================================================================================================================================================*/
  
  void Display(){                                                                           //Affiche le boutton
    if(isImage){
      image(image, x, y, sizeX, sizeY);
      
    }else if(isCircle){
      ellipse(x,y,sizeX,sizeY);
      
      
    }else{
      rect(x,y,sizeX,sizeY);
    }
  }
    
  
  boolean MouseClick(){                                                                    //Renvoie "true" si la souris est sur la zone cliquable, "false" sinon
    
       if(!isCircle) {
        if(mouseX>x && mouseX<x+sizeX && mouseY>y && mouseY<y+sizeY)
          return true;
        else return false;
       }
        
       if(isCircle) {
        if(((mouseX-x)*(mouseX-x)+(mouseY-y)*(mouseY-y)) <= (sizeX/2)*(sizeX/2)){
          return true;
        }else return false;
       }
       
       return false;
  }
  
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
}
