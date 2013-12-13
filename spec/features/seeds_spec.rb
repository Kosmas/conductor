require 'spec_helper'

feature 'Seed Data' do
  scenario 'The basics' do
    load Rails.root + 'db/seeds.rb'
    user = User.where(email: 'admin@example.com').first!
    project = Project.where(name: 'Conductor Beta').first!
  end
end
