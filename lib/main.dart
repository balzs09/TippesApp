import 'package:flutter/material.dart';
import 'models/tournament.dart';
import 'models/player.dart';
import 'models/prediction.dart';
import 'models/football_match.dart';
import 'viewmodels/tournament_viewmodel.dart';
void main() {
  final myTournament = Tournament(name: 'Euros 2024', doubleInKnockout: true);
  // Add a finished match to the tournament, which cannot be predicted by players anymore.
  myTournament.addMatch(FootballMatch(
    id: 1,
    team1Name: 'Germany',
    team2Name: 'Hungary',
    startTime: DateTime.now().subtract(const Duration(days: 1)), 
    isKnockout: false,
    
    ),
  );
  
  myTournament.matches.first.setScore(2, 1);
  myTournament.addPlayer(Player(name: 'John Doe'));
  myTournament.addPlayer(Player(name: 'Jane Smith'));
  myTournament.players[0].addPrediction(Prediction(match: myTournament.matches.first));
  myTournament.players[1].addPrediction(Prediction(match: myTournament.matches.first));
  
    bool success1 = myTournament.players[0].predictions.first.setPredictedScore(1, 3);
    bool success2 = myTournament.players[1].predictions.first.setPredictedScore(5, -1);
   myTournament.updateLeaderBoard();
  

  // Add another match to the tournament, which still can be predicted by players
  myTournament.addMatch(
    FootballMatch(
      id: 2,
      team1Name: 'Magyarország',
      team2Name: 'Svájc',
      isKnockout: false,
      startTime: DateTime.now().add(const Duration(days: 1)), // Holnap
    ),
  );
  final tournamentViewModel = TournamentViewModel(tournament: myTournament);
   runApp(TippesApp(viewModel: tournamentViewModel));
}
class TippesApp extends StatelessWidget {
  final TournamentViewModel viewModel;
  const TippesApp({super.key, required this.viewModel});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tippes App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
   home: const MyHomePage(title: 'Focis tippes app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.amber,
        
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
        
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
