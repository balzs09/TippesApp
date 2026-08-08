import 'football_match.dart';
class Prediction {
  FootballMatch match;
  int? predictedScoreTeam1;
  int? predictedScoreTeam2;
  int priority; // 1 for normal matches, 2 for knockout matches
  Prediction({
    required this.match,
    this.priority = 1,
  });
  // Set the predicted score for the match
  bool setPredictedScore(int team1Score, int team2Score) {
    if(team1Score >=0 && team1Score <100 && team2Score >=0 && team2Score <100) {
      predictedScoreTeam1 = team1Score;
      predictedScoreTeam2 = team2Score;
      return true;
    } else {
      return false;
    }
  }
  // Get the predicted result of the match
  int getPredictedResult() {
    if(predictedScoreTeam1 == null || predictedScoreTeam2 == null) {
      return -1; // No prediction made
    }
    return FootballMatch.result(predictedScoreTeam1!, predictedScoreTeam2!);
  }
  // Calculate the points based on the prediction and actual match result
  int getPoints([bool doubleInKnockout = false]) {
    int actualResult = match.getFinalResult();
    int predictedResult = getPredictedResult();
    if (match.isKnockout&& doubleInKnockout) {
      priority = 2;
    }
    if(predictedResult == -1) {
      return 0; // No prediction made
    }
    if(predictedScoreTeam1 == match.team1Score && predictedScoreTeam2 == match.team2Score) {
      return 10; // Correct exact score prediction
    } else if(predictedScoreTeam1!-predictedScoreTeam2! == match.team1Score!-match.team2Score!) {
      return 6; // Correct  goal difference prediction 
    } else if(predictedResult == actualResult) {
      return 4; // Correct outcome prediction (win/loss/draw)
    } else if(predictedScoreTeam1!+predictedScoreTeam2! == match.team1Score!+match.team2Score!) {
      return 1; // Correct total goals prediction
    } else if(predictedScoreTeam1 == match.team1Score || predictedScoreTeam2 == match.team2Score) {
      return 1; // Correct single team score prediction
    } else {
      return 0; // Incorrect prediction
      
    }
  }
}