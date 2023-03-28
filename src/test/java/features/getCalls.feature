Feature: Enthrall Education API Valdiation

Background:
Given url 'https://enthrall.education:3001'

Scenario: Validate countries endpoint status 200
Given path '/countries'
When method GET
Then status 200


Scenario: Validate players endponit status 200
Given path '/players'
When method GET
Then status 200
And match response[0].id == 1
And match response[1].firstName == 'Sakibal'
And match response[2].lastNmae == 'Malinga'
