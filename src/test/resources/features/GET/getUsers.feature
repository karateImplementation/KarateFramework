Feature: fetching User Details

  @Smoke
  Scenario: get User Details
    Given url 'https://gorest.co.in/public/v2/users'
    And path '3893720'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def empId = jsonResponse.id
    * def empName = jsonResponse.name
    * def empEmail = jsonResponse.email
    * def empGen = jsonResponse.gender
    * def empStatus = jsonResponse.status
    * print empName
    * match empName == 'Baala Talwar'
    * match empId == 3893720
    * match empEmail == 'baala_talwar@hahn.test'
    * match empGen == 'female'
    * match empStatus == 'active'
    * print 'The name of the emplyee with the Id ' + empId + ' is '+ empName


  @Smoke
  Scenario: get User Details  -- User Not Found
    Given url 'https://gorest.co.in/public/v2/users'
    And path '312'
    When method GET
    Then status 404
    * print response


  Scenario: get all active users by query parameter
    * def query = {status:'active',gender: 'male', id:3810831}
    Given url 'https://gorest.co.in/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: get all active users count by query parameter
    * def query = {status:'active'}
    Given url 'https://gorest.co.in/public/v2/users'
    And params query
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def userCount = jsonResponse.length
    * print userCount