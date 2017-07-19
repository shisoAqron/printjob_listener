//import java.io.*;
import javax.print.*;
import javax.print.attribute.*;
//import javax.print.event.*;
import javax.print.PrintServiceLookup;

class Printer {
  PrintService ps;
  String name = "";
  int jobCount = 0;

  Printer() {
    this.ps = PrintServiceLookup.lookupDefaultPrintService();
    this.update_name();
    this.update_jobCount();
  }

  private void update_name() {
    this.name = "";
    for (Attribute attribute : ps.getAttributes().toArray()) {
      if (attribute.getName()=="printer-name") this.name+=attribute;
    }
  }

  public boolean update_jobCount() {
    boolean result = false;
    String tmpjob = "";
    for (Attribute attribute : ps.getAttributes().toArray()) {
      if (attribute.getName()=="queued-job-count") tmpjob+=attribute;
    }
    if(this.jobCount<Integer.valueOf(tmpjob)) {
      println("created new job!!!");
      result = true;
    }
    this.jobCount = Integer.valueOf(tmpjob);
    return result;
  }

  //get_defaultPrinter

  /*name jobcount is-accept*/
  //for (Attribute attribute : ps.getAttributes().toArray()) {
  //  System.out.println(attribute.getName() + ":" + attribute);
  //}
}