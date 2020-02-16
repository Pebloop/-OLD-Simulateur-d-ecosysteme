class Grenouille extends Animal{
  
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
/*======================================================================================================================================================================================================
==================================================================================================CONSTANTES============================================================================================
======================================================================================================================================================================================================*/

  final private String MAP_PATH = "ressources/map animaux/map_Grenouille.png";             //Chemin vers la carte de présence de renard sur la terre
  final private PImage ICONE = icone_Grenouille;                                           //ID de la PImage de l'icone de slection
  final private int[] BIOME_ADAPT = {4,0,1,0,0,-1,4,2,4,3,-30};                        //Tableau des valeurs de l'adaptation aux biome [0-10]
  final private String[] PREY_LIST = {};                                               //Liste des proies de l'espèce
  final private int CONCENTRATION_MIN = 6;                                             //Concentration minimale de l'animal au km²
  final private int CONCENTRATION_MAX = 7;                                             //Concentration maximale de l'animal au km²
  final private int SANTE = 30;                                                        //Résistance à l'habitat
  final private int ENFANT_MIN = 800;                                                    //Nombre minimale d'enfants par portée
  final private int ENFANT_MAX = 2000;                                                    //Nombre maximal d'enfants pas portée
  
  final private int DEFINE_VITESSE_PROPAGATION = 1;                                    //vitesse de propagation en pourcentage lors de la migration mensuelle
  final private int DEFINE_DUREE_VIE = 7;                                              //Durée de vie en année maximale
  final private int DEFINE_VIEILLESSE_MIN = 6;                                         //Durée de vie minimale
  final private String DEFINE_NOM_ESPECE = "Grenouille";                                   //Nom de l'espèce
  
/*======================================================================================================================================================================================================
==================================================================================================CONSTRUCTEUR==========================================================================================
======================================================================================================================================================================================================*/

   Grenouille(){ 
     DUREE_VIE = DEFINE_DUREE_VIE;
     VIEILLESSE_MIN = DEFINE_VIEILLESSE_MIN;
     VITESSE_PROPAGATION = DEFINE_VITESSE_PROPAGATION;
     NOM_ESPECE = DEFINE_NOM_ESPECE;
     
     icone = ICONE;
     gestation = new int[altitude.length][altitude[0].length][1]; 
     posMap = new int[altitude.length][altitude[0].length];
     sante = new int[altitude.length][altitude[0].length];
     boolean[][] nbreAnimal = TestColor(GetMap(MAP_PATH),color(255,0,0));
     causeMort = new int[4];
     mort = 0;
     totalMorts = 0;
     naissance = 0;
     totalNaissances = 0;
     biomeAdaptibilite = BIOME_ADAPT;
     prey = PREY_LIST;
     age =new int[DUREE_VIE];
     
    nbreAnimal = ResizeMap(nbreAnimal);
    
    //algorithme qui place les animaux en fonction de leurs concentration 
    for(int i = 0; i < nbreAnimal.length ; i++)
    for(int j = 0; j < nbreAnimal[0].length ; j++){
      int random = int(random(CONCENTRATION_MIN,CONCENTRATION_MAX));
      int animalParCase = TERRE_PERIMETRE/nbreAnimal.length;
      if(nbreAnimal[i][j]) posMap[i][j] = animalParCase*random;
     // println("nombre renards : " + posMap[i][j]);
    }
    
    age = Dispatch(GetCount(),DUREE_VIE);
    
    for(int i = 0; i < sante.length ; i++) for(int j = 0; j < sante[0].length ; j++) sante[i][j] = SANTE;
 
  }
  
/*======================================================================================================================================================================================================
==================================================================================================FONCTIONS=============================================================================================
======================================================================================================================================================================================================*/  

  
//--------------------------------------------------------------------------------------------------GETTER----------------------------------------------------------------------------------------------
  
//------------------------------------------------------------------------------------------------FONCTION----------------------------------------------------------------------------------------------
  
  public void DoCycle(){                                                                      //Fais un cycle par jour
      Old();
      Move();
      for(int i = 0; i<posMap.length;i++)
        for(int y = 0; y <posMap[0].length;y++){
          if(posMap[i][y]>0){
            if(altitude[i][y] <= 0) Die(i,y,CAUSE_HABITAT,posMap[i][y]);
            Breed(i,y);
            TestBiome(i,y);
          }
        }
        
     CalculCauseMort();
  }
    
  private void Breed(int x,int y){                                                           //algorythme de reproduction
      if((mois == 5) && jour == 1)
        for(int i =0;i<posMap[x][y]/2;i++){
           int ran =  int(random(0,100));
           if(ran<20){
             gestation[x][y][0]++;
           }
          
          
        }
        
        if(jour==1 && mois == 6){
          int ran = int(random(ENFANT_MIN,ENFANT_MAX+1));
              Born(x,y,gestation[x][y][mois-3]*ran);
                gestation[x][y][mois-3] = 0;
            
        
          
        } 
      
    }
  
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
  
}
