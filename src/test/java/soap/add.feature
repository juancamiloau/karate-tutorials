Feature: Add numbers
  Like a student
  I need to add numbers
  To check the result

  Scenario: Add 2 numbers ok
    * url 'http://www.dneonline.com/calculator.asmx'
    * def int1 = 10, int2 = 10
    Given request
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <Add xmlns="http://tempuri.org/">
          <intA>#(int1)</intA>
          <intB>#(int2)</intB>
        </Add>
      </soap:Body>
    </soap:Envelope>
    """
    When soap action 'http://tempuri.org/Add'
    Then status 200
    And match //AddResult == '20'

    Scenario: Add 2 number with file OK
      * url 'http://www.dneonline.com/calculator.asmx'
      * def int1 = 10, int2 = 10
      * def addXmlRequest = read ('classpath:soap/add_request.xml')
      * match addXmlRequest/Envelope/Body/Add/intA == '10'
      * match addXmlRequest//intA == '10'
      Given request addXmlRequest
      When soap action 'http://tempuri.org/Add'
      Then status 200
      And match //AddResult == '20'


