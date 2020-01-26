# README

Run the following commands to setup the application:

1. Clone the project
2. bundle install
3. rails db:setup
4. rails db:seed
5. rails s

### Steps:
- Start the server & visit the home page http://localhost:3000/
- This page lists the products in a tabular and paginated form. Please make sure to run _rails db:seed_ before.
- The page enables the user to search and sort with different conditions.

### Test runs
1. rake RAILS_ENV=test db:seed
2. Check that your geckodriver is updated and linked. If not,
    ```
    brew upgrade geckodriver

    brew link geckodriver
    ```
3. To run tests:
    ```
    rspec spec/features/index_spec.rb
    ```


### System dependencies:

- Ruby version 2.3.1
- Rails version 5.1.7
- Rspec
- Postgres
- RSpec
- Capybara
- Bundler version 2.0.1
- JQuery Datatables