# Mod 3 Refactoring Workshop

## Background

Near Earth Objects is an educational command line tool that strives to interrupt the monotony of day to day living by allowing users to understand how close to extinction life on earth is at any given point in time. Every day thousands of NEOs (Near Earth Objects) i.e. comets, astroids, meteors pass by the earth at alarmingly close distances. One slight shift in the cosmos would cause these NEOs to crash into the earth, setting off a series of catastrophic events that would lead to the end of life as we know it (much like the fate of the dinosaurs). Now that we've discussed this, please take a moment to appreciate 3 small things in your life that you take for granted and assume will always be there...

## Instructions

Please follow these instructions for further enlightenment.

- Clone this repo
- Run `bundle install` to download and install all of the necessary dependencies
- This project uses NASA's Astroids - NeoWs API. Please signup for an API key [here](https://api.nasa.gov/)
- Once you have your api key, run `bundle exec figaro install`. This should create a file called `application.yml` located in the `config` folder. **Note:** This file is automatically gitignored and many IDEs do not show gitignored files by default. You may have to change your IDE's settings to show gitignored files.
- Append your api_key to `application.yml` in the following format `nasa_api_key: <Your API KEY Goes Here>`
- This project uses minitest. You can run the tests with the following command `ruby near_earth_objects_test.rb`
- To use the command line tool run `ruby start.rb`. You will be prompted to enter a date. Enter the date in the following format `YYYY-MM-DD` i.e. `2019-03-30`. Once you hit enter you will see information about the objects that came near to the earth on that day.

## Workshop

### Explore the code (15 min)

With your partner look through `start.rb` and `near_earth_objects.rb`

- Discuss is this 'good' or 'bad' code? Why?

I think this code is good because, for the most part, I can understand what is happening. It is readable. The variables are clearly named. it is pretty straight-forward. It makes using an API seem easy. The things that seem not so good are the length of the methods, the dependence on single line syntax for enumeration, and some formatting issues (spacing and indentation).
---

### Identify the responsibilities (10 min)

With your Partner, identify the different responsibilities that exist in each file.

- Does this adhere to SRP?

I don't think so. The start file is doing some work formatting the data output that I suspect could work in a separate file. The other file (near_earth_objects.rb) is hard to tell, because the variables are all definited within a single method. If they were to be extracted, it may become apparent that they would fit better elsewhere.

- How would you utilize encapsulation and abstraction to refactor this code?

I would certainly make the class method in near_earth_objects.rb shorter by creating instance methods to act as helpers and assign the variables.

I would also isolate the methods in start.rb that are responsible for formatting the output into a separate class from the data itself.

I do not know if there is a reason to make any more classes.

- What tools/strategies could you utilize to make this code adhere to SRP?

I could think about categorizing the different actions that take place between the user running the program and entering a date and the list of NEOs being returned to them in a formatted state. For instance, we are fetching data, extracting relevant information from the returned data, formatting data, printing text to a user, recieving text from a user, and so on. I would then go through each method and determine where it belongs; if it belongs to more than one category, it is likely doing too much and could be broken into smaller pieces of functionality.
---

### Refactor (1 hour)

Declarative Programming:
- Write the code you wish existed above the existing code
- Keep the code that is currently working. Don't delete it until the new code is working. This way you will always have a passing solution

---

Red, Green, Refactor:
- Utilize tests to keep you moving in the right direction
- Follow the errors in the test to guide you each step of the way
