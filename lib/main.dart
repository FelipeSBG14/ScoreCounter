import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_count/provider/players.dart';
import 'package:score_count/routes/app_routes.dart';
import 'package:score_count/views/player_form.dart';
import 'package:score_count/views/player_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Players(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlayerList(),
        routes: {
          AppRoutes.PLAYER_FORM: (_) => PlayerForm(),
        },
      ),
    );
  }
}

/* final store = CountStore();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) => Text(
                '${store.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
                onPressed: store.decrement, child: Icon(Icons.takeout_dining))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
 */