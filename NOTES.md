# Rails 4 in Action
The **soon to be released** [Rails 4 in Action](http://www.manning.com/bigg2/) book by [Ryan Bigg](https://twitter.com/ryanbigg), [Yehuda Katz](https://twitter.com/wycats) and [Steve Klabnik](https://twitter.com/steveklabnik) builds a ticketing/project management application in Ruby on Rails, from-the-ground-up, chapter-by-chapter. This repository is not my original work, but rather, me working throught the pre-release version of the book. Suggestions and issues with the pre-release noted below.

## Issues - !!!WORK IN PROGRESS!!!
### MEAP v11

#### PDF Page 6
* The .rvmrc has been deprecated in favour of .ruby-version and .ruby-gemse

#### PDF Page 7
* The rvm use --default 1.9.3 should be rvm use --default ruby-1.9.3
* Suggestion : Would the use or mention of rvm gemsets be useful? 

```
rvm gemset create rails4_0_0 
rvm gemset use rails4_0_0  
gem install rails -v 4.0.0

```

#### PDF Page 83
* Suggestion: Wouldn't it be better to run rake:db:test:clone to create the test database?

#### PDF Page 84
* Listing 3.16 missing closing p tag

#### PDF Page 91
* the error message description __expected there to be text__ should be __expected to find text__

#### PDF Page 92
* The text __is quite the interesting file__ should be __is quite an interesting file__

#### PDF Page 98
* The text __find__ and __have_content__ should be __page__ and __have_title__

#### PDF Page 99
* The text __expect(find("title"))__ should be __expect(page)__

#### PDF Page 103
* the error message description
__expected there to be text "Project has not been created." in "Project has been created."__ 
should be
__expected to find text "Project has not been created." in "{:notice=>\"Project has been created.\"}"__

#### PDF Page 108
* the error message description
__expected there to be content "Name can't be blank" in ...__
shouuld be
__expected to find text "Name can't be blank" in ...__

#### PDF Page 123
* the error message description
__expected there to be content "Project has not been updated." in ...__
shouuld be
__expected to find text "Projects has not been updated." in ...__

#### PDF Page 127
* __Done! Now you have the full support for CRUD operations in pour ProjectsController__ What does pour mean? (for?, poor?)

#### PDF Page 133
* __You can also remove the first line of update and destroy actions as well.__ already mentioned in previous page 135

#### PDF Page 142
* the error message description
__uninitialized constant Project::Ticket (NameError)__ 
should be
__uninitialized constant Project::Ticket__

#### PDF Page 148
* the error message description
__expected there to be content "Ticket has not been created." in [text]__
should be
__expected to find text "Ticket has not been created." in "{:notice=>\"Ticket has been created.\"}"__

#### PDF Page 153
* the error message description
__expected there to be text__
should be
__expected to find text__

#### PDF Page 158
* In listing 5.9 the following has the brackets missing after have_content:
 __have_content "Ticket has been updated."__

#### PDF Page 168
* __gem 'bcrypt-ruby', '~> 3.0.0'__
should be
__gem 'bcrypt-ruby', '~> 3.1.2'__
as the first one give the following error with rails 4 and ruby 2.0.0-p353
_can't activate bcrypt-ruby (~> 3.1.2), already activated bcrypt-ruby-3.0.1. Make sure all dependencies are added to Gemfile. (Gem::LoadError)_

#### PDF Page 173
* __18 examples, 1 failure__
should be
__19 examples, 1 failure__

#### PDF Page 174
* in the form listing 
__@ticket.errors__
should be
__@user.errors__

#### PDF Page 177
* in the user profile spec
__'Updating a project'__
should be
__'Updating a profile'__

#### PDF Page 177
* in the rspec run result
__10 examples, 0 failures__
should be
__21 examples, 0 failures__

#### PDF Page 177
* in the error message
__Updating a project__
should be
__Updating a profile__

#### PDF Page 182
__user = User.where(:name => params[:signin][:name]).first__
should be with using the new syntax
__user = User.where(name: params[:signin][:name]).first__

#### PDF Page 183
* Shouldn't it be a 'Sign out' section after 'Sign up' and 'Sign in' ?

```ruby
   # spec/features/sign-out-spec.rb
   
   require 'spec_helper'
   
   feature 'signing out.' do
     scenario 'Signing out' do
      user = FactoryGirl.create(:user)
      
      visit '/'
      click_link 'Sign in'
      fill_in 'Name', with: user.name
      fill_in 'Password', with: user.password
      click_button 'Sign in'
      click_link 'Sign out'
      
      expect(page).to have_content('Signed out successfully')
  end
end
```

```ruby
    # app/controllers/sessions_controller.rb
    
    def destroy
      @_current_user = session[:user_id] = nil
      flash[:notice] = 'Signed out successfully.'
      
      redirect_to root_url
    end
    
    private
    
    def current_user
      @_current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
    end
```

```ruby
   # app/views/layouts/application.rb
   
    <li><%= link_to 'Sign out', signout_path %></li>
```

```ruby
   # config/routes.rb
   
     get '/signout', to: 'sessions#destroy'
```

#### PDF Page 177
* in the error message
__Updating a project__
should be
__Updating a profile__

#### PDF Page 184
* Suggestion:
Would it better in the spec to specify the user as an instance variable that can be used to test against the email, in order to be independent of the factory user definition?
So by doing the following changes the user email does not need to be hardcoded:

```ruby
   # spec/features/creating_tikets_spec.rb
   
    ...
    @user = FactoryGirl.create(:user)
    ...
    fill_in 'Name', with: @user.name
    fill_in 'Password', with: @user.password
    ...
    within '#ticket #author' do
      expect(page).to have_content("Created by #{@user.email}")
    end
```

#### PDF Page 184
* in the error message
__expected there to be content__
should be
__expected to find text__

#### PDF Page 185
* in the error message
__expected there to be text__
should be
__expected to find text__

#### PDF Page 185
* in the error message
__undefined local variable or method__
should be
__undefined method__

#### PDF Page 187
* in the error message
__expected there to be content__
should be
__expected to find text__

#### PDF Page 190
__expected there to be content__
should be
__expected to find text__

#### PDF Page 192
* Section 6.7 listing should include two tickets instead of 1 as defined in listing 5.6

#### PDF Page 194
* the file that needs to be changed should be the deleting_tickets_spec.rb instead of editing_tickets_spec.rb
* also the listings are the wrong way. The first one is the one that should replace the second and not the other way around
* the final complete listing of the spec is different regarding the let for the ticket. The user attribute is used one step instead of the two used previously in editing.

#### PDF Page 196
__22 examples, 0 failures__
should be
__23 examples, 0 failures__

#### PDF Page 201
__Create projects_controller_spec.rb__ is already created in previous chapters.

#### PDF Page 203
* Shouldn't the authentication_helpers.rb include the previous method, so should it be like the following?

```ruby
   # spec/support/authentication_helpers.rb
   
   module AuthenticationHelpers
     def sign_in_as!(user)
       visit '/signin'
       fill_in 'Name', with: user.name
       fill_in 'Password', with: user.password
       click_button 'Sign in'
       expect(page).to have_content('Signed in successfully.')
     end
   end

   module AuthHelpers
     def sign_in(user)
       session[:user_id] = user.id
     end
   end

   RSpec.configure do |c|
     c.include AuthenticationHelpers, type: :feature
     c.include AuthHelpers, type: :controller
   end
```

#### PDF Page 204
* in the spec results text
___26 examples, 0 failures___
should be
___28 examples, 0 failures___

#### PDF Page 209, 213, 214
* Shouldn't the actual capybara helper have_link be used instead of custom ones? 
like: 

```ruby
expect(page).to_not have_link('New Project')
...
expect(page).to have_link('New Project')
```

#### PDF Page 215
* in the spec results 
___31 examples, 0 failures___
should be
___37 examples, 0 failures___

<!-- 
 
```

* Mentions "...Just like with the email_spec helper methods in the previous chapter..." which the reader hasn't created.

#### PDF Page 206
* current_user method called, but not created.


#### PDF Page 225
* talks about user_signed_in? method, but again, not created. Probably AWOL with the current_user method ;)

#### PDF Page 225
* Needs a password_confirmation field on the admin user form to pass. Also, need to use user_password user_password_confirmation to avoid ambiguity.

## Recommendations/Suggestions
* DRY up code by moving all _form.html.erb error messages into a single partial
* Is there a reason why we do ```textmate_2 = FactoryGirl.create(:project, name: "TextMate 2")``` etc... rather than let!?

#### PDF Page 179
* requiring the button to say "Update Profile" may be a little too hard for new users given the partial already specifies <%= f.submit "Sign up" %>
 * Personal opinion is that I think most new users would solve this problem by duplicating the code already in the _form partial.
 * recommended approach, just use <%= f.submit %> in the partial and modify the sign_up spec and the profile spec to use "Create User" and "Update User"
 * fwiw I solved it like this:

 ```ruby
 #users_helper.rb
  def text_for_submit_button
    if params[:action] == ("edit" || "update")
      "Update Profile"
    else
      "Sign up"
    end
  end
 ```
 ```ruby
 # _form.html.erb
 <%= f.submit text_for_submit_button %>
 ```-->

