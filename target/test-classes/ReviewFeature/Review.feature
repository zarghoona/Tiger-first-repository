 Feature: End to End Account creation.
 
  Scenario: create new account and adding address, phone number, and car
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def generatedToken = response.token
    And print generatedToken
    * def generator = Java.type('tiger.api.review.assignment.FakerClass')
    * def email = generator.getEmail()
    * def phone = generator.getPhoneNumber()
    * def firstname = generator.getFirstName()
    * def lastname = generator.getLastName()
    * def dob = generator.getDateOfBirth()
    And print email
    And print phone
    And print firstname
    And print lastname
    And print dob
    Given path "/api/accounts/add-primary-account"
    And request
    """
    {
  "email": "#(email)",
  "firstName": "#(firstName)",
  "lastName": "lastName",
  "title": "Mrs.",
  "gender": "FEMALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "Unemoloyee",
  "dateOfBirth": "2022-07-22T19:40:34.487Z",
  "new": true
  {
  """
  And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 201
  * def generatedId = rsponse.id
  And print response
  Then assert response.email == email
  And print response
  * def generator = Java.type('tiger.api.review.assignment.FakerClass')
  * def street = generator.getStreet()
  * def city = generator.getCity()
  * def state = generator.getState()
  * def country = generator.getCountry()
  * def zipCode = generator.getZipCode()
  * def countryCode = generator.getCountryCode()
  And print street
  And print city
  And print country
  And print zipCode
  And print countryCode
  Given path "/api/accounts/add-account-address"
  And header Authorization = "Bearer " + generatedToken
  And param primaryPersonId = generatedId
  And request
  """
  {
  
  "addressType": "House",
  "addressLine1": "5722 Elte ct, home 122",
  "city": "Stafford",
  "state": "virginia",
  "postalCode": "string",
  "countryCode": "22311",
  "current": true
   }
  """
  When method post
  Then status 201
  And print response
  * def generator = Java.type('tiger.api.review.assignment.FakerClass')
  * def phone = generator.getPhoneNumber()
  * def extension = generator.getExtension()
  And print phone
  And print extension
  Given path "/api/accounts/add-account-phone"
  And header Authorization = "Bearer " + generatedToken
  And param primaryPersonId = generatedId
  And request
  """
  {
  "id": 0,
  "phoneNumber": "213-345-2345",
  "phoneExtension": "3345",
  "phoneTime": "Day",
  "phoneType": "Mobile"
  }
  """
  When method post
  Then status 201
  And print response
  Given path "/api/accounts/add-account-car"
  And header Authorization = "Bearer " + generatedToken
  And param primaryPersonId = generatedId
  And request
  """
  {
  "make": "Toyota",
  "model": "Corolla",
  "year": "2020",
  "licensePlate": "ZAY182"
  }
  """
  When method post
  Then status 201
  And request response
  
  
 
