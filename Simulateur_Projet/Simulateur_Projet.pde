/*======================================================================================================================================================================================================
================================================================================================LICENSE DU LOGICIEL==========================================================================================
======================================================================================================================================================================================================

 Copyright [2019] [Jérémy, Alexia, Zhong-yi (aka JAZ PROJECT)]

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

======================================================================================================================================================================================================
================================================================================================VARIABLES==========================================================================================
======================================================================================================================================================================================================*/

ArrayList<Animal> animals = new ArrayList<Animal>();
int actualChoice = -1; 
int day = 1;
boolean dayPass = false;

int Xmouse = -1;
int Ymouse = -1;

//Boutons
Button play;
Button[] choice;
Button addDay, subDay;

/*======================================================================================================================================================================================================
==================================================================================================SETUP============================================================================================
======================================================================================================================================================================================================*/

void setup()
  {
    fullScreen();
    ellipseMode(CENTER);
    imageMode(CENTER);
    
    StartLoadImage();
    
    //init boutton
     play = new Button(width*0.45,height*0.92,width*0.065,icone_Play);
     addDay = new Button(width*0.60,height*0.92,width*0.04,icone_Forward);
     subDay = new Button(width*0.52,height*0.92,width*0.04,icone_Backward);
    
    background(0);
    textSize(50);
    text("chargement",width/2,height/2);
    textSize(30);
    text("Génération de la carte",width/2,height*0.7);

    Generate_Altitude();
    Generate_Biome();
    
    background(0);
    textSize(50);
    text("chargement",width/2,height/2);
    textSize(30);
    text("Génération de animaux",width/2,height*0.7);
    
    animals.add(new Renard());
    animals.add(new Lapin());
    animals.add(new Ecureil());
    animals.add(new Caille());
    animals.add(new Canard());
    animals.add(new Loup());
    animals.add(new Ours());
    animals.add(new Hibou());
    animals.add(new Grenouille());
 
    background(0);
    textSize(50);
    text("chargement",width/2,height/2);
    textSize(30);
    text("Préparation",width/2,height*0.7);
    
    choice = new Button[animals.size()];
    
    final float XborneInf = 10;
    final float XborneSup = width*0.4;    
    final float YborneInf = 10;    
    final float YborneSup = height*0.6;    
    
    int carre = int(sqrt(choice.length));
    if(choice.length-carre*carre > 0) carre++;
    
    float deplacement;
    
    if(YborneSup-YborneInf<XborneSup-XborneInf)
      deplacement = (YborneSup-YborneInf)/carre;
    else deplacement = (XborneSup-XborneInf)/carre;
    
    for(int i=0;i<choice.length;i++)
    choice[i] = new Button(XborneInf+deplacement/2+deplacement*(i-(carre*(i/carre)))+10,YborneInf+deplacement/2+deplacement*int(i/carre)+10,deplacement-20,animals.get(i).GetIcone());
    
    textSize(10);
  }

/*======================================================================================================================================================================================================
==================================================================================================DRAW============================================================================================
======================================================================================================================================================================================================*/

