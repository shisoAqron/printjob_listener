Printer pri;
Data d;

void setup() {
  size(400, 300);

  pri = new Printer();
  d = new Data("savedata.csv");

  textAlign(CENTER, CENTER);
}


void draw() {
  background(255);
  pri.update_jobCount(d);

  fill(0);
  textSize(50);
  text("queued-job:"+pri.jobCount, width/2, height/2-50);
  text("tablecount:"+d.get_tableCount(), width/2, height/2+50);
}

void mousePressed() {
  //d.add_data();
}