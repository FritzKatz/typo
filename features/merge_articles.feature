Feature: Merge Articles

  As a blog administrator
  In order to guarantee that there are no duplicate articles
  I want to be able to merge articles from different users

  Background: articles in database

  Given the blog is set up
  And the following articles exist:
  | id | type     | title            | author   | body                |
  | 1  | Article  | Hello!           | Mr Typo  | Welcome everybody!  |
  | 2  | Article  | Hello World too! | Mrs Typo | Goodbye to you all! |  

  #And I am logged into the admin panel

  Scenario: Invalid user and/or password
    Given I am on the login page
    When I fill in "user_login" with "Foo"
    And I fill in "user_password" with "bar"
    And I press "Login"
    Then I should see "Login unsuccessful"

  Scenario: A non-admin cannot merge two articles
    Given I am logged into the user panel
    When I go to the edit article page for the article with id "1"
    Then I should see "Error, you are not allowed to perform this action"

  Scenario: Admin successfully visits the edit articles page
    Given I am logged into the admin panel
    When I go to the edit article page for the article with id "1"
    Then I should see "Merge Articles"

  Scenario: Admin successfully visits the edit articles page
    Given I am logged into the admin panel
    And I am on the edit article page for the article with id "1"
    # And I merge the articles with the ids "1" and "2"
    When I fill in "merge_with" with "2"
    And I press "Merge"
    # And I am on the all articles page
    Then I should be on the all articles page
    And I should see "Hello!"
    And I should not see "Hello World too!"

    # And it should have the author "Mr Typo"
    # And it should have the comments of "Hello World!" and "Hello World too!"
    # And it should have the title of "Hello World!"



    

    


#     Then I should see
#     And I follow "All Articles"

#     When I fill in "article_title" with "Foobar"
#     And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
#     And I press "Publish"
#     Then I should be on the admin content page
#     When I go to the home page
#     Then I should see "Foobar"
#     When I follow "Foobar"
#     Then I should see "Lorem Ipsum"

# Scenario: Create blog page shown
#     Given I am on the home page
#     Then I should see "Welcome"
#     And I should see "My Shiny Weblog!"

#   Scenario: Create blog page not shown when blog created
#     Given the blog is set up
#     When I am on the home page
#     Then I should not see "My Shiny Weblog!"
#     And I should see "Teh Blag"

# The article merge feature
#   should be shown on the article edit page [15 points] (FAILED)
#   should create a single merged article [15 points] (FAILED)
#   should create an article with the text of both original articles [20 points] (FAILED)
#   should carry over the comments from both merged articles [20 points] (FAILED)
#   should only show the merge button to administrators [15 points] (FAILED)
#   should only allow administrators to merge articles [15 points]    