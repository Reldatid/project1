# Project 1 - A world data tracking app for DMs
### Overview
#### Technical Requirements
Your app must:

* Have at least 3 models (more if they make sense) – one representing someone using your application, and one that represents the main functional idea for your app
* Include sign up/log in functionality, with encrypted passwords & an authorization flow
* Have complete RESTful routes for at least one of your resources with GET, POST, PUT, PATCH, and DELETE
* Utilize an ORM to create a database table structure and interact with your relationally-stored data
* Include wireframes that you designed during the planning process (optional)
* Have semantically clean HTML and CSS
* Be deployed online and accessible to the public
* Ideally use an API or gem

#### Necessary Deliverables
* A working full-stack application, built by you, hosted somewhere on Heroku
* A link to your hosted working app in the URL section of your GitHub repo
* A git repository hosted on GitHub, with a link to your hosted project, and frequent commits dating back to the very beginning of the project. Commit early, commit often.
* A readme.md file with explanations of the technologies used, the approach taken, installation instructions, unsolved problems, etc.
* Wireframes of your app, hosted somewhere & linked in your readme
* A link in your readme.md to the publically-accessible user stories you created

So I've chosen to made a data tracking app for tabletop RPGs. Primarily I'm designing for DMs of DND, but ideally it'll be flexible enough for most tabletop games, and players will be able to view and contribute to the data.
This will mean having hidden data that the DM can track (secrets and plot hooks and such) that the players can't see.

#### Teir 1
* A self referencing location database for listing and grouping places. **DONE**
* Tree navigation of locations on the page. **DONE**
* NPCs in locations with information about them.
* Hidden data only visible to the owner(the DM) of the world. _tested_

#### Teir 2
* Prettify the pages for the display and update of data

#### Teir 3
* Character tracking in the app with stats and items.
* DM authorisation to edit player_characters in their world.

#### Teir 4
* prettify stuff. do my best. idek at this stage. stuff changes.
