float degradadoR = 0;
float degradadoG = 0;
float degradadoB = 0;

float numRectangulosIzquierda = 5;

float xRectangulo = 0;
float yRectangulo = 0;
float anchoRectangulo = 50;
float altoRectangulo = 2000;
float velocidadRectangulo = 2;

void drawDegradado() {
  //background(255);
  // frameRate = 24;

  for (int i = 0; i < numRectangulosIzquierda; i++) {
    // Rectángulo en posición actual
    fill(degradadoR - i * 10, degradadoG - i * 10, degradadoB - i * 10);
    noStroke();
    rect(xRectangulo + i * (anchoRectangulo + 10), yRectangulo, anchoRectangulo, altoRectangulo);
    fill(degradadoR - 2 - i * 10, degradadoG - 2 - i * 10, degradadoB - 2 - i * 10);
    rect(xRectangulo + i * (anchoRectangulo + 10) - 50, yRectangulo, anchoRectangulo - 10, altoRectangulo);
    
    fill(degradadoR - i * 10, degradadoG - i * 10, degradadoB - i * 10);
    noStroke();
    rect(xRectangulo + i * -(anchoRectangulo + 10), -yRectangulo, anchoRectangulo, altoRectangulo);
    fill(degradadoR - 2 - i * 10, degradadoG - 2 - i * 10, degradadoB - 2 - i * 10);
    rect(xRectangulo + i * (anchoRectangulo + 10) - 50, yRectangulo, anchoRectangulo - 10, altoRectangulo);
  }

  // Actualiza la posición del rectángulo principal
  xRectangulo += velocidadRectangulo;

  // Verifica si el rectángulo principal ha alcanzado el borde derecho
  if (xRectangulo > width) {
    xRectangulo -= width;  // Resta el ancho del lienzo para continuar dibujando
  }
}
