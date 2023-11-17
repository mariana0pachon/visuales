PImage imagen1;
PImage imagen2;
PImage imagen3;
PImage imagen4;
PImage imagen5;
PImage imagen6;
PImage imagen7;
PImage imagen8;
PImage imagen9;

PImage[] imagenes = new PImage[9];



void drawRandomImage() {
imagenes[0] = loadImage("pajaro 1 verde glow rojo.png");
imagenes[1] = loadImage("pajaro 1 verde glow violeta.png");
imagenes[2] = loadImage("pajaro 2 naranja.png");
imagenes[3] = loadImage("pajaro 3 pajaros.png");
imagenes[4] = loadImage("Planta 1.png");
imagenes[5] = loadImage("Planta 2.png");
imagenes[6] = loadImage("pajaro 3 tucan.png");
imagenes[7] = loadImage("mono.png");
imagenes[8] = loadImage("Monos laser.png");

imageMode(CENTER);

    image(imagenes[(int)random(0, 8)], width / 2, height / 2, 600, 600);
}
