package com.acme.bowling;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import java.util.stream.IntStream;

import static org.assertj.core.api.Assertions.assertThat;

public class BowlingSteps {
    private Game game;

    @Given("^a new bowling game$")
    public void aNewBowlingGame() {
        game = new Game();
    }

    @Then("^his total score should be (\\d+)$")
    public void hisTotalScoreShouldBe(int expectedScore) {
        int score = game.calculateScore();
        assertThat(score).isEqualTo(expectedScore);
    }

    @When("^the player knocks (\\d+) pins$")
    public void playerKnocksPins(int numberOfPinsKnocked) {
        game.addRoll(numberOfPinsKnocked);
    }

    @When("^the player make a strike")
    public void playerMakeAStrike() {
        game.addRoll(10);
    }

    @Given("^the player scored a spare$")
    public void aPlayerScoredASpare() {
        game.addRoll(9);
        game.addRoll(1);
    }

    @Given("^the player scored a strike$")
    public void aPlayerScoredAStrike() {
        game.addRoll(10);
    }

    @When("^the player does a perfect game$")
    public void playerDoesAPerfectGame() {
        IntStream.rangeClosed(1, 12)
                 .forEach(i -> playerKnocksPins(10));
    }

    @When("^the player knocks (\\d+) pins followed by a spare$")
    public void playerKnocksNumberOfPinsKnockedPinsFollowedByASpare(int numberOfPinsKnocked) {
        game.addRoll(numberOfPinsKnocked);
        game.addRoll(10 - numberOfPinsKnocked);

    }
}