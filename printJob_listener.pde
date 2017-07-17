Printer pri;
Data d;

String t = "queued-job:";

void setup() {
  size(400, 300);

  pri = new Printer();
  d = new Data("savedata.csv");

  textAlign(CENTER, CENTER);
}


void draw() {
  background(255);
  pri.update_jobCount();

  fill(0);
  textSize(50);
  text(t+pri.jobCount, width/2, height/2);
}

void mousePressed() {
  d.add_data();
}