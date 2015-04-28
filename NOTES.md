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



### Chapter 8 Fine-Grained Access


#### PDF Page 255
* In rails 4.2.1 the foreign key is automatically added to the migration like:
```ruby
  t.references :user, index: true, foreign_key: true
```

#### PDF Page 259
* The name of the policy test file should be project_policy_spec.rb and NOT post_policy_spec.rb
* The calls to the FactoryGirl are without brackets where before brackets were used

#### PDF Page 260
* PostPolicy references should be ProjectPolicy

#### PDF Page 266
* FactoryGirl.create use without brackets.

#### PDF Page 269
* FactoryGirl.create use without brackets.

#### PDF Page 272
* FactoryGirl.create use without brackets.

#### PDF Page 275
* have_link without brackets

#### PDF Page 279
* FactoryGirl.create use without brackets

#### PDF Page 282
* Including require 'rspec/rails' in the spec_helper solves the problem described in the NOTE.

#### PDF Page 288
* have_link use without brackets

#### PDF Page 295
* have_link use without brackets

#### PDF Page 299
* have_link use without brackets

#### PDF Page 301
* Below listing 8.43 verify_authorize should be verify_autorized



### Chapter 9 Flle uploading

#### PDF Page 332
* Lines for multiple attachment spec should be 69-86 instead of 45-62 ? so to run the spec should be :69

#### PDF Page 338
* The changes to the creating_tickets_spec.rb for the Tickt #1 and .assets should also be made to the 'with an attachment' spec

#### PDF Page 340
* FactoryGirl use without brackets

#### PDF Page 342
* FactoryGirl use without brackets

#### PDF Page 348
* After removing the public/uploads from .gitignore we should delete the publi/uploads directory - rm -rf public/uploads


<!--
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
