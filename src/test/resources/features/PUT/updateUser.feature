Feature: update User Details

  Background:
    * url baseUrl
    * def token = tokenId

  @smoke
  Scenario: create new user
    And path '/public/v2/users'
    And header Authorization = 'Bearer ' + token
    And request
    """
    {
        "name": "Mr Tim Marker",
        "email": "tim.j.markersqwqq@kuhlman-yost.co",
        "gender": "male",
        "status": "active"
    }
    """
    And method post
    Then status 201
    And match responseType == 'json'
    And print 'response is:' , response
    And def userid = response.id
#    And call read('../GET/getUsers.feature@commonGet')


    And path '/public/v2/users', userid
    And header Authorization = 'Bearer ' + token
    And request
    """
    {
        "name": "Mr Tim Jonathan Marker",
        "email": "tim.j.markeraqza@kuhlman-yost.co",
        "gender": "female",
        "status": "active"
    }
    """
    And method put
    Then status 200
    And match responseType == 'json'
    And print 'response is:' , response
    And assert responseTime < 2000


  @smoke
  Scenario Outline: Dynamic data and generating random name using java function
    And path '/public/v2/users'
    And header Authorization = 'Bearer ' + token

    And def javaObject = Java.type('supportingFunctions.RandomNameGenerator')
    And def nameGen = javaObject.randomName()

    And request {"name": '#(nameGen)',"email":<Email>,"gender":<Gender>, "status":<Status>}
    And method post
    Then status 201
    And match responseType == 'json'
    And print 'response is:' , response
    And def userid = response.id
    And assert responseTime < 2000
    And print nameGen

    Examples:
      | Name      | Email                        | Gender | Status |
      | Jonathan1 | Jonathan.h2222@jonathn.h.com | male   | active |
#      | Aron1     | Aronfinch.121@aron.com    | female | inactive |
#      | Mathew1   | Mathew.mathew1@mathew.com | male   | active   |


  @smoke
  Scenario: update user using json file
    Given path '/public/v2/users', 3826978
    And header Authorization = 'Bearer ' + tokenId
    And def jsonBody = read('users.json')
    And request jsonBody
    And method put
    Then status 200
    And match responseType == 'json'
    And print 'response is:' , response
    And match response.name == 'Anish Ahluwalia III'
    And match response == {name: '#string', email: '#string', gender:'#string', id: '#number', status: '#string'}
