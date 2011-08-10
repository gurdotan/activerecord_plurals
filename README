# Activerecord Plurals

## Installation
`rails plugin install git://github.com/gurdotan/activerecord_plurals.git`

## Usage
A simple rails plugin for batch-retrieving specific fields of activerecord models.
For example, assume we have a table of animals, assocsiated to the `Animal` ActiveRecord model.  So we can do the following:

    >> Animal.names
    => ["Horse", "Cat", "Dog", "Chimpanzee", "Snake"]

    >> Animal.ids
    => [1, 2, 3, 4, 5]

    >> Animal.where(:type => "domestic").names
    => ["Cat", "Dog"]

So in fact this plugin supplies you with plural methods for all activerecord fields.  That includes `ids`, `created_ats` and `updated_ats`

### Known Issues
 * If you have an activerecord model with a field who's plural form collides with an already exsiting method (say 'entry' collides with `Object#entries`), you won't be able to invoke a plural method, the original method will be called.
 * `ActiveRecord::Base#respond_to` doesn't acknowledge the plural methods.

These issues will be fixed in the next release.


### Testing Notes
 * The tests are written in rspec and make use of a private SQLite3 DB file.  This is why you will need to run `bundle install` in order to run the tests.  Bundler will install the sqlite3-ruby gem which is a dependency of the tests.
 * To run the tests from Rails root:  rspec vendor/plugins/activerecord_plurals/spec/activerecord_plurals_spec.rb
 * Tested only on Rails 3.

Knock yourselves out!

Copyright (c) 2011 Gur Dotan, released under the MIT license.
