import java.io.*;
import javax.print.*;
import javax.print.attribute.*;
import javax.print.attribute.standard.*;
//import javax.print.event.*;

import javax.print.PrintServiceLookup;

PrintService ps;

void setup() {
  size(400, 300);
  textAlign(CENTER,CENTER);

  ps = PrintServiceLookup.lookupDefaultPrintService();
  //get_defaultPrinter
  
  /*name jobcount is-accept*/
  //for (Attribute attribute : ps.getAttributes().toArray()) {
  //  System.out.println(attribute.getName() + ":" + attribute);
  //}
  
  //println(ps.getAttributes().toArray());
}


void draw(){
  background(255);
  String t = "job:";
  for (Attribute attribute : ps.getAttributes().toArray()) {
    //System.out.println(attribute.getName() + ":" + attribute);
    if(attribute.getName()=="queued-job-count") t+=attribute;
  }
  
  fill(0);
  textSize(50);
  text(t,width/2,height/2);
  
}