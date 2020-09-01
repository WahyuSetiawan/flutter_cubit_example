import 'package:flutter_bloc/flutter_bloc.dart';

enum HomePage {
  HomePopular,
  HomeGraph,
  HomeHistory,
  HomeSetting,
}

class ChangeHome extends Bloc<HomePage, int> {
  ChangeHome() : super(0);

  Stream<int> mapEventToState(HomePage event) async* {
    switch (event) {
      case HomePage.HomePopular:
        yield 0;
        break;

      case HomePage.HomeGraph:
        yield 1;
        break;

      case HomePage.HomeHistory:
        yield 2;
        break;

      case HomePage.HomeSetting:
        yield 4;
        break;

      default:
        yield 0;
    }
  }
}
