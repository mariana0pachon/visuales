void setup() {
  size(1000, 900);
}

void draw() {
  // System.out.println("X: " + mouseX + ", Y: " + mouseY);
  
  background(#141414);
  noStroke();
  blendMode(BLEND); // reset blend mode to default
  
  glow();
  capaMedia();
  detalles();
  focos();
}


/*
  Glow:
    todos los circulos o circunferencias que se mueven y/o se ven medio shiny
*/
void glow() {

  /*
    Circunferencias
  */
  fill(#8DB7EE);
  noisyCircle(100, 460, 180);
  
  fill(#FFFEEC);
  noisyCircle(420, 300, 400);
  fill(#141414);
  noisyCircle(420, 300, 350);
  
  fill(#BCB4FF);
  circle(750, 600, 200);
  
  fill(#F7B53E, 200);
  circle(710, 580, 80);
  
  fill(#FFFEEC, 200);
  circle(710, 580, 70);
  
  // filter(BLUR, 3);
  
  fill(#141414);
  circle(100, 460, 150); // tal vez esto puede ser solo stroke y no circulo
  
  /*
    Detalles
  */
  fill(#BCB4FF);
  circle(850, 745, 15);
  
  fill(#F57646);
  circle(830, 800, 20);
  
  fill(#F7B53E);
  circle(900, 820, 15);
  
  fill(#BCB4FF);
  circle(760, 150, 50);
  
  fill(#F57646);
  circle(900, 100, 70);
  
  stroke(#F57646);
  strokeWeight(6);
  noFill();
  circle(850, 250, 90); 
  noStroke();
  
  fill(#8DB7EE);
  circle(850, 150, 30); 
  
  fill(#F57646);
  circle(220, 600, 50);
  
  noFill();
  stroke(#BCB4FF);
  circle(300, 550, 20);
  
  fill(#8DB7EE);
  circle(250, 650, 30); 
  
  fill(#F7B53E);
  circle(300, 600, 30); 

  stroke(#8DB7EE);
  strokeWeight(6);
  noFill();
  circle(100, 100, 50); 
  noStroke();
  
  filter(BLUR, 3); // esto es muy cool pero demasiado pesado aparentemente :'(
}

/*
  Capa de circulos encima del blur pero no del todo nítidos creo... quizás es una ilusión óptica
*/
void capaMedia() {
  fill(#BCB4FF);
  circle(100, 460, 130);
  
  fill(#141414);
  circle(130, 430, 30);
  
  fill(#F7B53E);
  noisyCircle(150, 800, 50);
  fill(#141414);
  circle(150, 800, 40);
  
  // fill(#8DB7EE, 100);
  // circle(420, 300, 330);
  fill(#8DB7EE);
  circle(710, 580, 60); 
  
  // filter(BLUR, 1);
}

/*
  Detalles:
    ultima capa de circulos pequeños que no tienen blur
*/
void detalles() {
  noFill();
  strokeWeight(6);
  stroke(#F7B53E);
  circle(500, 700, 30);
  
  strokeWeight(3);
  fill(#141414);
  circle(260, 365, 15);
  
  stroke(#141414);
  fill(#F57646);
  circle(316, 454, 15);
  
  noStroke();
  fill(#BCB4FF);
  circle(350, 445, 15);
  
  fill(#F57646);
  circle(750, 520, 15);
  
  fill(#141414);
  circle(780, 525, 13);
  circle(158, 519, 13);
}


/*
  Focos:
    4 circulos que se mueven dentro del circulo grande
    con 'f' se activa/desactiva
    con 'b' se cambia el blend mode entre BLEND, ADD, LIGHTEST, DIFFERENCE, EXCLUSION, SCREEN, REPLACE
*/
boolean focus = true;
int xFocus = 500;
int yFocus = 500;
int xFocusDir = -1;
int yFocusDir = 1;
int focusSpeed = 5;
int focusDiameter = 100;
int diamAlpha = 5;
int diamDir = 1;
int focusBlendMode = DIFFERENCE;

int[] blendModes = {BLEND, ADD, LIGHTEST, DIFFERENCE, EXCLUSION, SCREEN, REPLACE};

void focos() {
  if (focus) {
    blendMode(focusBlendMode);
    
    if (xFocus > 590) xFocusDir = -1;
    else if (xFocus < 245) xFocusDir = 1;
    
    if (yFocus > 470) yFocusDir = -1;
    else if (yFocus < 130) yFocusDir = 1;
    
    xFocus += focusSpeed * xFocusDir;
    yFocus += focusSpeed * yFocusDir;

    focusDiameter += diamAlpha * diamDir;

    if (focusDiameter > 200) diamDir = -1;
    else if (focusDiameter < 50) diamDir = 1;
    
    fill(#F57646, 150);
    circle(xFocus, yFocus, focusDiameter);

    fill(#BCB4FF, 150);
    circle(590 - (xFocus - 245), 470 - (yFocus - 130), focusDiameter);
    
    fill(#F7B53E, 150);
    circle(xFocus, 470 - (yFocus - 130), focusDiameter);
    
    fill(#8DB7EE, 150);
    circle(590 - (xFocus - 245), yFocus, focusDiameter);
  }
}

/*
  Noisy circle:
    circulo con bordes irregulares random, usado para crear el efecto de glow en la circunferencia
    gracias a https://openprocessing.org/sketch/112858/ y a nuestro amigo chatgpt
*/
void noisyCircle(float x, float y, float diameter) {
  strokeJoin(ROUND);
  
  float radius = diameter / 2;
  float noiseMax = random(1, 5);
  
  beginShape();
  for (float i = 0; i < TWO_PI; i += TWO_PI / random(50, 100)) {
    float noisyX = x + cos(i) * radius + random( -noiseMax, noiseMax);
    float noisyY = y + sin(i) * radius + random( -noiseMax, noiseMax);
    vertex(noisyX, noisyY);
  }
  endShape(CLOSE);
}

void keyPressed() {
  if (key == 'b') {
    int focusBlendModeIdx = int(random(0, blendModes.length));
    focusBlendMode = blendModes[focusBlendModeIdx];
    // System.out.println("Focus blend mode: " + focusBlendModeIdx);
  }
  if (key == 'f') {
    focus = !focus;
  }
}
