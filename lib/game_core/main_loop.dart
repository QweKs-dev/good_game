import 'dart:isolate';

bool _running = true;

void mainLoop(SendPort sendPort) async {
  final double _fps = 50;
  final double _millisecond = 1000;
  final double _updateTime = _millisecond / _fps;

  Stopwatch _loopWatch = Stopwatch();
  _loopWatch.start();

  while(_running){
    if(_loopWatch.elapsedMilliseconds>_updateTime){
      _loopWatch.reset();
      sendPort.send(true);
    }
  }
}
void stopLoop(){
  _running = false;
}