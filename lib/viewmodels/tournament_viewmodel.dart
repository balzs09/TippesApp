import '../models/tournament.dart';
import '../models/football_match.dart';
class TournamentViewModel{
    Tournament tournament;
    
    TournamentViewModel({required this.tournament});

    List<FootballMatch> get predictableMatches =>
         tournament.matches.where((match) => match.startTime.isAfter(DateTime.now())).toList();
    

    List<FootballMatch> get finishedMatches =>
        tournament.matches.where((match) => match.startTime.isBefore(DateTime.now())).toList();
    
}