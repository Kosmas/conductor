# Rails 4 in Action
The **soon to be released** [Rails 4 in Action](http://www.manning.com/bigg2/) book by [Ryan Bigg](https://twitter.com/ryanbigg), [Yehuda Katz](https://twitter.com/wycats) and [Steve Klabnik](https://twitter.com/steveklabnik) builds a ticketing/project management application in Ruby on Rails, from-the-ground-up, chapter-by-chapter.


## Issues - !!!WORK IN PROGRESS!!!
### MEAP v13


### Chapter 1 Ruby on Rails, the framework


#### PDF Page 6
* The .rvmrc has been deprecated in favour of .ruby-version and .ruby-gemse

#### PDF Page 7
* The rvm use --default 2.0.0 should be rvm use --default ruby-2.0.0
* Suggestion : Would the use or mention of rvm gemsets be useful?

```
rvm gemset create rails4_0_2
rvm gemset use rails4_0_2
gem install rails -v 4.0.2

```

### Chapter 2 Testing saves your bacon


### Chapter 3 Developing a real Rails application


#### PDF Page 69
* issues running rspec. On OS X I had to update the version of libxml installed https://gist.github.com/vparihar01/5856524

#### PDF Page 83
* Suggestion: Wouldn't it be better to run rake:db:test:clone to create the test database?

#### PDF Page 84
* Listing 3.16 missing closing p tag

#### PDF Page 91
* the error message description __expected there to be text__ should be __expected to find text__

#### PDF Page 92
* The text __is quite the interesting file__ should be __is quite an interesting file__

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


### Chapter 4 Oh CRUD!


#### PDF Page 111
* grammar: 3rd paragraph from the top
__using a gem called factory_girl, as well as a way to make a way to make
standard controllers a lot neater."__
should be
__"using a gem called factory_girl, as well as a way to make standard controllers a lot neater."__

#### PDF Page 112
* grammar: section 4.1.1 Factory girl "Factories define a bunch of default
values for an object, allowing you to easily craft example objects you can use in
your tests. you can use to run our tests on."
the last part can be ommitted: "you can use to run our tests on."

#### PDF Page 119
* code block is missing closing `<p>` tag like on page 84

#### PDF Page 123
* the error message description
__expected there to be content "Project has not been updated." in ...__
shouuld be
__expected to find text "Project has not been updated." in ...__

#### PDF Page 127
* __Done! Now you have the full support for CRUD operations in pour ProjectsController__ What does pour mean? (for?, poor?)

#### PDF Page 132
* typo: `find_project` title in Listing 4.15 should be `set_project`

#### PDF Page 133
* __You can also remove the first line of update and destroy actions as well.__ already mentioned in previous page 135


### Chapter 5 Nested Resources


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

#### PDF Page 161
* listing 5.10 `render action: 'edit'` throughout the text we've been doing `render 'edit'` for rendering a view from the controller. Please add a note indicating that this is equivalent syntax.


### Chapter 6 Authentication


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

#### PDF Page 176
* spec/features/user_profile_spec.rb makes use of a `:user` factory that has never been defined in the text

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
* Shouldn't it be a 'Sign out' section after 'Sign up' and 'Sign in' ? (NOTE: This is added in chapter 8 with the permissions index page)

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

#### PDF Page 186
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

#### PDF Page 191
* Section 6.7 listing should include two tickets instead of 1 as defined in listing 5.6

#### PDF Page 194
* the file that needs to be changed should be the deleting_tickets_spec.rb instead of editing_tickets_spec.rb
* also the listings are the wrong way. The first one is the one that should replace the second and not the other way around
* the final complete listing of the spec is different regarding the let for the ticket. The user attribute is used one step instead of the two used previously in editing.

#### PDF Page 196
__22 examples, 0 failures__
should be
__23 examples, 0 failures__


### Chapter 7 Basic Access Control


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

#### PDF Page 208
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


### Chapter 8 Fine-Grained Access


#### PDF Page 259
* There is no failure if the spec for 'displaying an error for a missing project' mentioned in page 202 is inside the 'standard users' context

#### PDF Page 262
* in the rspec results
___expected there to be content___
should be
___expected to find text___

#### PDF Page 271
* In figure 8.3 the links 'Forgot your password', 'Did not receive confirmation instructions?' and the tick box 'Remember me' have not been added previously.

#### PDF Page 273
* change hash syntax to 1.9
___:id => ticket.id, :project_id => project.id___
should be
___id: ticket.id, project_id: project.id___

#### PDF Page 277
* convert rspec expectations to new expect instead of should syntax

```ruby
response.should redirect_to(project)
message = "You cannot create tickets on this project"
flash[:alert].should eql(message)
```

should be

```ruby
expect(response).to redirect_to(project)
expect(flash[:alert]).to eql('You cannot create tickets on this project')
```

#### PDF Page 285
* in the before filters is the authorize_admin! needed as in previous pages was missing and tests run without it? We also have require_signing that is missing from listing 8.9

#### PDF Page 287
* for consistency and to be similar to previous rspecs we do not need to set the message variable, so:


```ruby
message = "You cannot delete tickets from this project."
expect(flash[:alert]).to eql(message)
```

should be:

```ruby
expect(flash[:alert]).to eql('You cannot delete tickets from this project.')
```

#### PDF Page 289, 290
* rspec link expectations
___assert_link_for "Link Name"___
should be
___expect(page).to have_link('Link Name')___

#### PDF Page 290
* the to_sym should be used as in previous code
___<% authorized?(:"create tickets", @project) do %>___
should be
___<% authorized?("create tickets".to_sym, @project) do %>___

#### PDF Page 291
* comment tag missing from permissions:
___permissions__
should be
___#permissions___

#### PDF Page 291, 292
* rspec link expectations
___assert_link_for 'Link Name'___
should be
___expect(page).to have_link('Link Name')___

#### PDF Page 293
* the <%= tag is incorrect:
___<%= authorized?("edit tickets", @project) do %>___
should be
____<% authorized?("edit tickets".to_sym, @project) do %>___

#### PDF Page 294
* rspec link expectations
___assert_link_for 'Link Name'___
should be
___expect(page).to have_link('Link Name')___

#### PDF Page 302
* new ruby hash syntax
___:method => :put___
should be
___method: :put___

#### PDF Page 302
* the checkbox tag is incorrect on the first listing (page 302) but correct on second listing (page 305):

```ruby
<%= check_box_tag "permissions[#{project.id}][#{name}]",
@ability.can?(name.to_sym, project),
@ability.can?(name.to_sym, project) %>
```

should be:

```ruby
<%= check_box_tag "permissions[#{project.id}][#{name}]",
1,
@ability.can?(name.to_sym, project) %>
```

#### PDF Page 304
* cucumber test left over?
___And I follow "Permissions"___

#### PDF Page 316
* figure 8.5 signed in as ___ticketee@example.com___ should be ___admin@example.com___ that was set in the seeds file.
* There should only be one project from the seeds file and not the second (Top secret project)


### Chapter 9 Flle uploading


#### PDF Page 323
* listing 9.3 shows a different section for created by from previous chapter and the edit and delete links are missing:

```ruby
<small>Created by <%= @ticket.user.email %></small>
<%= simple_format(@ticket.description) %>
<% if @ticket.asset.present? %>
  <h3>Attached File</h3>
  <div class="asset">
    <p>
      <%= link_to File.basename(@ticket.asset.path),@ticket.asset.url %>
    </p>
    <p>
      <small><%= number_to_human_size(@ticket.asset.size) %></small>
    </p>
  </div>
<% end %>

```
should be

```ruby
<div id="ticket">
  <h2><%= @ticket.title %></h2>
  <span id='author'>Created by <%= @ticket.user.email %></span>

  <% authorized?('edit tickets'.to_sym, @project) do %>
    <%= link_to 'Edit Ticket', [:edit, @project, @ticket] %>
  <% end %>
  <% authorized?('delete tickets', @project) do %>
    <%= link_to 'Delete Ticket', [@project, @ticket], method: :delete, data: { confirm: 'Are you sure you want to delete this ticket?' } %>
  <% end %>

  <%= simple_format(@ticket.description) %>

  <% if @ticket.asset.present? %>
    <h3>Attached File</h3>
    <div class='asset'>
      <p>
        <%= link_to File.basename(@ticket.asset.path), @ticket.asset.url %>
      </p>
      <p>
        <small><%= number_to_human_size(@ticket.asset.size) %></small>
      </p>
    </div>
  <% end %>
</div>

```

#### PDF Page 333
* cucumber test lefover?
___And I follow "New Ticket"___

#### PDF Page 334
* After creating the model the uploader should be moved from the ticket model to the asset model:

```ruby
mount_uploader :asset, AssetUploader
```

as otherwise the following error is diplayed:

```ruby
Failure/Error: click_button 'Create Ticket'
  ActiveRecord::StatementInvalid:
  TypeError: can't cast ActionDispatch::Http::UploadedFile to string: INSERT INTO "assets" ("asset", "created_at", "ticket_id", "updated_at") VALUES (?, ?, ?, ?)
  # ./app/controllers/tickets_controller.rb:17:in `create'
  # ./spec/features/creating_tickets_spec.rb:52:in `block (2 levels) in <top (required)>'
```

#### PDF Page 344
* the user is created from the seeds file and the:
___ticketee@example.com___
should be
___admin@example.com___


* the link for the file:
___http://localhost:3000/uploads/5/original/spin.txt?1282564953___
should be:
___http://localhost:3000/uploads/asset/asset/1/spin.txt___


#### PDF Page 349
* Should it be mentioned that if using Firefox the selenium-webdriver should be installed because of the following error?

```ruby
 1) Creating Tickets Creating a ticket with an attachment
     Failure/Error: sign_in_as!(@user)
     LoadError:
       Capybara's selenium driver is unable to load `selenium-webdriver`, please install the gem and add `gem 'selenium-webdriver'` to your Gemfile if you are using bundler.
     # ./spec/support/authentication_helpers.rb:3:in `sign_in_as!'
     # ./spec/features/creating_tickets_spec.rb:9:in `block (2 levels) in <top (required)>'
