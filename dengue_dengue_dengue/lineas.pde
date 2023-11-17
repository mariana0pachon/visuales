int filas = 3;
int[] lineasPorFila = {7, 2, 4};
float[][] lineasX = new float[filas][];
float[][] longitudes = new float[filas][];
float grosorLineas = 5;
float lineasR, lineasG, lineasB;
float bgR, bgG, bgB;
float velocidadBase = 7;
float separacionVertical = 70;

void setupLineas() {
  background(random(255), random(255), random(255));


    bgR = random(255);
  bgG = random(255);
  bgB = random(255);
  lineasR = random(255);
  lineasG = random(255);
  lineasB = random(255);
  

  

  for (int fila = 0; fila < filas; fila++) {
    lineasX[fila] = new float[lineasPorFila[fila]];
    longitudes[fila] = new float[lineasPorFila[fila]];

    for (int i = 0; i < lineasPorFila[fila]; i++) {
      lineasX[fila][i] = -50 - i * 20;
      longitudes[fila][i] = random(50, 200);
    }
  }
}

boolean comienzoLineas = true;
void drawLineas() {
  if (comienzoLineas) setupLineas();
  comienzoLineas = false;

  background(bgR, bgG, bgB);

  for (int fila = 0; fila < filas; fila++) {
    for (int i = 0; i < lineasPorFila[fila]; i++) {
      stroke(lineasR, lineasG, lineasB);
      strokeWeight(grosorLineas);
      line(lineasX[fila][i], (fila + 1) * separacionVertical + fila * height / (filas + 1), lineasX[fila][i] + longitudes[fila][i], (fila + 1) * separacionVertical + fila * height / (filas + 1));

      lineasX[fila][i] += velocidadBase + i * 0.5;

      if (lineasX[fila][i] > width) {
        lineasX[fila][i] = -50 - i * 20;
        longitudes[fila][i] = random(50, 200);
      }
    }
  }
}
