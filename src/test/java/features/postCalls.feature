Feature: Enthrall Education POST API Validation

Background:
Given url 'http://enthrall.education:3001'

Scenario: Add Player into Players endpoint
Given path '/players'
And header Accept = 'application/json'
* def body =
"""
{
            "id" : 11,
            "firstName": "Baba",
            "lastNmae": "Azam",
            "DOB": "11/12/1981",
            "countryCode": 90          
            }
            """
 And request body          
 And method POST
 And status 201
 
 @json-payload
 Scenario: Add Player from json file
 * def payload = read('classpath:player.json'
 * set payload.firstName = 'Andrew'
 * set payload.lastName ='Russel'
 * set payload.DOB = '09/12/1990'
 * set payload.countryCode = 50
 Given request payload
 When method POST
 Then status 201
 
 Scenario Outline: Add multiple players
 * def payload = read('classpath:player.json'
 * set payload.firstName = <firstName>
 * set payload.lastName = <lastName>
 * set payload.DOB = <DOB >
 * set payload.countryCode = <countryCode>
 Given request payload
 When method POST
 Then status 201
 Examples: 
 | firstName | lastName | DOB| countryCode |
 | 'Sikandar' | 'Raja' | '05/06/2001' | 60 |
 | 'Anil' | 'Kumble' | '03/04/1977' | 90 |
            
    