import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

String escena = "inicio";

boolean limpiar = false;
boolean negro = false;
boolean invert = false;
boolean posterize = false;
boolean randomImage = false;

float cantiPosterize = 4;

void setup() {
  //size(1024, 768, P3D);
  fullScreen(P3D);
  background(0);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
  myBus = new MidiBus(this, 1, -1); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}

void draw() {
  int channel = 0;
  int pitch = 64;
  int velocity = 127;

  myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  // delay(200);
  myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff

  int number = 0;
  int value = 90;

  myBus.sendControllerChange(channel, number, value); // Send a controllerChange
  // delay(2000);


  // println(escena);
  if (escena == "caleidoscopio") {
    drawCaleidoscopio();
  }
  if (escena == "degradado") {
    drawDegradado();
  }
  if (escena == "lineas") {
    drawLineas();
  }
  if (escena == "pajaros") {
    drawPajaros();
  }
  if (escena == "puma") {
    drawPuma();
  }
  if (escena == "camaleon") {
    drawCamaleon();
  }

  if (limpiar) {
    fill(random(255), random(255), random(255));
    rect(0, 0, width, height);
    limpiar = false;
  }

  if (negro) {
    fill(0);
    rect(0, 0, width, height);
    negro = false;
  }

  if (invert) filter(INVERT);
  if (posterize) filter(POSTERIZE, cantiPosterize);
  
  if (escena == "randomImage") {
    if (randomImage) drawRandomImage();
    randomImage = false;
  }
}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:" + channel);
  println("Pitch:" + pitch);
  println("Velocity:" + velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:" + channel);
  println("Pitch:" + pitch);
  println("Velocity:" + velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:" + channel);
  println("Number:" + number);
  println("Value:" + value);

  // --- DEGRADADO ---
  if (number == 43 && value == 127) escena = "degradado"; // Boton <<
  if (escena == "degradado") {
    if (number == 16) degradadoR = map(value, 0, 127, 0, 255); // Knob 1
    if (number == 17) degradadoG = map(value, 0, 127, 0, 255); // Knob 2
    if (number == 18) degradadoB = map(value, 0, 127, 0, 255); // Knob 3
    if (number == 19) anchoRectangulo = map(value, 0, -127, 0, width); // Knob 4
    if (number == 20) numRectangulosIzquierda = int(map(value, 0, 127, 1, 255)); // Knob 5
  }

  // --- PAJAROS ---
  if (number == 44 && value == 127) escena = "pajaros"; // Boton >>
  // if (number == 16) growth = map(value, 0, 127, 40, 100); // Knob 1
  if (escena == "pajaro") {
    //if (number == 16) pajaroFrameRate = map(value, 0, 127, 5, 60); // Knob 1
    if (number == 17) aumentoPajaroGiro = map(value, 0, 127, 1, 5); // Knob 2
  }

  // --- PUMA ---
  if (number == 42 && value == 127) escena = "puma";  // Boton cuadrado (stop)
  if (escena == "puma") {
    // if (number == 32 ) escenaPuma = 1; // Boton S 1
    //if (number == 16) distribucionCuadrados = map(value, 0, 127, 2, 100); // Knob 1
    //if (number == 17) r = map(value, 0, 127, 0, 255); // Knob 2


    //if (number == 48) escenaPuma = 2; // Boton M 1
    //if (number == 16) direccion = map(value, 0, 127, 2, 300); // Knob 2

    if (number == 0) size1 = map(value, 0, 127, 400, 1000); // Slider 1             -----> CHECKEAR ESTE!!!!
    if (number == 1) size2 = map(value, 0, 127, 400, 1000); // Slider 2             -----> CHECKEAR ESTE!!!!


    //if (number == 64) escenaPuma = 3; // Boton R 1
  }

  // --- CAMALEON ---
  if (number == 41) escena = "camaleon";
  if (escena == "camaleon") {
    if (number == 0) camLength = map(value, 0, 127, 1, 1000); // Slider 1             -----> CHECKEAR ESTE!!!!
    if (number == 1) camWidth = map(value, 0, 127, 1, 1000); // Slider 2
  }

  // --- LINEAS ---
  //if (number == 46 && value == 127) {
  //  bgR = random(255);
  //  bgG = random(255);
  //  bgB = random(255);
  //  lineasR = random(255);
  //  lineasG = random(255);
  //  lineasB = random(255);
  //  escena = "lineas"; // Boton CYCLE a la izquierda
  //}

  // --- CALEIDOSCOPIO ---
  //if (number == 60 && value == 127) escena = "caleidoscopio"; // Boton SET en la parte ---MARKER--- a la izquierda
  //if (escena == "caleidoscopio") {
  //  if (number == 16 && value == 127) florSize = map(value, 0, 127, 5, 20); // Knob 1
  //  if (number == 32 & value == 127) { // Boton S 1
  //    flor3D = !flor3D;
  //    clear(); // POR QUE NO FUNCIONAAA
  //  }
  //  if (number == 48 && value == 127) florRandomLocation(); // Boton M 1
  //  if (number == 0) florMaxColors = map(value, 0, 127, 255, 360); // Slider 1
  //}
  ////71, 55, 39
  //if (number == 71) background(0);

  if (number == 39 && value == 127) limpiar = true;
  if (number == 55 && value == 127) negro = true;
  if (number == 71 && value == 127) invert = !invert;
  if (number == 70 && value == 127) posterize = !posterize;
  if (number == 22) cantiPosterize = map(value, 0, 127, 100, 4);



  if (number == 58 && value == 127) {
    //randomImage = true;
    escena = "randomImage";
  }
  
  if (escena == "randomImage") {
    if (number == 59 && value == 127) randomImage = true;
  }
  
}

void delay(int time) {
  int current = millis();
  while (millis() < current + time) Thread.yield();
}
