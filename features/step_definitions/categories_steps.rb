# Add a declarative step here for populating the DB with blogs.

Given /the following categories exist/ do |categories_table|
  categories_table.hashes.each do |category|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that article to the database here.
    Category.create(category)    
  end
end