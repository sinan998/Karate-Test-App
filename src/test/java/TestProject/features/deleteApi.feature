Feature: Create a new user

  Background:
    * url baseUrl
    * def randomString = call read("randomStringGenerator.feature")
    * def createReqWithRandomMail = read('../jsonData/createUserWithRandomMail.json')

  Scenario: delete user
    # 1 create a user
    * def randomMail =  randomString.randomString(10)
    * print randomMail
    * def userInformations = createReqWithRandomMail
    * userInformations.email = randomMail +"@gmail.com"

    Given request userInformations
    And header Authorization = 'Bearer ' + tokenID
    When method POST
    Then status 201
    And match $.id == '#present'

    #2. find user id
      * def userID = $.id

    #3. delete user
    Given path userID
    And header Authorization = 'Bearer ' + tokenID
    When method DELETE
    Then status 204

    # control
    Given path userID
    When method GET
    Then status 404
    And match $.message == 'Resource not found'







