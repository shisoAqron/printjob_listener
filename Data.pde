class Data {
  Table table;
  String dataName;
  File file;

  Data(String dn) {
    this.dataName = dn;
    file = new File(dataPath(dataName));
    if (file.exists()) {
      this.load_data();
    } else {
      this.create_data();
    }
  }

  private void create_data() {
    this.table = new Table();
    this.table.addColumn("id");
    this.table.addColumn("timestamp");
  }

  private void load_data() {
    this.table = loadTable("data/"+dataName, "header");
  }

  public void add_data() {
    TableRow newRow = this.table.addRow();
    newRow.setInt("id", this.table.getRowCount() - 1);
    newRow.setString("timestamp", get_timestamp());

    saveTable(this.table, "data/"+dataName);
  }

  private String get_timestamp() {
    String tt = "";
    tt+=year()+nf(month(), 2)+nf(day(), 2);
    tt+=nf(hour(), 2)+nf(minute(), 2)+nf(second(), 2);
    return tt;
  }
  
  public int get_tableCount(){
    return this.table.getRowCount();
  }
}