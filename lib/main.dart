import 'package:bloc_blocflutterpackage/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<ColorBloc>(
            builder: (context) => ColorBloc(), child: MainPage()));
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("BLoc dengan flutter_bloc"),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                bloc.dispatch(ColorEvent.to_amber);
              },
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                bloc.dispatch(ColorEvent.to_light_blue);
              },
              backgroundColor: Colors.lightBlue,
            )
          ],
        ),
        body: Center(
          child: BlocBuilder<ColorBloc, Color>(
            builder: (context, currentColor) => AnimatedContainer(
              width: 100,
              height: 100,
              color: Colors.amber,
              duration: Duration(milliseconds: 500),
            ),
          ),
        ));
  }
}
