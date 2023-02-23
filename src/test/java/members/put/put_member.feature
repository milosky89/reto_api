@putMembers
Feature: Put members of api testing

  Background:
    * url "http://localhost:5002/api/"
    * header Authorization = call read('../../util/basic-auth.js') { username: 'admin', password: 'admin' }
    * configure headers = { Accept : '*/*' , Content-Type : 'application/json'}
    * configure charset = null
    * def wait = function(pause){ java.lang.Thread.sleep(pause * 1000) }

  @UpdateMember
  Scenario: Update member successful
    Given path 'members'
    And  path id = '1'
    When request
    """
      {
        "name": "Andres",
        "gender": "male"
      }
    """
    And method Put
    Then status 200

  @UpdateMemberFail
  Scenario: Update member only name
    Given path 'members'
    And  path id = '2'
    When request { name: 'Fernando'}
    And method Put
    Then status 400
    And match $ == {"msg": "Please provide only name and gender"}
