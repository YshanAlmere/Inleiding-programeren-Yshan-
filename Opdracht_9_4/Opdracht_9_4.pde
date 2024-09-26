void setup(){
size(1500,1500);
mijnVierkant(100, 200, 300, 300);
}

void draw(){
  
}

void mijnVierkant(int x, int y, int hoogte, int breed){
 
  line(x, y, x + breed, y);
  line(x + breed, y, x + breed, y + hoogte);
  line(x + breed, y + hoogte, x, y + hoogte);
  line(x, y + hoogte, x, y);

  
}
