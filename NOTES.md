# Rails 4 in Action
The **soon to be released** [Rails 4 in Action](http://www.manning.com/bigg2/) book by [Ryan Bigg](https://twitter.com/ryanbigg), [Yehuda Katz](https://twitter.com/wycats) and [Steve Klabnik](https://twitter.com/steveklabnik) builds a ticketing/project management application in Ruby on Rails, from-the-ground-up, chapter-by-chapter. This repository is not my original work, but rather, me working through the pre-release version of the book. Suggestions and issues with the pre-release noted below.

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

#### PDF Page 28
* Rails 4 generates code using `update` the text on this page references `update_attributes` which doesn't exist anymore.

#### PDF Page 40
* Running the given code provides a different error 

> .rvm/gems/ruby-2.0.0-p0/gems/minitest-4.7.5/lib/minitest/unit.rb:19:in 'const_missing': uninitialized
> constant MiniTest::Test (NameError)
>	from bacon_test.rb:3:in `<main>'

This is because most users at this point will have minitest 4.7.5 installed. There should be an instruction to run `sudo gem install minitest` in order to install 5.x. Afterwards it works as expected in the text.

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

#### PDF Page 111
* grammar: 3rd paragraph from the top "using a gem called factory_girl, as well as a way to make a way to make
standard controllers a lot neater." -> "using a gem called factory_girl, as well as a way to make standard controllers a lot neater."

#### PDF Page 112
* grammar: section 4.1.1 Factory girl "Factories define a bunch of default
values for an object, allowing you to easily craft example objects you can use in
your tests. you can use to run our tests on." wut?

#### PDF Page 119
* code block is missing closing `<p>` tag like on page 84

#### PDF Page 123
* the error message description
__expected there to be content "Project has not been updated." in ...__
shouuld be
__expected to find text "Projects has not been updated." in ...__
* listing 4.11 line `render "edit"` does not work for me. `render edit_project_path` does work. And I believe is correct.

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
_can't activate bcrypt-ruby (~> 3.1.2), already activated bcrypt-ruby-3.0.1. Make sure all dependencies are 
