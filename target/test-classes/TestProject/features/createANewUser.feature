Feature: Create a new user

  Background:
    * def createReqBody = read('../jsonData/createUser.json')
    * url baseUrl
    * def randomString = call read("randomStringGenerator.feature")
    * def createReqWithRandomMail = read('../jsonData/createUserWithRandomMail.json')

    Scenario: Create a new user with given data
      Given request createReqBody
      And header Authorization = 'Bearer ' + tokenID
      When method POST
      Then status 201
      And match $.id == '#present'
      And match $.name == '#present'
      And match $.name == 'Sinan Sinan'


      Scenario:  create user with random mail
        * def randomMail =  randomString.randomString(10)
        * print randomMail
        * def userInformations = createReqWithRandomMail
        * userInformations.email = randomMail +"@gmail.com"

        Given request userInformations
        And header Authorization = 'Bearer ' + tokenID
        When method POST
        Then status 201
        And match $.id == '#present'
        And match $.name == '#present'
        And match $.name == 'Sinan Sinan'
        And match $.email == userInformations.email




        


