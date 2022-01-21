Feature: Update tutorials
  Like a publisher
  I want to update tutorials
  To keep updated all tutorials

  Background: Setup
    * url 'http://localhost:8080/api/'


  Scenario: Update tutorials
    * def updateTitle = "Tutorial created by karate call feature 1"
    Given def create_tutorial = call read('classpath:create_tutorials/create_tutorials.feature@Create')
    Given path 'tutorials'
    And print create_tutorial.id
    And path create_tutorial.id
    And request
    """
    {
      title : '#(updateTitle)',
      description : "This tutorial is an example for Karate call feature 2",
      published: false
    }
    """
    When method Put
    Then status 200
    And match response ==
    """
    {
      id : #ignore,
      title: '#(updateTitle)',
      description:"This tutorial is an example for Karate call feature 2",
      published:false
    }
    """
    And match response.id == '#notnull'
    And match response.title == '#(updateTitle)'


  Scenario: Ejemplo Validaciones Esquemas
     # * def miArreglo = ["hola","mundo", 1]
    * def miArreglo = ["hola ","mundo"]
    Then match miArreglo == '#[]'
    * match miArreglo == '#array'
    * match miArreglo == '#[2]'
      #* match miArreglo == '#[3] #string'
    * match miArreglo == '#[2] #string'
      #* match miArreglo[*] == 'hola'
    * match miArreglo == '#[2] #string? _.length == 5'
    * match miArreglo[0] == '#regex '
