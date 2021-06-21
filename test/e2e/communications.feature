Feature: Client-Server Communications
  In order to use Karma
  As a person who wants to write great tests
  I want to be able to run tests from the command line.

  Scenario: Messages arrive in order
    Given a configuration with:
      """
      files = ['communications/test.js'];
      browsers = ['ChromeHeadlessNoSandbox'];
      plugins = [
        'karma-jasmine',
        'karma-chrome-launcher'
      ];
      """
    And the environment:
      | DEBUG | * |
    When I start Karma
    Then the stderr contains in order socket.io logs
