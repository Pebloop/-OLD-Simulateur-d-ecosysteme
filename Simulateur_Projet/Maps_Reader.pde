//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//                                                                                   fonctions qui lisent des cartes                                                                                   //
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

PImage GetMap(String imageName){                                                      //Charge l'image du chemin (imageName)
    PImage img;
    img = loadImage(imageName);
    return img;
}

boolean[][] TestColor(PImage image, color c){                                         //Retourne une carte renvoyant vrai en tout point où la couleur (c) est présente sur l'image (image)                                       
  boolean[][] map = new boolean[image.width][image.height];  
  image.loadPixels();
  for(int i = 0; i< image.width*image.height;i++)
  {
    int y_map = i/image.width;
    int x_map = i-(y_map*image.width);
     if(image.pixels[i] == c)
       map[x_map][y_map] = true;
       else map[x_map][y_map] = false;
    
  }
  
  return map;
  
}

int[][] Map_Read(String Imap, color[] tColor,int[] returnValue) {                     //Renvoie une carte  de valeurs de la carte (Imap), conversant tColor --> returnValue
    PImage map = GetMap(Imap);
    int[][] finalMap = new int[map.width][map.height];
 
    for(int i = 0; i<tColor.length;i++)
      {
        boolean[][] test = TestColor(map,tColor[i]);
        for(int j = 0; j < test.length;j++)
          for(int k = 0; k < test[0].length; k++)
            {
              if(test[j][k]) finalMap[j][k] = returnValue[i];
            }
       }
    return finalMap;
  }
  
  boolean[][] ResizeMap(boolean[][] original){                                        //Redimmensionne une carte (original) 
   boolean[][] nouvelle = new boolean[(int) (width*0.4)][(int)(height*0.37)];
   for(int i = 0; i < nouvelle.length ; i++)
    for(int j = 0; j < nouvelle[0].length ; j++)
      nouvelle[i][j] = original[int(i*(original.length/(float)nouvelle.length))][int(j*(original[0].length/(float)nouvelle[0].length))];
    return nouvelle;
    
    
  }
