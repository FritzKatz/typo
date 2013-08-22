# Add a declarative step here for populating the DB with blogs.

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that article to the database here.
    Article.create(article)    
  end
end

# Provides login routine for user

And /^I am logged into the user panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'user'
  fill_in 'user_password', :with => 'usertest'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

And /^I should see the content of "(.*)" and "(.*)"/ do |e1, e2|
  page.should have_content("Welcome!")
  page.should have_content("Goodbye!")
end


# And /^it should have the author "(.*)"/ do
# end  

# And /^it should have the comments of "Hello World!" and "Hello World too!"
# end


# And /^it should have the title of "(.*)"/ do
#     response.body.should have_css("input#article_title", :value => $1)
# end


Then /(I should see all articles)/ do #| rating_list |  
  articleCount = Article.all.count  
  rowCount = page.all('table# tbody tr').size
  rowCount.should == movieCount
end
