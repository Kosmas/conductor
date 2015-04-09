# Rails 4 in Action
The **soon to be released** [Rails 4 in Action](http://www.manning.com/bigg2/) book by [Ryan Bigg](https://twitter.com/ryanbigg), [Yehuda Katz](https://twitter.com/wycats) and [Steve Klabnik](https://twitter.com/steveklabnik) builds a ticketing/project management application in Ruby on Rails, from-the-ground-up, chapter-by-chapter.


## Issues - !!!WORK IN PROGRESS!!!
### MEAP v20


### Chapter 3 Developing a real Rails application

#### PDF Page 58
* The links for the github repository are not there (404) errors. Should it be: https://github.com/steveklabnik/ticketee

#### PDF Page 61
* rspec-rails is on version 3.2.1 currently

#### PDF Page 66
* Listing 3.8 should have require 'spec_helper', and feature instead of RSpec.feature if used with rspec-rails 3.2.x

#### PDF Page 67
* Should the routing be: root 'projects#index' with single quotes as there is no interpolation.


### Chapter 4 Oh CRUD!

#### PDF Page 110
* Listing 4.3 is the class 'new' defined?

#### PDF Page 126
* Listing 4.16 has old hash Ruby syntax. Should be: type: :controller do.
* Is the type needed for rspec 3.x ?


### Chapter 5 Nested Resources

#### PDF Page 171
* When running the test after creating the ticket factory the error is:
```
   Failure/Error: FactoryGirl.create(:ticket,
     NoMethodError:
       undefined method `project=' for #<Ticket:0x000000032d5200>
```
since there is not yet the relationhip of ticket to project (belongs_to)


### Chapter 6 Authentication

#### PDF Page 200
* The scenario title is defined differently previously. So here it it is 'Creating a ticket' but previoulsy is defined as 'with valid attributes'

#### PDF Page 201
* Closing tag %> missing from code listing for author id


### Chapter 7 Basic Access Control

#### PDF Page 235
* Listing 7.21 should be <div class='page-header'> instead of <header>

#### PDF Page 236
* <header> should be <div class='page-header'> in new.html.erb

#### PDF Page 243
* <header> should be <div class="page-header"> in show.html.erb

<!--

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


### Chapter 10 Tracking State


#### PDF Page 371
* typo
___Secondly, has hinted before___
should be
___Secondly, it has(was) hinted before___

#### PDF Page 375, 376
* typo ? <co tags not needed

#### PDF Page 378
* This is where we should add the validation to the comment model as one test should be passing now and the second should be failing. so the ___validates :text, :presence => true__ that was added in page 372 should be added here as ___validates :text, presence: true___

#### PDF Page 380
* typo <co tag is not needed
* Suggestion: should we have a blank line before the first expect(page) to separate actioons from expectations as done previously?
* rspec error:
__:from => "State"__
should be
__from: "State"__
*  cucumber step? 'I select' step

#### PDF Page 381
* shouldn't the select drop down box be created before creating the model? (listing 10.10)

#### PDF Page 382
* the line @states = State.all should also be added to the comments_controller create method as we link states with tickets AND comments

#### PDF Page 383
* Should an index also be added for the comments in the state migrations?

#### PDF Page 384
* type <co tags not needed (listing 10.10)

#### PDF Page 385
* rspec error
__cannot select option, no option with text__
should be
__Unable to find option "Open"__

#### PDF Page 387
* rspec error
__expected to find text "Open" in ""__
should be
__Unable to find css "#ticket .state"__

-->

<!--


#### PDF Page 385
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
