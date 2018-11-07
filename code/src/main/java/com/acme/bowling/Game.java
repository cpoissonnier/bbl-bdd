package com.acme.bowling;

public class Game {

    private int[] rolls = new int[21];
    private int currentRoll;

    public void addRoll(int pins) {
        rolls[currentRoll++] = pins;
    }

    public int calculateScore() {
        int score = 0;
        int frameIndex = 0;
        for (int frame = 0; frame < 10; frame++) {
            if (isStrike(frameIndex)) {
                score += 10 + calculateStrikeBonus(frameIndex);
                frameIndex++;
            } else if (isSpare(frameIndex)) {
                score += 10 + calculateSpareBonus(frameIndex);
                frameIndex += 2;
            } else {
                score += sumOfBallsInFrame(frameIndex);
                frameIndex += 2;
            }
        }
        return score;
    }

    private boolean isStrike(int frameIndex) {
        return rolls[frameIndex] == 10;
    }

    private int sumOfBallsInFrame(int frameIndex){

        return rolls[frameIndex] + rolls[frameIndex + 1];
    }

    private int calculateSpareBonus(int frameIndex){
        return rolls[frameIndex + 2];
    }

    private int calculateStrikeBonus(int frameIndex) {
        return rolls[frameIndex + 1] + rolls[frameIndex + 2];
    }

    private boolean isSpare(int frameIndex) {
        return rolls[frameIndex] + rolls[frameIndex + 1] == 10;
    }
}