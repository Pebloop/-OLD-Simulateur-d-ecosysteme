//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
//                                                                       Convertit nom et ID d'une espèce                                                                                              //
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

int GetAnimalID(String name){
     
  switch(name){
    case "renard" :
    return 0;
    case "lapin" :
    return 1;
    case "ecureil" :
    return 2;
    case "caille" :
    return 3;
    case "canard" :
    return 4;
    case "loup" :
    return 5;
    case "ours" :
    return 6;
    case "hibou" :
    return 7;
    case "grenouille" :
    return 8;
  default :
    return -1;
  }
}
