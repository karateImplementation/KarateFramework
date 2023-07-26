Feature: fetching User Details

  @Smoke @commonGet
  Scenario: testing the get call for User Details
    Given url 'https://gorest.co.in/public/v2/users'
    When method GET
    Then status 200

  @toBeCalled
  Scenario: print base url
    * print baseUrl
    * print myVarName
#
#  @Smoke
#  Scenario: testing the get call for User posts
#    Given url 'https://gorest.co.in/public/v2/users/2112/posts'
#    When method GET
#    Then status 200
#    And match $ contains {id:"669"}
##    And match $.id == "669"
##    And match $.user_id == "2112"
##    And match $.title == "Peior tantillus cum comptus adiuvo tracto thesis triginta copia curis cibo angelus conitor depereo."

# @Smoke
#    Scenario Outline: Mock test
#    Given url ApiAdminURL
#
#    And path AdminPath
#
#    And header apigateway-apikey = apiGatewayKey
#
#    And header apigateway-basepath = 'lambdaTest'
#
#    * json myReq = read('users.json')
#
#    * set myReq.apiConf.subscriptionTiers = subscriptionTiers
#
#    * print 'my subscriptions : ', myReq.apiConf
#
#    And request myReq
#
#    When method post
#
#    Then status responseCode
#
#    * call read('Delete.feature')
#
#    Examples:
#
#      | subscriptionTiers                     |responseCode|
#      | [Unlimited,Gold,Bronze, Silver]       |200         |
#      | [Unlimited,Gold,Bronze]               |200         |
#      | [Unlimited,Gold,BronzeAuto-Approved]  |400         |


#  Scenario: get booking
#    Given url 'https://restful-booker.herokuapp.com/booking/788'
#    When method get
#    Then status 200
#    And print 'response is: ', response
#
#  Scenario: get booking with name
#    Given url 'https://restful-booker.herokuapp.com/booking?firstname=Anshuman&lastname=joshi'
#    When method get
#    Then status 200
#    And print 'response is: ', response