void setup() {
  float getal1 = 7.5;
  float getal2 = 9.0;
  
  printGemiddelde(getal1, getal2);
}

void printGemiddelde(float nummer1, float nummer2) {
  
  float gemiddelde = (nummer1 + nummer2) / 2.0;
  
 
  println("Het gemiddelde van " + nummer1 + " en " + nummer2 + " is: " + gemiddelde);
}
