Feature: Demo to delete a user

  Scenario: Delete the user with the parameter
    Given url 'https://reqres.in/api/users'
    And param id = 2
    When method DELETE
    Then status 204

  Scenario: Delete the user with the assertion
    Given url 'https://reqres.in/api/users'
    And param id = 2
    When method GET
    And print 'Response is: ', response
    Then match response.data.first_name == 'Janet'
    And  match response.data.last_name == 'Weaver'
    When method DELETE
    Then status 204
    And print response
    And print responseTime