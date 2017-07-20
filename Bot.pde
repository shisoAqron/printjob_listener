class Bot {
  String token;
  Bot(String _token) {
    this.token = _token;
  }

  public void send_mes(String channel, String mes) {
    String text = "https://slack.com/api/chat.postMessage?"
      +"token="+token
      +"&channel="+channel
      +"&text="+mes;
    GetRequest get = new GetRequest(text);
    get.send();
  }
  
}