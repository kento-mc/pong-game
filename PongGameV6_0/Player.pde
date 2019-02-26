public class Player {
  
//------------------instance variables----------------------// 
  
  private String playerName;
  private int[] scores;
  private int count;                 // represents next available index and number of high scores
  
  
//---------------------constructors--------------------------//

  public Player(String playerName, int numberOfGames){
    this.playerName = playerName.trim().substring(0,6);
    scores = new int[numberOfGames];
    count = 0;
  } // close Player(String, int) construnctor
  
  
//-----------------------methods-----------------------------//

  public void addScore(int score){   // adds new score to next available scores[] index
    if (score >= 0){
      scores[count] = score;
      count++;
    } // close if
  } // close addScore method

  public String toString(){
    String str = "Scores for " + playerName +"\n";
    
    for (int i = 0; i < count; i++){
      str = str + "     Score " + (i+1) + ": " + scores[i] + "\n";
    } // close for loop
    
    return str;
  } // close toString method

//-----------------------getters---------------------//

  public String getPlayerName(){
    return playerName; 
  }

  public int[] getScores(){
    return scores;
  }
  
  
//-----------------------setters---------------------//
  
  public void setPlayerName(String playerName){
    this.playerName = playerName.substring(0,6); 
  }
  
  public void setScores(int[] scores){
    this.scores = scores; 
  }
  
} // close Player class
