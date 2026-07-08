mixin Logger {
  void log(String message) {
    print('[LOG] $message');
  }
}

class WebServer with Logger {
  String host;
  int port;
  WebServer(this.host, this.port);
  void start() {
    print('Server $host:$port is starting...');
    print("Server running");
  }

  void stop()=>print("Server $host:$port is shutting down");

}
void main() {
  var server = WebServer('localhost', 8080);
  server.start();
  
  server.stop();
}
