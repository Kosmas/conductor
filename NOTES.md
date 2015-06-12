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



### Chapter 10 Tracking State

#### PDF Page 369
* foreign_key: true is missing from both the t.references
* Should the
```ruby
  add_foreign_key :comments, :users, column: :author_id
```
be replaced with:
```ruby
  t.references :author, index: true, primary_key: :user, foreign_key: true
```

#### PDF Page 373
* FactoryGirl use without brackets

#### PDF Page 380, 381
* have_heading use without brackets

#### PDF Page 382
* Shouldn't the bin/rspec be bin/rspec spec/features/hidden_links_spec.rb ?

#### PDF Page 383
* figure ?? should be 10.4

#### PDF Page 390
* listing 10.19

#### PDF Page 390
* There is no table listing the ticket attributes so adding the state should go below the author and the time, and maybe a table should be created? Or a div?

#### PDF Page 398
* In rails 4.2.1 the migration should be: add_reference :comments, :previous_state, index: true, foreign_key: true

#### PDF Page 402
* Look at figure ???  should be 10.11.

#### PDF Page 413
* FactoryGirl use without brackets

#### PDF Page 415
* the name of the rspec file 'spec/fatures/managing_states_spec.rb' should be 'spec/features/admin/mananging_states_spec.rb'

#### PDF Page 418
* FactoryGirl use without brackets
* Shouldn't the test for the state also be checked in the 'with an attachment' and 'mutliple attachments' tests?

#### PDF Page 424
* figure missing ? should be 10.15

#### PDF Page 425
* Figure missing ? should be 10.16

### PDF Page 428
* Previously we have added Warden::TestHelpers. Can this one be the same?
