Feature: Get single resources
  Like as user
  I wanto to get the resources
  To do inventory

  Scenario: Get single resources exist
    * url 'https://reqres.in/api'
    * path 'unknown','2'
    * header Authorization = 'Token ' + token
    * def dataSchema =
    """
    {
      "id": '#number',
      "name": '#string',
      "year": '#number',
      "color": '#string',
      "pantone_value": '#string'
     }
    """
    When method Get
    Then match response.data == '#(dataSchema)'

    And match response ==
    """
    {
      data: #(dataSchema),
      support:
              {
                url: '#string',
                text: '#string'
              }
    }
    """