```

#### PDF Page 350
* current version of database cleaner is different:
___gem 'database_cleaner', '1.0.1'___
should be
___gem 'database_cleaner', '1.2.0'___

#### PDF Page 351
* cucumber test?

```ruby
And I follow "Add another file"
```

#### PDF Page 354
* ruby hash syntax:

```ruby
:child_index => number
```
should be

```ruby
child_index: number
```

#### PDF Page 363
* typo for Gemfile
___ require 'turbolinks' line from your Gemfile___
should be
__gem 'turblolinks' line from your Germfile___

<!--

### Chapter 10 Tracking State




#### PDF Page 368
* should it be a features test instead of an integrations test? Rspec does not support integration tests and the sign_in_as! does not work with integration tests.

* Listing 10.1 call to factory girl uses old syntax:
___Factory(:object)___
should be
___FactoryGirl.create(:boject)___

* on the same listing confirmed_user should be changed to user as there is no factory for confirmed_user:
___Factory(:confirmed_user)___
should be
___FactoryGirl.create(:user)___

* ruby hash syntax
___ Factory(:ticket, :project => project, :user => user) ___
should be
___ FactoryGirl.create(:ticket, project: project, user: user)___

#### PDF Page 369
* Listing 10.1 ruby hash syntax:
___fill_in "Text", :with => "Added a comment!"___
should be
___fill_in "Text", with: "Added a comment!"___

* rspec new syntax:
___page.should have_content("Comment has been created.")___
should be
___expect(page).to have_content('Comment has been created.')___

* rspec new syntax:
___page.should have_content("Added a comment!")___
should be
___expect(page).to have_content("Added a comment!")___

* rspec new syntax:
___page.should have_content("Comment has not been created.")___
should be
___expect(page).to have_content("Comment has not been created.")___

* rspec enw syntax:
___page.should have_content("Text can't be blank")___
should be
___expect(page).to have_content("Text can't be blank")___

#### PDF Page 370
* the error messages section is not correct:

```ruby
<%= f.error_messages %>
```

should be:

```ruby
  <% if @comment.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@comment.errors.count, "error") %> prohibited this comment from being saved:</h2>

      <ul>
        <% @comment.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
      </ul>
    </div>
  <% end %>