void draw() {
    
  
    fill(0,0,0);
    stroke(0,0,0);
    rect(width*0.41,10,width*0.58,height*0.98);
    rect(10,10,width*0.4,height*0.6);
    fill(255,255,255);
    stroke(255,255,255);
  
  //--------------------------------DESSINER CASES----------------------------------
  noFill();
  stroke(255);
  //selection
  rect(10,10,width*0.4,height*0.6,10);
  
  //carte
  rect(10,height*0.62,width*0.4,height*0.37,10);
  
  //info
  rect(width*0.41,10,width*0.58,height*0.98,10);
  
  
  //--------------------------------DESSINER BOUTTONS----------------------------------
  
  play.Display();
  for(int i =0;i<choice.length;i++) choice[i].Display();
  addDay.Display();
  subDay.Display();
  
  //-----------------------------DESSINER CARTE------------------------------------
  
  for(int i =0; i < altitude.length;i++)
  for(int j = 0; j< altitude[0].length;j++)
      if(altitude[i][j] > 0) point(10+i,height*0.62 + j);
   
  
  
  //------------------------DESSINER ANIMAUX---------------------------------------
  
  if(actualChoice != -1){
    Animal show = animals.get(actualChoice);
    textSize(30);
    textAlign(CENTER);
  text("Espèce : " + show.GetSpecies(), width*0.41+(width*0.29), height*0.05);
  //Infos générales
  textAlign(LEFT);
  textSize(20);
  text("Nombre de population : " + NombreLisible(show.GetCount()), width*0.41 + 10, height*0.1);  
  text("Moyenne morts par jour : " + ((totalJours>0)?NombreLisible(show.GetTotalMorts()/totalJours):"0"), width*0.41 + 10, height*0.15);
  text("Moyenne naissances par jour : " + ((totalJours>0)?NombreLisible(show.GetTotalNaissances()/totalJours):"0"), width*0.41 + 10, height*0.20);
  text("Age moyen : " + show.GetAgeMoyen(), width*0.41 + 10, height*0.25);
  text("Cause principale de mortalitée : " + show.GetCauseMort(), width*0.41 + 10, height*0.30);
  //Infos de cycle
  textAlign(RIGHT);
  text("Infos du cycle",width*0.41+(width*0.57), height*0.75);
  textSize(15);
    text("Nombre de morts : " + NombreLisible(show.GetMort()), width*0.41+(width*0.57), height*0.80);
    text("Nombre de naissances : " + NombreLisible(show.GetNaissance()), width*0.41+(width*0.57), height*0.82);
    
  //Infos sur carte
  textAlign(LEFT);
  textSize(20);
  text("Infos Carte", width*0.42, height*0.75);
  textSize(15);
  text("Nombre de population : " + ((Xmouse>=0)?NombreLisible(show.posMap[Xmouse][Ymouse]):""), width*0.42, height*0.80);
  text("Biome : " + ((Xmouse>=0)?GetBiomeName(biome[Xmouse][Ymouse]):""), width*0.42, height*0.82);
  show.Display();
  }
  
  textSize(30);
  textAlign(CENTER);
  text(jour+"/" + mois+"/" + annee,width*0.68,height*0.925);
  text(day,width*0.56,height*0.925);
  
  
  if(dayPass){
    for(int i =0; i<animals.size(); i++) animals.get(i).Zero();
    for(int j=0;j<day;j++){
      //println("Jour : " +j);
      for(int i =0; i<animals.size(); i++){
      Animal animal = animals.get(i);
      //println("Do cycle : " + animal.GetSpecies());
      animal.DoCycle(); 
      }
      DayPass();
    }
      dayPass = false;
  }
  
}

/*======================================================================================================================================================================================================
==================================================================================================MOUSEPRESSED============================================================================================
======================================================================================================================================================================================================*/

void mousePressed() {
  
  if(play.MouseClick()){
      text("Chargement",width*0.8,height*0.925);
      redraw();
      dayPass = true;
  }
 
  for(int i=0;i<choice.length;i++)
  if(choice[i].MouseClick()){
    actualChoice = i;
}

if(addDay.MouseClick()) day++;
if(subDay.MouseClick()) day--;

//Algorithme de gestion carte
rect(10,height*0.62,width*0.4,height*0.37,10);
if(mouseX>10 && mouseX<width*0.4+10 && mouseY>height*0.62 && mouseY<height*0.37+height*0.62){
    Xmouse = int(((width*0.4)/altitude.length)*(mouseX-10));
    Ymouse = int(((height*0.37)/altitude[0].length)*(mouseY-height*0.62));
    //println(altitude[0].length + " / " + Ymouse);
    //println("Sur carte");
}
}
