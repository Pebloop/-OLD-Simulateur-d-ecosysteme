//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//                                                                                  Gère les couches de mapMonde                                                                                       //
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

//----------------------------------------------------------------------------------VARIABLES COUCHES MAPS-----------------------------------------------------------------------------------------------
 int[][] altitude;
 int[][] biome;

/*======================================================================================================================================================================================================
================================================================================================FONCTIONS================================================================================================
=======================================================================================================================================================================================================*/

 void Generate_Altitude(){                                                          //Génére la carte altitude
   
   altitude = Map_Read("ressources/carte profondeur.png",new color[]{color(0,0,79),color(0,25,168),color(0,64,207),color(0,112,255), color(71,184,255),color(135,224,255),color(184,240,255),color(255,255,255),color(0,153,51),color(255,204,0),color(255,125,0),color(153,102,51),color(135,97,87),color(184,169,169),color(224,209,209),color(240,232,232)},new int[]{-8000,-6000,-5000,-4000,-3000,-1000,-200,-100,100,200,500,1000,2000,3000,4000,5000});
    int[][] newAltitude = new int [(int) (width*0.4)][(int)(height*0.37)];
    for(int i = 0; i < newAltitude.length ; i++)
    for(int j = 0; j < newAltitude[0].length ; j++)
      newAltitude[i][j] = altitude[int(i*(altitude.length/(float)newAltitude.length))][int(j*(altitude[0].length/(float)newAltitude[0].length))];
    altitude = newAltitude;
}
 
  void Generate_Biome(){                                                            //Génére la carte Biome
  
  biome = Map_Read("ressources/Carte Biome.png",new color[]{color(230,219,215),color(165,186,241),color(150,132,170),color(248,128,94), color(255,217,142),color(253,255,187),color(180,235,171),color(226,243,129),color(153,213,149),color(90,150,82),color(0,112,255)},new int[]{0,1,2,3,4,5,6,7,8,9,10});
    int[][] newBiome = new int [(int) (width*0.4)][(int)(height*0.37)];
    for(int i = 0; i < newBiome.length ; i++)
    for(int j = 0; j < newBiome[0].length ; j++)
      newBiome[i][j] = biome[int(i*(biome.length/(float)newBiome.length))][int(j*(biome[0].length/(float)newBiome[0].length))];
    biome = newBiome;
 }
 
 String GetBiomeName(int ID){                                                       //Renvoie en texte le biome d'ID (ID)
    switch(ID){
      case 0 :
       return "Prairie";
      case 1 :
       return "Toundra";
      case 2 :
       return "Montagne";
      case 3 :
       return "Broussaille";
      case 4 :
       return "Savane";
      case 5 :
       return "Désert";
      case 6 :
       return "Forêt tempérée";
      case 7 :
       return "Marécage";
      case 8 :
       return "Forêt boréale";
      case 9 :
       return "Forêt tropicale";
      case 10 :
       return "Eau";
     default :
       return "";
    }
   
 }
