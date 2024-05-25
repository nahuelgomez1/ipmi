PImage foto1, foto2, foto3;
PFont fuente;
int pantalla, tiempo, diametro;
int miVariable = 1;
float posX, posY, tamX, tamY;
float velX;
void setup() {
  size(640, 480);
  foto1 = loadImage("foto1.jpg");
  fuente = loadFont("LucidaBright-DemiItalic-48.vlw");
  //fuente = createFont("LucidaBright-DemiItalic-48.vlw", 24);
  textFont(fuente);
  textSize(24);
  textAlign(LEFT, TOP);
  println(frameCount);
  posX = 100;
  //posY = 150;
  //tamX = 100;
  tamY = 400;
  velX = 1;
  //frameCount()
  foto1 = loadImage("foto1.jpg");
  foto2 = loadImage("foto2.jpg");
  foto3 = loadImage("foto3.jpg");
  tiempo = 0;
  pantalla = 0;
  diametro = width/10;
} 

void draw() {
  if(posX >= height-tamY/1) {
    velX = -1; 
  }
  if(posX <= 0+posX/2){  
    velX = 1;
  }  
  posX = posX + velX;
  miVariable = frameCount /23;
  println(miVariable);
  background(0);
  if (pantalla == 0) {
    if (mouseX <= 255) {
      tint(mouseX);
    }
    image(foto1, 0, 0, width, height);
    push();
    //rect(0, height/2, width, height/5);
    fill(255);
    text(" La noche estrellada de Van Gogh ", posX, tamY);
    pop();
  }
  if (pantalla == 1) {
    image(foto1, mouseX, 0, width, height);
    push();
    text("'La noche estrellada' de Van Gogh. \n Fue recreada en tan sólo diez días \n con un juego de luces que tiene el firmamento \n como telón de fondo, \n fue realizado por:", 0, 280);
    text("Los artistas serbios Ivana Jelić y Pavle Petrović",0, 450);
    pop();
  }
  if (pantalla == 2) {
    image(foto2, 0, 0, width, height);
    push();
    fill(255, mouseY);
    text(" El icónico cielo de la pintura original \n fue llevado a la realidad, \n a través de 1.400 varillas de acrílico \n iluminadas por pequeñas luces LED.", 0, mouseY);
    pop();

    push();
    circle(550, 400, diametro);
    fill(0);
    textSize(12);
    textAlign(CENTER, CENTER);

    text("Reiniciar", 550, 400 );
    pop();
  }
  tiempo++;
  if (tiempo >= 500) {
    tiempo = 0;
    if (pantalla != 2) {
      pantalla++;
    }
  }
}
void mouseClicked() {
  //pantalla++;
  if (pantalla > 2) {
    pantalla = 0;
  }
  if (dist(mouseX, mouseY, 550, 400) < diametro/2) {
    pantalla = 0;
    tiempo = 0;
  }
}
