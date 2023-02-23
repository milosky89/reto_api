@DeleteMembers
Feature: Delete members of api testing

  Background:
    * url "http://localhost:5002/api/"
    * header Authorization = call read('../../util/basic-auth.js') { username: 'admin', password: 'admin' }
    * configure headers = { Accept : '*/*' , Content-Type : 'application/json'}
    * configure charset = null

    @DeleteMember
    Scenario: Delete a member successful
      Given path 'members'
      And  path id = '5'
      When method Delete
      Then status 200

    @DeleteMemberFail
    Scenario: Delete a member Fail
      Given path 'members'
      And  path id = '222'
      When method Delete
      Then status 404