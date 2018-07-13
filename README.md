# StkOvFlow_iOSChallenge

**Requirements** 
- Use the StackOverflow Search endpoint
- Displays title, display name, profile image, and number of answers
- Supports pagination 
- Clicking on question will push to new viewcontroller displaying answer
- Show body of question. Use 'body_markdown' to display body text
- Show answer with previous info: title, display name, profile image, number of answers, along with body

**Execution:**
- Written in Swift 4
- No 3rd party libraries were used
- Uses an MVVM architecture pattern
- Uses a Storyboard
- Used a TableView Controller to display endpoint information
- For the model I used Codable to easily encode + decode JSON values and for the service I used URLSession
- UIActivityIndicator is used when loading data to tableview 
- Pushed from Cell to new ViewController to display answer information
- Error handling is implemented in case there is no internet connetion or failure 
- NSCache is used to temporarily store images
- Unit Testing 

**Resources:** 
https://app.quicktype.io/ - Used to quickly parse JSON

**API Reference:**
https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=swift&site=stackoverflow 
https://api.stackexchange.com/docs
https://api.stackexchange.com/docs/search#order=desc&sort=activity&intitle=swift&filter=default&site=stackoverflow
https://api.stackexchange.com/docs/answers-on-questions


