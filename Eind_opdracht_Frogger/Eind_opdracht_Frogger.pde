PImage kikkergimma;
PImage auto2;
PImage auto;
float autobreed = 105;
float autohoog = 50;
float kikkerbreed = 50;
float kikkerhoog = 60;

int[] autoXLeft = {50, 150, 300, 450, 600}; // X-posities van auto's van links naar rechts
int[] autoYLeft = {100, 250, 400, 450, 550}; // Hoogte van de autos
int[] carspeedLeft = {7, 8, 7, 8, 8}; // snelheid voor auto links naar rechts

int[] autoXRight = {150, 300, 450, 600, 750}; // Start positie van de autos links naar rechts
int[] autoYRight = {150, 300, 350, 500, 600}; // Hoogte van de autos
int[] carspeedRight = {-7, -7, -8, -8, -7}; // snelheid voor auto rechts naar links

int kikkerX = 654/2;
int kikkerY = 650;
int kikkerSize = 50;
boolean gewonnen = false;
boolean Gameover= false;

void setup() {
  size(700, 700); //background size
  String url = "https://static.vecteezy.com/system/resources/previews/036/268/349/non_2x/ai-generated-car-sedan-car-white-sedan-car-sports-car-isolated-sedan-car-luxurious-car-luxury-car-white-sedan-car-transparent-background-png.png";
  auto = loadImage(url);
  auto.resize (200, 250);
  if (auto != null) {
    image(auto, autoXRight[0], autoYRight[0], autobreed, autohoog);


    //AUTO 2 FOTO

    String url1 = "https://static.vecteezy.com/system/resources/thumbnails/023/524/637/small/red-sport-car-design-transparent-background-free-png.png";
    auto2 = loadImage(url1);
    auto2.resize(200, 250);
    if (auto != null) {
      image(auto2, autoXLeft[0], autoYLeft[0], autobreed, autohoog);
    }
  }
  kikkergimma = loadImage("kikkergimma.png");
  kikkergimma.resize(250, 200);
  if (kikkergimma != null) {
    image(kikkergimma, kikkerX, kikkerY, kikkerbreed, kikkerhoog);
  }
}


void draw() {
  background(255);
  if (gewonnen) {
    fill(0, 255, 0);
    textSize(50);
    text("Gewonnen", width/2 - 140, height/2); // tekst gewonnen
    println("Gewonnen");
  } else if (Gameover) {
    fill(255, 0, 0);
    textSize(50);
    text("Gameover", width/2 - 140, height/2); // tekst Gameover
  } else {
    fill(0, 153, 0); // Kikker kleur
    //  rect(kikkerX, kikkerY, kikkerSize, kikkerSize); // Teken kikker
    image(kikkergimma, kikkerX, kikkerY, kikkerbreed, kikkerhoog);
    fill(153, 255, 153);
    rect(0, 0, width, 0); // Teken win balk
MijnAuto();


    

    // boolean gewonnen true maken
    if (kikkerY < -10) {
      gewonnen = true;
    }

    // kikker in het spel houden
    if (kikkerX > 700) {
      kikkerX = 654/2;
    }
    if (kikkerX < -30) {
      kikkerX = 654/2;
    }
    if (kikkerY >= 700) {
      kikkerY = 650;
    }
  }
}
// Vooruit lopen
void keyPressed() {
  if (key == 'w' || key == 'W') { // Als de je W drukt gaat die vooruit
    kikkerY -= 50; //
  }
  if (key == 's' || key == 'S') { // Als de je S drukt gaat die vooruit
    kikkerY += 50;
  }
  if (key == 'a' || key == 'A') { // Als de je A drukt gaat die vooruit
    kikkerX -= 50;
  }
  if (key == 'd' || key == 'D') { // Als de je D drukt gaat die vooruit
    kikkerX += 50;
  }
}
void mousePressed() {
  if (Gameover || gewonnen) {
    // START ALLES OPNIEUW
    kikkerX = 654/2;
    kikkerY = 650;
    gewonnen = false;
    Gameover = false;
  }
}

void MijnAuto(){
// Autos
    for (int i = 0; i < autoXLeft.length; i++) {
      autoXLeft[i] += carspeedLeft[i]; // Update positie van auto's
      fill(255, 0, 0);
      //rect(autoXLeft[i], autoYLeft[i], 100, 50); // Teken auto's
      image(auto2, autoXLeft[i], autoYLeft[i], autobreed, autohoog);

      // Reset de auto naar links als deze buiten beeld gaat
      if (autoXLeft[i] > width) {
        autoXLeft[i] = -100;
      }

      // Controleer of de kikker een auto raakt
      if (kikkerX  < autoXLeft[i] + 100 && kikkerX  + kikkerSize > autoXLeft[i] && kikkerY < autoYLeft[i] + 50 && kikkerY + kikkerSize > autoYLeft[i]) {
        Gameover = true;
        println("Geraakt");
      }
    }

    // Auto
    for (int i = 0; i < autoXRight.length; i++) {
      autoXRight[i] += carspeedRight[i]; // ssnelheid van de autos
      fill(0, 0, 255);
      // rect(autoXRight[i], autoYRight[i], 100, 50); // Teken autos
      image(auto, autoXRight[i], autoYRight[i], autobreed, autohoog);

      // Auto spawnt opnieuw als die buiten beeld gaat
      if (autoXRight[i] < -100) {
        autoXRight[i] = width;
      }

      // Controleer of de kikker een auto raakt
      if (kikkerX  < autoXRight[i] + 100 && kikkerX  + kikkerSize > autoXRight[i] && kikkerY < autoYRight[i] + 50 && kikkerY + kikkerSize > autoYRight[i]) {
        println("Geraakt");
        Gameover = true;
      }
    }

}
