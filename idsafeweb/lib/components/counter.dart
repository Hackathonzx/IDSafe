import 'package:jaspr/jaspr.dart';

import 'flutter_counter.dart' if (dart.library.io) 'flutter_counter_fallback.dart';

class Counter extends StatefulComponent {
  const Counter({super.key});

  @override
  State<Counter> createState() => CounterState();
}

class CounterState extends State<Counter> {
  int count = 0;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'counter', [
      button(
        onClick: () {
          setState(() => count--);
        },
        [text('-')],
      ),
      span([text('$count')]),
      button(
        onClick: () {
          setState(() => count++);
        },
        [text('+')],
      ),
    ]);

    yield FlutterCounter(
      count: count,
      onChange: (value) {
        setState(() => count = value);
      },
    );
  }
}
