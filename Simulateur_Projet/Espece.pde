abstract class Espece{
  
 //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
/*======================================================================================================================================================================================================
==================================================================================================VARIABLES=============================================================================================
======================================================================================================================================================================================================*/    

  protected int[][] posMap;                                              //Carte de la quantité d'animaux en [x][y]
  protected int[] age;                                                   //variable indiquant la quantité d'animaux vieux de [x] ans
  protected int[][][] gestation;                                         //carte indiquant les animaux enceinte en [x][y] et leurs positions [i] en jours, mois ou années en fonction de l'espèce
  protected int mort, totalMorts;                                        //morts au court d'un cycle // morts totaux de l'espèce
  protected int naissance, totalNaissances;                              //naissances au court d'un cycle // naissances totaux de l'espèce
  protected PImage icone;                                                //PImage de l'icone pour la selection
  protected int[] biomeAdaptibilite = new int[11];                       //tableau de tolérance d'un biome par l'espèce
  protected int[][] sante;                                               //carte de la sante des animaux
  protected int[] causeMort = new int[4];                                //tableau recensceant les causes de morts de l'espece
  protected int strCauseMort = -1;                                       //ID de la cause principale de morts
  
/*======================================================================================================================================================================================================
==================================================================================================CONSTANTES============================================================================================
======================================================================================================================================================================================================*/  
 
 final protected int CAUSE_VIEILLESSE = 0;                               //Retourne l'ID de la cause de la mort
 final protected int CAUSE_MANGE = 1;                                    ///
 final protected int CAUSE_FAMINE = 2;                                   ///
 final protected int CAUSE_HABITAT = 3;                                  ///

//-----------------------------------------------------------------------------------------CONST PERSONELLES--------------------------------------------------------------------------------------------
 
 protected int DUREE_VIE;
 protected int VIEILLESSE_MIN;
 protected String NOM_ESPECE;
  
/*======================================================================================================================================================================================================
================================================================================================FONCTIONS================================================================================================
=======================================================================================================================================================================================================*/  
  
//---------------------------------------------------------------------------------------------ABSTRAITES----------------------------------------------------------------------------------------------
 
  //abstract void AfficherAttibuts();                                    //affiche les attributs de l'animal (taille, queue, ..)
  abstract void DoCycle();                                               //réalise le cycle de l'espèce

//---------------------------------------------------------------------------------------------GETTERS--------------------------------------------------------------------------------------------------

  public int GetMort(){                                                  //morts par cycle
    return mort;
  }
  
  public int GetTotalMorts(){                                            //morts totaux
    return totalMorts;
  }
  
  public int GetNaissance(){                                             //naissances par cycle
    return naissance;
  }
  
  public int GetTotalNaissances(){                                       //naissances totales
    return totalNaissances;
  }
  
  public PImage GetIcone(){                                              //ID de l'icone de sélection
     return icone; 
  }
  
  public String GetSpecies(){                                            //Nom de l'espèce
   return NOM_ESPECE; 
  }
  
  public int GetCount(){                                                 //quantitée totale d'animaux
    int count = 0;
    for(int i = 0; i<posMap.length;i++)
      for(int y =0; y<posMap[0].length;y++)
        count+= posMap[i][y];
    return count;
  }
  
  public int GetAt(int x, int y){                                        //Quantitée de l'espèce en (x,y) 
    return posMap[x][y];
  }
  
  public float GetAgeMoyen(){                                            //Renvoie l'age moyen de l'espèce
    int result = 0;
    for(int i =0; i<age.length;i++){
      //println("age " + i + " = " + age[i]);
      result+=i*age[i];
    }
    result /= GetCount();
    return result;
  }
  
  public String GetCauseMort(){                                           //Cause de la mort en texte
     switch(strCauseMort){
       case 0 :
         return "Viellesse";
       case 1 :
         return "mangé";
       case 2 :
         return "famine";
       case 3 :
         return "habitat";
       default :
         return "";
     }
    
  }
  

//---------------------------------------------------------------------------------------------FONCTIONS-------------------------------------------------------------------------------------------------

  public void Zero(){                                                    //reinitialise les variables de cycle
    mort = 0;
    naissance = 0;
  }
  
  
  public void Display(){                                                 //Affiche l'espèce sur la carte principale
    for(int i = 0; i < posMap.length ; i++)
    for(int j = 0; j < posMap[0].length ; j++){
      if(posMap[i][j]>0){
      stroke(255, 0, 0, posMap[i][j]*1);
      point(i+10,j+height*0.62);
      }
    }
    stroke(255,255,255,255);
  
}
  
  protected void CalculCauseMort(){                                      //calcule la raison principale de la mort
     
    int value = 0;
    int id = -1;
    for(int i =0; i<causeMort.length;i++){
      if(causeMort[i]> value){
        value = causeMort[i];
        id = i;
      }
    }
    
    strCauseMort = id;
    
  }

  public void Die(int x, int y, int cause){                             //Tue un membre de l'espèce en (x,y) pour la raison (cause)
    if(posMap[x][y] >0){
    posMap[x][y] -= 1;
    mort++;
    totalMorts++;
    causeMort[cause]++;
    int ran;
    do{ran = int(random(0,DUREE_VIE));}while(age[ran]<=0);
    age[ran]--;
    }
  }
  
  protected void ODie(int x, int y, int old){                           //Tue un membre de l'espèce en (x,y) de vieilesse
    if(posMap[x][y] >0 && age[old] >0){
    posMap[x][y] -= 1;
    age[old]--;
    mort++;
    totalMorts++;
    causeMort[0]++;
    }
  }
  
  public void Die(int x, int y,int cause, int nbre){                    //Tue un nombre (nbre) de l'espèce en (x,y) pour la raison (cause)
    for(int i=0;i<nbre;i++)Die(x,y,cause);
  }
  
  public void Born(int x, int y){                                       //Fait naître un membre de l'espèce à la position (x,y)
    println("Un bébé nés");
    posMap[x][y]++;
    age[0]++;
    naissance++;
    totalNaissances++;
  }
  
  public void Born(int x, int y, int nbre){                             //Fait naître (nbre) membres de l'espèce à la position (x,y)
    println(nbre + " bébé nés");
    posMap[x][y]+= nbre;
    age[0]+= nbre;
    naissance += nbre;
    totalNaissances+=nbre;
  }
  
   protected void TestBiome(int x,int y){                               //Calcule les survivants de l'espèce en (x,y) en fonction du biomme sur lequel ils se trouvent
        sante[x][y] -= biome[x][y]*posMap[x][y];
        while(sante[x][y]<0){
           Die(x,y,3);
           sante[x][y]+=30;
        }
        
        
      }

    void Old(){                                                         //Calcule l'age et tue les vieux membres de l'espèce
      
      ArrayList<int[]> presence = new ArrayList<int[]>();
      for(int i = 0; i<posMap.length;i++)
        for(int y = 0; y <posMap[0].length;y++){
          if(posMap[i][y] > 0) presence.add(new int[]{i,y});
        
        }
          
      if(jour == 31 && mois == 12)
        for(int i =age[DUREE_VIE-1];i>0;i--) age[i] = age[i-1];
      
      for(int i=0;i<age[DUREE_VIE-1];i++)
      {
         int ran = int(random(0,presence.size()));
         
         while(posMap [presence.get(ran)[0]][presence.get(ran)[1]]== 0) ran = int(random(0,presence.size()));
         
         ODie(presence.get(ran)[0],presence.get(ran)[1],DUREE_VIE-1);
         //println("Death at " + presence.get(ran)[0] + ", " + presence.get(ran)[1]);
        
      }
      
      for(int i=VIEILLESSE_MIN;i<DUREE_VIE-2;i++)
      {
        float rand = random(0,0.05*i);
        for(int j=0;j<age[i]*rand/1000;j++){
       
         int ran = int(random(0,presence.size()));
         
         while(posMap [presence.get(ran)[0]][presence.get(ran)[1]]== 0) ran = int(random(0,presence.size()));
         
         ODie(presence.get(ran)[0],presence.get(ran)[1],i);
         
         //println("Death at " + presence.get(ran)[0] + ", " + presence.get(ran)[1]);
        
        }
        
      }
      
      
    }
  
 //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  }
