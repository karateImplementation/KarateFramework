Feature: Get the API Headers

  Scenario: user request with the headers
    Given header User-Agent = 'IE/115.0.1901.183'
    And header Connection = 'keep-alive'
    And header Accept-Encoding = 'gzip, deflate, br'
    When url 'https://gorest.co.in/public/v2/users'
    And path '2241'
    When method GET
    Then status 200
    * print response