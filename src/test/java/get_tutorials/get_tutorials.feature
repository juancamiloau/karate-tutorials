Feature: Get tutorials
  Like a suscriber
  I want to search tutorials
  To choose one

  Background: Set url
    Given url 'http://localhost:8080/api/'

  Scenario: Get tutorial by Id OK
    * def mySqlConnection = Java.type('utils.MySqlConnection')
    * def idTutorial = 1
    Given path 'tutorials'
    And path idTutorial
    When method Get
    Then status 200
    And match response == {"id":#ignore,"title":"Updating title","description":"Updating with rest assured","published":true}
    And match response ==
    """
      {
        id: #number,
        title: #string,
        description: #string,
        published: #boolean
      }
    """
    * def schemaJson = read('classpath:get_tutorials/schema_get_tutorial_by_id.json')
    And match response == schemaJson
    * def tutorial = mySqlConnection.getTutorialByBD(response.id)
    And match response == tutorial
    And match response.id == tutorial.id
    * def token = response.token
   # * eval mySqlConnection.deleteTutorialById(response.id)

  Scenario: Get tutorial by Id not exist
    Given path 'tutorials'
    And path '7'
    When method Get
    Then status 204

  Scenario: Get all tutorials
    Given path 'tutorials'
    When method Get
    Then status 200
    #And match response == '#[6]'
    And match each response..id == '#number'


  @ExamplesCode
  Scenario: Exmaples code java
    * def exampleClass = Java.type('utils.Examples')
    * eval exampleClass.createInstance().helloWorldWithInstance()
    * def ramdonValue = exampleClass.ramdom()
    * print ramdonValue
    * eval exampleClass.createInstance().receiveObject("hola")



