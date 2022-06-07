Feature: update user information

  Background:
    * url baseUrl
    * def changeReq =
    """
    {
        "status": "active"
    }
    """


  Scenario: update user status
      Given path '28'
      And request changeReq
      And header Authorization = 'Bearer ' + tokenID
      When method put
      Then status 200
      And match $.status == 'active'
