# Zombie Survival Social Network

[![Build Status](https://travis-ci.org/grascovit/zombie-survival-social-network.svg?branch=master)](https://travis-ci.org/grascovit/zombie-survival-social-network)
[![codecov](https://codecov.io/gh/grascovit/zombie-survival-social-network/branch/master/graph/badge.svg?token=fHFLeGRtlg)](https://codecov.io/gh/grascovit/zombie-survival-social-network)

The world has finally reached its apocalyptic state, where a pandemic caused by a laboratory virus transforms humans and animals into zombies, meat-hungry beings.

You, as a member of the resistance (and last survivor with knowledge in software development) were assigned to develop a system for sharing resources among uninfected humans.


### Problem description
You can find the complete problem description as well the features for this project [here](https://github.com/grascovit/zombie-survival-social-network/wiki). The original problem description in portuguese is [here](https://gist.github.com/mauricioklein/1b1f279ad2d9cb42bcf0018e1cf05cfb).

### API documentation
The API documentation with example calls required by the features are [here](https://github.com/grascovit/zombie-survival-social-network/wiki/API-documentation)

### Starting the API
Run the following steps at the root folder:
```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails s
```

### Testing
Before running the tests, assure that your `config/database.yml` is configured with your PostgreSQL user and password.
Then, run the tests:
```
$ rake db:migrate RAILS_ENV=test
$ bundle exec rspec
```
After finishing, a report will be created at `coverage/index.html` containing the details from the coverage.

### Static code analysis
Rubocop is used for the analysis. You can read more about the community guidelines [here](https://github.com/bbatsov/ruby-style-guide).
Some of this rules are customized in the `.rubocop.yml` file.
To run the analysis:
```
For just running the analysis:
    $ rubocop
For running the analysis along with the autofix option:
    $ rubocop -a
```