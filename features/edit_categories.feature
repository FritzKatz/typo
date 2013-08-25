Feature: Edit Categories
  As a blog administrator
  In order to bring order into the existing articles
  I want to be able to add new categories for my articles

  Background: categories in database
    Given the blog is set up
    And I am logged into the admin panel    

    And the following categories exist:
    | id | name     | position | keywords       | description | parent_id |
    | 1  | General  | 1        | General topics |             |           |
    | 2  | Fun      | 2        | Leisure time   |             |           |

  Scenario: Successfully edit category
    Given I am on the categories page
    And I follow "General"
    When I fill in "category_name" with "EditFoobar"    
    And I press "Save"
    Then I should be on the categories page 
    And I should see "EditFoobar" 