//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//                                                                                   Base de données des images                                                                                        //
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

//----------------------------------------------------------------------------------------VARIABLES IMAGES-----------------------------------------------------------------------------------------------

PImage icone_Play;
PImage icone_Forward;
PImage icone_Backward;

PImage icone_Renard;
PImage icone_Lapin;
PImage icone_Caille;
PImage icone_Canard;
PImage icone_Ecureil;
PImage icone_Grenouille;
PImage icone_Loup;
PImage icone_Ours;
PImage icone_Hibou;

//--------------------------------------------------------------------------------FONCTION ATTRIBUTION IMAGES-------------------------------------------------------------------------------------------

void StartLoadImage(){
   icone_Play = loadImage("ressources/play.png") ;
   icone_Forward = loadImage("ressources/forward.png") ;
   icone_Backward = loadImage("ressources/backward.png") ;
    
   icone_Renard = loadImage("ressources/Icones animaux/Renard.png") ;
   icone_Lapin = loadImage("ressources/Icones animaux/Lapin.png") ;
   icone_Caille = loadImage("ressources/Icones animaux/Caille.png") ;
   icone_Canard = loadImage("ressources/Icones animaux/Canard.png") ;
   icone_Ecureil = loadImage("ressources/Icones animaux/Ecureil.png") ;
   icone_Grenouille = loadImage("ressources/Icones animaux/Grenouille.png") ;
   icone_Loup = loadImage("ressources/Icones animaux/Loup.png") ;
   icone_Ours = loadImage("ressources/Icones animaux/Ours.png") ;
   icone_Hibou = loadImage("ressources/Icones animaux/Hibou.png") ;
  
}
