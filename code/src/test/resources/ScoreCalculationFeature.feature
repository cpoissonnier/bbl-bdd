Feature: Bowling Score Calculation
  In order to know my performance
  As a player
  I want the system to calculate my total score

  * If in two tries, he fails to knock them all down, his score for that frame is the total number of pins knocked down in his two tries.
  * If in two tries he knocks them all down, this is called a “spare” and his score for the frame is ten plus the number of pins knocked down on his next throw (in his next turn).
  * If on his first try in the frame he knocks down all the pins, this is called a “strike”. His turn is over, and his score for the frame is ten plus the simple total of the pins knocked down in his next two rolls.
  * If he gets a spare or strike in the last (tenth) frame, the bowler gets to throw one or two more bonus balls, respectively. These bonus throws are taken as part of the same turn. If the bonus throws knock down all the pins, the process does not repeat: the bonus throws are only used to calculate the score of the final frame.
  * The game score is the total of all frame scores.

  Scenario: Misses all the pins
    Given a new bowling game
    When the player knocks 0 pins
    Then his total score should be 0

  Scenario: Knocks 2 pins
    Given a new bowling game
    When the player knocks 2 pins
    Then his total score should be 2

  Scenario: Does a perfect game
    Given a new bowling game
    When the player does a perfect game
    Then his total score should be 300

  Scenario Outline: Scores a spare, then knocks <numberOfPinsAfterSpare> pins
    Given a new bowling game
    And the player scored a spare
    When the player knocks <numberOfPinsAfterSpare> pins
    Then his total score should be <totalScore>

    Examples:
      | numberOfPinsAfterSpare | totalScore |
      | 1                      | 12         |
      | 0                      | 10         |
      | 6                      | 22         |


  Scenario Outline: Scores a strike then knocks <numberOfPinsAfterAStrikeForFirstTry> and <numberOfPinsAfterAStrikeForSecondTry> pins
    Given a new bowling game
    And the player scored a strike
    When the player knocks <numberOfPinsAfterAStrikeForFirstTry> pins
    And the player knocks <numberOfPinsAfterAStrikeForSecondTry> pins
    Then his total score should be <totalScore>
    Examples:
      | numberOfPinsAfterAStrikeForFirstTry | numberOfPinsAfterAStrikeForSecondTry | totalScore |
      | 0                                   | 0                                    | 10         |
      | 1                                   | 1                                    | 14         |
      | 7                                   | 2                                    | 28         |
      | 6                                   | 6                                    | 34         |
      | 10                                  | 10                                   | 60         |

  Scenario Outline: Scores 10 rounds of spares with a <numberOfPinsKnockedAtFirstTry> pins knocked at the first try
    Given a new bowling game
    When the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins followed by a spare
    And the player knocks <numberOfPinsKnockedAtFirstTry> pins
    Then his total score should be <totalScore>
    Examples:
      | numberOfPinsKnockedAtFirstTry | totalScore |
      | 0                             | 100        |
      | 5                             | 150        |
      | 6                             | 160        |
      | 9                             | 190        |


  Scenario Outline: Scores 10 rounds of <numberOfPinsKnocked> pins knocked and misses
    Given a new bowling game
    When the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    And the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    And the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    And the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    And the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    And the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    And the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    And the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    And the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    And the player knocks <numberOfPinsKnocked> pins
    And the player knocks 0 pins
    Then his total score should be <totalScore>
    Examples:
      | numberOfPinsKnocked | totalScore |
      | 0                   | 0          |
      | 5                   | 50         |
      | 6                   | 60         |
      | 9                   | 90         |
