import controlP5.*;
ControlP5 cp5;
ArrayList<Integer> colors;
int bgColor;
int colorIndex = 0;
int gridRows = 10;  // Number of rows in the grid
int gridCols = 10;  // Number of columns in the grid

void setup() {
  size(800, 800);  // Larger canvas size
  cp5 = new ControlP5(this);
  colors = new ArrayList<Integer>();
  bgColor = color(255);
  
  // Create a button to generate a new color
  cp5.addButton("GenerateColor")
     .setPosition(20, 20)
     .setLabel("Generate Color")
     .setColorForeground(color(255, 100, 100))
     .setColorBackground(color(50))
     .setColorActive(color(255, 0, 0));
  
  // Create a slider to control color brightness
  cp5.addSlider("adjustBrightness")
     .setPosition(20, 60)
     .setSize(200, 15)
     .setRange(0, 255)
     .setValue(128);
  
  // Create a slider to control color saturation
  cp5.addSlider("adjustSaturation")
     .setPosition(20, 90)
     .setSize(200, 15)
     .setRange(0, 255)
     .setValue(200);  // Increased saturation for more colorful colors
}

void draw() {
  background(bgColor);
  noStroke();
  
  // Display the color palette grid
  int rectSize = width / gridCols;
  for (int i = 0; i < colors.size(); i++) {
    int row = i / gridCols;
    int col = i % gridCols;
    int x = col * rectSize;
    int y = 150 + row * rectSize;
    
    fill(colors.get(i));
    rect(x, y, rectSize, rectSize);
  }
}

void GenerateColor() {
  int brightness = int(cp5.getController("adjustBrightness").getValue());
  int saturation = int(cp5.getController("adjustSaturation").getValue());
  
  // Generate a random and more colorful color
  int newColor = color(random(255), random(255), random(255));
  colors.add(newColor);
  colorIndex++;
  
  if (colorIndex >= gridRows * gridCols) {
    colors.remove(0);
    colorIndex--;
  }
}

// void adjustBrightness(float val) {
  // Adjust the brightness of the generated color
//}

//void adjustSaturation(float val) {
  // Adjust the saturation of the generated color
//}

void adjustBrightness(float val) {
  // Adjust the brightness of the generated color
  for (int i = 0; i < colors.size(); i++) {
    float hue = hue(colors.get(i));
    float saturation = saturation(colors.get(i));
    colors.set(i, color(hue, saturation, val));
  }
}

void adjustSaturation(float val) {
  // Adjust the saturation of the generated color
  for (int i = 0; i < colors.size(); i++) {
    float hue = hue(colors.get(i));
    float brightness = brightness(colors.get(i));
    colors.set(i, color(hue, val, brightness));
  }
}
