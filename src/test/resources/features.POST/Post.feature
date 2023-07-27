Feature: Add user data

  @Smoke
  Scenario: Response code should be 201
    Given url 'https://jsonplaceholder.typicode.com/posts'
    When request [{"userId":14444,"id":1111,"title":"sunt aut facere reepellat provident occaecati excepturi optio reprehenderit","body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"}]
    And method POST
    Then status 201

  @Smoke
  Scenario: Validate the api response
    Given url 'https://jsonplaceholder.typicode.com/posts'
    When request [{"userId":14444,"id":1111,"title":"sunt aut facere reepellat provident occaecati excepturi optio reprehenderit","body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"}]
    And method POST
    Then match response $ =={"0":{"userId":14444,"id":1111,"title":"sunt aut facere reepellat provident occaecati excepturi optio reprehenderit","body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"},"id":101}


