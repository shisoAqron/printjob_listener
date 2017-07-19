import java.awt.*;
import controlP5.*;

Printer pri;
Data d;

/* windowSize(show&PC)*/
int win_x, win_y;
Dimension PCwindow;

/*setLocation*/
PVector window_point;
PVector start_point = new PVector();

ControlP5 button;

/*setVisible*/
boolean show;

int [] code = new int[4];

int time = 50;

void settings() {
  fullScreen();
}

void setup() {  
  win_x = 400;
  win_y = 300;
  surface.setSize(win_x, win_y);

  PCwindow = Toolkit.getDefaultToolkit().getScreenSize();
  window_point = new PVector(-50-win_x+PCwindow.width, 50);

  pri = new Printer();
  d = new Data("savedata.csv");

  //ControlFont cf1 = new ControlFont(createFont("Arial", 20));
  button = new ControlP5(this);
  button.addButton("exit")
    .setLabel("minimize")
    .setPosition(width/2-width/100, height/2+height/4)
    .setSize(130, 40);

  button.addButton("reset")
    .setLabel("reset")
    .setPosition(width/2-width/4, height/2+height/4)
    .setSize(40, 40); 

  show = true;

  textAlign(CENTER, CENTER);
}

void draw() {
  surface.setVisible(show);
  surface.setLocation((int)window_point.x, (int)window_point.y);

  if (pri.update_jobCount()) {
    show = true;
    d.add_data("print_job");
  }

  if(!show) return;
  
  /* background */
  if (d.get_tableCount()<time) {
    background(255);
  } else {
    background(255, 0, 0);
  }

  /* window frame */
  noFill();
  strokeWeight(20);
  rectMode(CORNER);
  rect(0, 0, width, height);

  /* draw text message */
  fill(0);
  textSize(width/15);//textSize(20);
  text("printer:\n"+pri.name, width/2, height/2-height/4);
  textSize(width/20);//textSize(30);
  text("queued-job:"+pri.jobCount, width/2, height/2-height/12);
  textSize(width/8);//textSize(50);
  text("logCount:"+d.get_tableCount(), width/2, height/2+height/18);

  if (d.get_tableCount()>=time) {
    strokeWeight(3);
    fill(255);
    rectMode(CENTER);
    rect(width/2, height/2-height/5, win_x*0.8, win_y*0.3);
    fill(0);
    textSize(width/15);
    text("Please maintain Cutter!!!", width/2, height/2-height/5);
  }
}

void mousePressed() {
  if (!show) return;
  /*set mouse start point*/
  start_point.x = mouseX;
  start_point.y = mouseY;
}

void mouseDragged() {
  if (!show) return;
  /*set window point from drag distance*/
  Point mouse = MouseInfo.getPointerInfo().getLocation();
  window_point.x = mouse.x - start_point.x;
  window_point.y = mouse.y - start_point.y;
}

void keyPressed() {
  if (!show) return;
  /* command of exit*/
  String t = "";
  for (int i=0; i<3; i++) {
    code[i] = code[i+1];
    t+=code[i];
  }
  code[3] = keyCode;
  t+=code[3];
  if (Integer.valueOf(t)==75737676) {
    super.exit();
  }

  /* debug command*/
  if (key==ENTER) {
    d.add_data("print_job");
  }
}

void reset() {
  d.reset_data();
}

void dispose() {
  println("exit.");
}

/* imvisible window */
void exit() {
  show = false;
}