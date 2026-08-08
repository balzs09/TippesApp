class FootballMatch {
  final int id;
  final String team1Name;
  final String team2Name;
  int? team1Score;
  int? team2Score;
  final bool isKnockout;
  DateTime startTime;

  FootballMatch({
    required this.id,
    required this.team1Name,
    required this.team2Name,
    required this.isKnockout,
    required this.startTime,
    
  });
  void setScore(int team1Score, int team2Score) {
    this.team1Score = team1Score;
    this.team2Score = team2Score;
  }
  void setStartTime(DateTime startTime) {
    this.startTime = startTime;
  }
  static int result(int team1Score, int team2Score) {
     if( team1Score > team2Score) {
      return 1; // Team 1 wins
    } else if (team2Score > team1Score) {
      return 2; // Team 2 wins
    } else {
      return 0; // Draw
    }
  }
  int getFinalResult() {
    return result(team1Score!, team2Score!);
  }
}