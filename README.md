# NimbleTestMbc
 Technical Test - iOS Developer
>
# Overview
* Create an application that allows users to browse a list of surveys.
* Users must log in to the application.
* Integrate with an OAuth 2 API providing both REST and GraphQL endpoints.
>
# Application features
* Authentication:
  * Implement the login authentication screen.
  * Implement the OAuth authentication including the storage of access tokens.
  * Implement the automatic usage of refresh tokens to keep the user logged in using the OAuth API.
* Home Screen:
  * On the home screen, each survey card must display the following info:
    * Cover image (background)
    * Name (in bold)
    * Description
  * There must be 2 actions:
    * Horizontal scroll through the surveys.
    * A button “Take Survey” should take the user to the survey detail screen. 
  * The list of surveys must be fetched when opening the application.
  * Show a loading animation when fetching the list of surveys.
  * The navigation indicator list (bullets) must be dynamic and based on the API response.
>
# Technical requirements
1. Develop the application using:
    - Xcode
    - Cocoa Pods
    - Fastlane
2. Target iOS 10.0 and up.
3. Use Git during the development process. Push to a public repository on Bitbucket, Github, or Gitlab. Make regular commits and merge code using pull requests.
4. Write unit tests using your framework of choice.
5. Use either the REST or GraphQL endpoints. The choice is yours to make. Make sure that you use the production URLs.
