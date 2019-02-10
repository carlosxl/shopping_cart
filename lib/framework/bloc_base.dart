import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocEvent extends Object {}

abstract class BlocState extends Object {}

abstract class BlocBase<BlocEvent, BlocState> {
  PublishSubject<BlocEvent> _eventController = PublishSubject<BlocEvent>();
  BehaviorSubject<BlocState> _stateController = BehaviorSubject<BlocState>();

  Function(BlocEvent) get emitEvent => _eventController.sink.add;
  Stream<BlocState> get state => _stateController.stream;

  Stream<BlocState> eventHandler(BlocEvent event, BlocState currentState);

  final BlocState initialState;

  BlocBase({@required this.initialState}) {
    _eventController.listen((BlocEvent event) {
      BlocState currentState = _stateController.value ?? initialState;
      eventHandler(event, currentState).forEach((BlocState newState) {
        _stateController.sink.add(newState);
      });
    });
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}