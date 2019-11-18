import 'package:flutter/material.dart';

class ConnectionManager extends StatelessWidget {
  Future future;
  Function func;
  bool progressIndicator = false;

  ConnectionManager({
    @required this.future,
    @required this.func,
    this.progressIndicator,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Container(
              child: Center(
                child:
                    this.progressIndicator ? CircularProgressIndicator() : null,
              ),
            );
          default:
            if (snapshot.hasError)
              return Text(snapshot.error);
            else
              return func(context, snapshot);
        }
      },
    );
  }
}