```

* typo
___Secondly, has hinted before___
should be
___Secondly, it has(was) hinted before___


#### PDF Page 371
* should the migration use the references to also create the indices and the belongs_to in the model? So:
___rails g model comment text:text ticket_id:integer user_id:integer___
should be
___rails g model comment text:text ticket:references user:references___

#### PDF Page 372
* attr_accessible is not used anymore, as we have strong parameters

#### PDF Page 373
___spec/integration/creating_comments_spec.rb___
should be
___spec/features/creating_comments_spec.rb___

#### PDF Page 374
* call to non existent method authenticate_user! ?
___before_filter :authenticate_user!___
should be
___before_filter :require_signin!___

* ruby hash syntax:
___render :template => "tickets/show" ___
should be
___render template: "tickets/show" ___

* typo ? <co tags not needed


### PDF Page 375
* integration should be features?
 ___spec/integration/creating_comments_spec.rb___
should be
___spec/features/creating_comments_spec.rb___

* Before seeing the error message for missing css there is another error:

```ruby
 1) Creating comments Creating a comment
     Failure/Error: click_button 'Create Comment'
     ActiveModel::ForbiddenAttributesError:
       ActiveModel::ForbiddenAttributesError
     # ./app/controllers/comments_controller.rb:6:in `create'
     # ./spec/features/creating_comments_spec.rb:19:in `block (2 levels) in <top (required)>'
