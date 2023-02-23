
@getMembers
Feature: Get members of api testing

  Background:
    * url "http://localhost:5002/api/"
    * header Authorization = call read('../../util/basic-auth.js') { username: 'admin', password: 'admin' }
    * def wait = function(pause){ java.lang.Thread.sleep(pause * 1000) }

  @membersAll
  Scenario: Get all members
    Given path "members"
    When method Get
    Then status 200

  @memberByID
  Scenario: Get member by ID
    Given path "members"
    * def id = 2
    And  path id
    When method Get
    Then status 200
    And wait(21)

  @memberByIDFail
  Scenario: get member by id not successful
    Given path "members"
    * def id = 200
    And  path id
    When method Get
    Then status 404

