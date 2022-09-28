# Sweater Weather

![ruby](https://img.shields.io/badge/Ruby-2.7.2-red)
![rails](https://img.shields.io/badge/Rails-5.2.8-red)
![rspec](https://img.shields.io/badge/RSpec-3.11.0-green)
![contributors](https://img.shields.io/badge/Contributors-1-yellow)

## Table of Contents
- [App](#app)
- [Background](#background)
- [Schema](#schema)
- [Learning Goals](#learning-goals)
- [Endpoints](#endpoints)
- [External API Endpoints](#external-api-endpoints)
- [Installation](#installation)
- [Contributor](#contributor)

## App

Sweater Weather app can be found on [heroku](https://sweater-weather-new.herokuapp.com/api/v1/forecast?location=denver,co).

<p align="right">(<a href="#top">back to top</a>)</p>

## Background

Sweater Weather is a service-oriented Application that exposes API endpoints for trip planning. This app allows users to see current weather and weather forecast to plan their trip.

<p align="right">(<a href="#top">back to top</a>)</p>

## Learning Goals

- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality 
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Schema

<img width="796" alt="image" src="https://user-images.githubusercontent.com/99001315/192816685-0d0bb697-1d30-4ab2-8ddd-20a156a446d9.png">

<p align="right">(<a href="#top">back to top</a>)</p>

## Endpoints

### Forecast for a location
* http request
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
headers: { 'Authorization' => 'Bearer YOUR_API_KEY' }
```
* Postman Sample Response:

![image](https://user-images.githubusercontent.com/97060659/173624567-dcddea87-6638-4cea-ae54-e8f3c440a65d.png)

<p align="right">(<a href="#top">back to top</a>)</p>

### Background image for a location
* http request
```
GET '/api/v1/backgrounds?location=denver,co'
Content-Type: application/json
Accept: application/json
headers: { 'Authorization' => 'Bearer YOUR_API_KEY' }
```
* Postman sample response

![image](https://user-images.githubusercontent.com/97060659/173625529-4a701523-2707-44e3-95cf-4191503fc2a9.png)

<p align="right">(<a href="#top">back to top</a>)</p>

### User registration
* http request
```
POST 'api/v1/users'
Content-Type: application/json
Accept: application/json

body:
{
  "email": "user@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
* Postman sample response

![image](https://user-images.githubusercontent.com/97060659/173627037-3d6ca340-1bc9-4799-808e-04838a261f6d.png)

<p align="right">(<a href="#top">back to top</a>)</p>

### User login
* http request
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

body:
{
  "email": "user@example.com",
  "password": "password"
}
```
* Postman sample response

![image](https://user-images.githubusercontent.com/97060659/173627037-3d6ca340-1bc9-4799-808e-04838a261f6d.png)

<p align="right">(<a href="#top">back to top</a>)</p>

### Creating a Road Trip
* http request
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:
{
  "origin": "Denver,CO",
  "destination": "Los Angeles,CA",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
* Postman sample response (valid trip):

![image](https://user-images.githubusercontent.com/97060659/173627710-a8480542-f041-425b-ac35-4811537d3949.png)
* Postman sample response (impossible route):

![image](https://user-images.githubusercontent.com/97060659/173627829-c6bea214-3bd4-4bc1-9900-d70a489ecebf.png)

<p align="right">(<a href="#top">back to top</a>)</p>

## External API Endpoints 

#### MapQuest
-  Endpoint(s) consumed:
    * [Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
    * [Directions API](https://developer.mapquest.com/documentation/directions-api/)
- Instruction to obtain an API key:
    *  Visit [MapQuest Developer Signup Page](https://developer.mapquest.com/user/login/sign-up) and create an account
    *  Login and visit profile page. Under Manage Keys tab, the API key is listed under Application/Consumer Key.
    *  [Developer's Guide](https://developer.mapquest.com/documentation/open/)
    *  [Terms of Use](https://developer.mapquest.com/legal)

#### OpenWeather
-  Endpoint(s) consumed:
    * [One Call API](https://openweathermap.org/api/one-call-api)
- Instruction to obtain an API key:
    *  Visit [OpenWeather Signup Page](https://home.openweathermap.org/users/sign_up) and create an account
    *  Login and click on your user name. Under the dropdown menu, select My API Keys option to view and manage your API key (Note: it may take a few hours for the API key to be activated).
    *  [Developer's Guide](https://openweathermap.org/guide)


## Installation

1. Fork and/or Clone the repo using the SSH key
  ```
  git clone git@github.com:rue-zheng/sweather_weather.git
  ```
2. Install gems and dependencies
  ```
   bundle install
  ```
3. Create database and run migrations
  ```
rails db:create
rails db:migrate
```

4. Set up figaro to securely use API key
  ```
  bundle exec figaro install
  ```
5. To use the API services mentioined above, add the following line in the hidden `root/config/application.yml` file generated in step 4: 
  ```
mapquest_api_key: YOUR_MAPQUEST_API_KEY
openweather_api_key: YOUR_OPEN_WEATHER_API_KEY
  ```
6. Run run test suit 
  ```
  bundle exec rspec
  ```
7. Start the local server to service API requests:
  ```
  rails s
  ```

 Open web browser and add endpoints to the end of the local base url:
    
    http://localhost:3000

<p align="right">(<a href="#top">back to top</a>)</p>

## Contributor

### Rue Zheng 
[<img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />](https://github.com/ruezheng) &#124; [<img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />](https://www.linkedin.com/in/ruezheng/)

<p align="right">(<a href="#top">back to top</a>)</p>
