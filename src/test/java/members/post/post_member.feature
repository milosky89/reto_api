@postMembers
Feature: Post members of api testing

  Background:
    * url "http://localhost:5002/api/"
    * header Authorization = call read('../../util/basic-auth.js') { username: 'admin', password: 'admin' }
    * configure headers = { Accept : '*/*' , Content-Type : 'application/json'}
    * configure charset = null
    * def wait = function(pause){ java.lang.Thread.sleep(pause * 1000) }

    @createMember
    Scenario: Post a member successful
      Given path "members"
      When request
      """
      {
        "name": "Andres",
        "gender": "male"
      }
      """
      And method Post
      Then status 201
      And match $ == {id : #number, name : "Andres", gender: "male" }


  @createMemberFailName
  Scenario: Post member with numeric name
    Given path "members"
    When request
      """
      {
        "name": "M3ria",
        "gender": "male"
      }
      """
    And method Post
    Then status 400
    And match response.msg == 'Name should only contain Alphabets'
    And wait(21)


  @createMemberFailGender
  Scenario: Post member with different gender
      Given path "members"
      When request
      """
       {
         "name": "Pedro",
         "gender": "binario"
       }
       """
      And method Post
      Then status 400
      And match response.msg == 'Gender should be either male or female only'
