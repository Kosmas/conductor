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
___36 examples, 0 failures___

#### PDF Page 221
* in the spec results
___34 examples, 0 failures___
should be
___39 examples, 0 failures___

#### PDF Page 221
* in the spec results
___36 examples, 0 failures___
should be
___37 examples, 0 failures___

#### PDF Page 223
* user_signed_in? method is mentioned in the text but current_user is used in listing

#### PDF Page 223
* change to new ruby hash syntax
___:to => "base#index"___
should be
___to: "base#index"___

#### PDF Page 227
* change to new ruby hash syntax
___render :action => "new"___
should be
___render action: "new"___

#### PDF Page 228
* The error page when running the spec should not be there as the specs pass

#### PDF Page 228
* in the spec results
___37 examples, 0 failures___
should be
___38 examples, 0 failures___

#### PDF Page 230
* in the rspec results
___expected there to be content___
should be
___expected to find text___

#### PDF Page 231
* in the two paragraphs:
___what gives? ....___ and ___the answer is strong parameters___
not having the admin field in the strong parameters prevents the record from being saved, but the test will still fail as the email displayed is from the current user and not the just created one. So we would prbably do one of the following:
* remove the check for the new user email
* display the new user email in the flash message
* log out and login as the new user

#### PDF Page 232
* Typo 
___accessable___
should be
___accessible___

#### PDF Page 234
* Shouldn't it be a good idea to enclose the user model spec for email in a describe 'email' ?

#### PDF Page 236
* password_confirmation missing from the user factory

#### PDF Page 240
* the update method should be:

```ruby
def update
  if user_params[:password].blank?
    user_params.delete(:password)
    user_params.delete(:password_confirmation)
  end

  if @user.update_attributes(user_params)
    flash[:notice] = 'User has been updated.'

    redirect_to admin_users_path
  else
    flash[:alert] = 'User has not been updated.'

    render action: 'edit'
  end
end

```

#### PDF Page 242
___41 examples, 0 failures___
should be
___42 examples, 0 failures___

#### PDF Page 246
___43 examples, 0 failures___
should be
___44 examples, 0 faulures___
