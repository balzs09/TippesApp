import 'prediction.dart';
class Player {
  String name;
  String? predictedWinner;
  String? predictedTopGoalScorer;
  String? predictedTopAssistProvider;
  int totalPoints ;
  List<Prediction> predictions = [];
  Player({
    required this.name,
    this.totalPoints = 0,
  });
  void setPredictedWinner(String winner) {
    predictedWinner = winner;
  }
  void setPredictedTopGoalScorer(String topGoalScorer) {
    predictedTopGoalScorer = topGoalScorer;
  }
  void setPredictedTopAssistProvider(String topAssistProvider) {
    predictedTopAssistProvider = topAssistProvider;
  }
  void addPrediction(Prediction prediction) {
    predictions.add(prediction);
  }
  // Calculate the total points for the player based on their predictions and actual results
  void calculateTotalPoints({
    bool doubleInKnockout = false,
    String? actualWinner,
    String? actualTopScorer,
    String? actualTopAssist,
  }) {
    int currentPoints = 0;

    for (var prediction in predictions) {
      currentPoints += prediction.getPoints(doubleInKnockout);
    }

    if (actualWinner != null && predictedWinner == actualWinner) {
      currentPoints += 30;
    }
    
    if (actualTopScorer != null && predictedTopGoalScorer == actualTopScorer) {
      currentPoints += 25;
    }
    
    if (actualTopAssist != null && predictedTopAssistProvider == actualTopAssist) {
      currentPoints += 20;
    }

    totalPoints = currentPoints;
  }
}