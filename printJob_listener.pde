import java.awt.*;

Printer pri;
Data d;

/*setLocation*/
PVector window_point = new PVector(800,50);
PVector start_point = new PVector();


/*setVisible*/
boolean show;

void settings() {
  fullScreen();
}

void setup() {
  //size(400, 300);
  surface.setSize(400, 300);

  pri = new Printer();
  d = new Data("savedata.csv");

  show = true;

  textAlign(CENTER, CENTER);
}

void dispose() {
  println("exit.");
}


void draw() {
  surface.setVisible(show);
  surface.setLocation((int)window_point.x, (int)window_point.y);

  if(pri.update_jobCount()){
    show = true;
    d.add_data();
  }
  
  background(255);
  /* window frame */
  noFill();
  strokeWeight(20);
  rect(0,0,width,height);

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
  //show = false;

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
  //ignore ESC key
  if (key == ESC) {
    key = 0;
    show = false;
  }
}