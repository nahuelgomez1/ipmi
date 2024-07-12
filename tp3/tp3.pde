//Link: https://youtu.be/lvj4dBaLi2E
//Gomez Nahuel Agustin
//Comisión 3
//Legajo: 92547/8


int a = 0;
int b = 0;
boolean isMouseOverCanvas = false;
boolean changeColor = false;  // Variable para controlar el cambio de color

PImage imagen;

void setup() {
  size(800, 400);
  imagen = loadImage("imagen.png");
}

void draw() {
  background(240);  // Limpiar fondo para cada frame
  image(imagen, 0, 0, 400, 400);
  translate(400, 0);

  // Dibujar cuadrícula de rectángulos y elipses con función de cambio de color
  drawGrid(changeColor);
  
  // Verificar si el mouse está sobre el área del lienzo
  isMouseOverCanvas = checkMouseOverCanvas();


}

// Función para dibujar la cuadrícula de rectángulos y elipses
void drawGrid(boolean changeColor) {
  // Dibujar cuadrícula de rectángulos
  for (a = 0; a < 10; a++) {
    for (b = 0; b < 10; b++) {
      if ((a + b) % 2 == 0) {
        if (changeColor) {
          fill(random(255), random(255), random(255));  // Cambiar color aleatorio
        } else {
          fill(0);  // Color negro
        }
      } else {
        if (changeColor) {
          fill(random(255), random(255), random(255));  // Cambiar color aleatorio
        } else {
          fill(255);  // Color blanco
        }
      }
      rectMode(CENTER);
      rect(b * 40 + 20, a * 40 + 20, 40, 40);
    }
  }

  // Dibujar cuadrícula de elipses
  for (a = 0; a < 10; a++) {
    for (b = 0; b < 10; b++) {
      float d = dist(mouseX, mouseY, b * 40 + 20, a * 40 + 20);
      float ellipseSize = map(d, 0, 400, 10, 40);  // Mapear la distancia a un rango de tamaño de elipse
      
      if ((a + b) % 2 == 0) {
        if (changeColor) {
          fill(random(255), random(255), random(255));  // Cambiar color aleatorio
        } else {
          fill(255);  // Color blanco
        }
      } else {
        if (changeColor) {
          fill(random(255), random(255), random(255));  // Cambiar color aleatorio
        } else {
          fill(0);  // Color negro
        }
      }
      ellipseMode(CENTER);
      ellipse(b * 40 + 20, a * 40 + 20, ellipseSize, ellipseSize);
    }
  }
}

// Función booleana para verificar si el mouse está sobre el lienzo
boolean checkMouseOverCanvas() {
  return mouseX >= 0 && mouseX <= 400 && mouseY >= 0 && mouseY <= 400;
}

// Función para cambiar el estado de cambio de color
void toggleColorChange() {
  changeColor = !changeColor;
}

void mousePressed() {
  // Cambiar el estado de cambio de color cuando se presiona el mouse dentro del lienzo
  if (isMouseOverCanvas) {
    toggleColorChange();
  }
}
