import 'player.dart';
import 'football_match.dart';
class Tournament{
  String name;
  List <Player> players = [];
  List <FootballMatch> matches = [];
  bool doubleInKnockout;
  String? winner;
  String? topGoalScorer;
  String? topAssistProvider;

  Tournament({
    required this.name,
    this.doubleInKnockout = false,
  });
  void addPlayer(Player player) {
    players.add(player);
  }
  void addMatch(FootballMatch match) {
    matches.add(match);
  }

  void setFinalResults({
    required String winner,
    required String topGoalScorer,
    required String  topAssistProvider,
  }) {
    this.winner = winner;
    this.topGoalScorer = topGoalScorer;
    this.topAssistProvider = topAssistProvider;
  }
  // Update the leaderboard based on the players' predictions and the actual results
  void updateLeaderBoard() {
    for (var player in players) {
      player.calculateTotalPoints(
        doubleInKnockout: doubleInKnockout,
        actualWinner: winner,
        actualTopScorer: topGoalScorer,
        actualTopAssist: topAssistProvider,
      );
    }
    players.sort((a, b) => b.totalPoints.compareTo(a.totalPoints));
  }
}