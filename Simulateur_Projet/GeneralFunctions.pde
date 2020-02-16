//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//                                                                       Fonctions utiles pour tout le programme                                                                                       //
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

int[] Dispatch(int nbre,int longueurListe){                                                  //divise une quantitee (nbre) dans une liste de longueure (longueurListe) alleatoirement
    int[] liste = new int[longueurListe];
  
   for(int i=0;i<nbre;i++){
       int ran = int(random(0,longueurListe));
       liste[ran]++;
   }
     
  return liste;
  
}

String NombreLisible(int nbre){                                                              //Transforme un nombre en séparant les centaines par un point
   String  tampon = Integer.toString(nbre);
   String result = "";
   for(int i = tampon.length()-1; i>= 0;i--){
     result += tampon.charAt(i);
     if(i>0 && (tampon.length()-i)%3 == 0)  result+='.';
     
   }
   
   tampon = result;
   result = "";
   
   for(int i = tampon.length()-1; i>= 0;i--){
     result += tampon.charAt(i);
   }
   return result;
  
  
}
