Feature: Create tutorials
  Like a publisher
  I want to create tutorials
  To offer for my suscribers


  Background: Set url endpoint
    * url 'http://localhost:8080/api/'

  @Create
  Scenario: Create tutorial
    * def title = 'Tutorial create by Karate'
    Given path 'tutorials'
    And request { title : '#(title)', description : "This tutorial is an example for Karate", published: false }
    When method Post
    Then status 201
    And match response == {"id":#ignore,"title":'#(title)',"description":"This tutorial is an example for Karate","published":false}
    And def id = response.id
