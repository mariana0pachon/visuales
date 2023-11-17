// //import themidibus.*; //Import the library

// //MidiBus myBus; // The MidiBus

// float medida = 123;
// float medidaS = 0;
// int tiempo = 0;

// void setup() {
//   size(900, 600);
//   background(0);
//   //MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
//   //myBus = new MidiBus(this, 1, -1); // el 1 es porque le digo que el archivo del cual tiene que leer el midi es ESTE, y el -1 porque no tenemos output.
// }

// void draw() {
//   background(0);

//   fill(100, 255, 255);
//   stroke(random(255));
//   strokeWeight(medidaS);
//   medidaS = medidaS + 1;

//   if (medidaS > 20) {
//     medidaS = 0;
//   }

//   fill(random(255), random(255), random(255));

//   float medidaR = 800*random(-1, 1); // ahora varia entre 800 y -800.
//   float medidaH = 800*sin(0.1*tiempo); // ahora varia entre 800 y -800.
//   float medidaN = 800*noise(0.05*tiempo); // ahora varia entre 800 y -800.

//   tiempo = tiempo + 1;

//   circle(450, 300, medidaN);
//   //medida = medida + 30;

//   //if (medida > 800) {
//   //  medida = 0;
//   //}
// }
