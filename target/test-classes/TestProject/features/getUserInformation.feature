Feature: GET Apı Feature

  Scenario: get user informations


  Scenario: get all active and male users
    * def query = {status:'active', gender:'male'}
    Given url baseUrl
    And params query
    When method GET
    Then status 200
    * print response

  Scenario: get all active user count
    * def query = {status:'active'}
    Given url baseUrl
    And params query
    When method GET
    Then status 200

    * def informations = response
    * print informations
    * def count = informations.length
    * print count


  Scenario: get user information - find name and email
    Given url baseUrl
    And path '30'
    When method GET
    Then status 200
    * print response
    * def informations = response
    * print informations.name
    * match informations.name == 'Saraswati Panicker'
    * print informations.email
    * match informations.email == 'panicker_saraswati@kertzmann.org'


  Scenario: get user informations
    Given url baseUrl
    And path '30'
    When method GET
    Then status 200


  Scenario: get user informations - not found
    Given url baseUrl
    And path '1'
    When method GET
    Then status 404




