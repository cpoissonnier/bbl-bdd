package com.acme.bowling;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(features = { "classpath:ScoreCalculationFeature.feature" }, glue = { "com.acme.bowling" })
public class ScoreCalculationFeature {

}