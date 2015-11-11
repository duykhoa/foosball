#Foosball

A simple application to manage foosball games

Support:

- Manage User
- Manage Team
- Manage Game
- Manage Match
- Show stat:
  - Total user, team, games...
  - Best team
  - Best user
  - Win/loose for each user

#Install

- Clone the project
- Install ruby 2.2.3 (may need to install bundler gem as well)
- Bundle install
- `rake db:bootstrap`
- `rails s`

**Advance**
For setup tmux session, view the `script/fooball`, change path, and call the setup.sh script

#Things to know
- A user can joins many teams
- A team has 1-2 users
- 2 teams play a game
- A match includes 3 games, in of a team win 2 games in a row, consider win

#TODO

This is a very short time project, so some parts is developed in hurry.

Need to refactor and write more tests.

Currently, I just cover the test for model & service only.

Also the view is little bit messy, need to be improved.
