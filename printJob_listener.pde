import java.awt.*;
import controlP5.*;

Printer pri;
Data d;

/*setLocation*/
PVector window_point = new PVector(800, 50);
PVector start_point = new PVector();

ControlP5 button;

/*setVisible*/
boolean show;

int [] code = new int[4];


void settings() {
  fullScreen();
}

void setup() {
  surface.setSize(400, 300);

  pri = new Printer();
  d = new Data("savedata.csv");

  ControlFont cf1 = new ControlFont(createFont("Arial", 20));
  button = new ControlP5(this);
  button.addButton("exit")
    .setLabel("minimize")
    .setPosition(width/2+70, height-60)
    .setSize(100, 40);  

  show = true;

  textAlign(CENTER, CENTER);
}

void dispose() {
  println("exit.");
}

/* imvisible window */
void exit() {
  show = false;
}


void draw() {
  surface.setVisible(show);
  surface.setLocation((int)window_point.x, (int)window_point.y);

  if (pri.update_jobCount()) {
    show = true;
    d.add_data();
  }

  background(255);
  /* window frame */
  noFill();
  strokeWeight(20);
  rect(0, 0, width, height);

  /* draw text message */
  fill(0);
  textSize(20);
  text("printer:\n"+pri.name, width/2, height/2-90);
  textSize(30);
  text("queued-job:"+pri.jobCount, width/2, height/2-20);
  textSize(50);
  text("tablecount:"+d.get_tableCount(), width/2, height/2+50);
}

void mousePressed() {
  //d.add_data();

  /*set mouse start point*/
  start_point.x = mouseX;
  start_point.y = mouseY;
}

void mouseDragged() {
  /*set window point from drag distance*/
  Point mouse = MouseInfo.getPointerInfo().getLocation();
  window_point.x = mouse.x - start_point.x;
  window_point.y = mouse.y - start_point.y;
}

void keyPressed() {
  /* command of exit*/
  String t = "";
  for(int i=0;i<3;i++){
    code[i] = code[i+1];
    t+=code[i];
  }
  code[3] = keyCode;
  t+=code[3];

  if(Integer.valueOf(t)==75737676){
    super.exit();
  }
}