```

since we need to add strong parameters with the comment_params method

```ruby
class CommentsController < ApplicationController
  before_filter :require_signin!
  before_filter :find_ticket

  def create
    @comment = @ticket.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = 'Comment has been created.'
      redirect_to [@ticket.project, @ticket]
    else
      flash[:alet] = 'Comment has not been created.'
      render template: 'tickets/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end

```

#### PDF Page 378
* This is where we should add the validation to the comment model as one test should be passing now and the second should be failing. so the ___validates :text, :presence => true__ that was added in page 372 should be added here as ___validates :text, presence: true___


#### PDF Page 379
* Listing 10.8, should the integration be features?
___spec/integration/creating_comments_spec.rb___
should be
___spec/features/creating_comments_spec.rb___

* missing rspec line. The first line before filling in Text should be:
___click_link ticket.title

* ruby hash syntax:
___:with => 'This ...'___
should be
___with: 'This ....'___

___:from => 'State'___
should be
___from: 'State'___

* new rspec syntax
___page.should___
should be
___expect(page).to___

#### PDF Page 380
* rspec error message
___cannot select option, no select box with id, name,or label 'State' found___
should be
___Unable to find select box "State"___

* shouldn't the select drop down box be created before creating the model? (listing 10.10)

*  cucumber step? 'I select' step

#### PDF Page 381
* the line @states = State.all should also be added to the comments_controller create method as we link states with tickets AND comments

#### PDF Page 382
* Should an index also be added for the comments in the state migrations?

#### PDF Page 385
* old factory girl call used:
___Factory(:state, :name => "Open")___
should be
___FactoryGirl.create(:state, name: 'Open')___

* wrong spec name
___spec/integration/creating_comments.rb___
should be
___spec/features/creating_comments.rb___

* wrong mass_assignment error as this has become strong parameters in Rails 4


#### PDF Page 386
* wrong attr_accessible property (see above) as this has become strong parameters in Rails 4


#### PDF Page 387, 389
* Cucumber test?
___And I should see "Open" within "#ticket .state"___

#### PDF Page 389
* old ruby has syntax
___:to => :ticket___
should be
___to: :ticket___


#### PDF Page 390
* Cucumber test?
___Given there is a state called...”___

#### PDF Page 391
* integration should be features in the Lisitng 10.14 title
* page.should uses the old rspec syntax it should be expect(page).to
* typo
___Uou're confirming___
should be
___You're confirming___
* Cucmber test 'Then I should see'
-->
