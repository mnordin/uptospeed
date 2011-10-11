# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Color.create(:hex => nil, :color => "Ingen färg")
Color.create(:hex => "f52a2a", :color => "Röd")
Color.create(:hex => "ffb545", :color => "Orange")
Color.create(:hex => "fce917", :color => "Gul")
Color.create(:hex => "91f016", :color => "Lime")
Color.create(:hex => "04c71b", :color => "Grön")
Color.create(:hex => "42bdff", :color => "Ljusblå")
Color.create(:hex => "1842d9", :color => "Blå")
Color.create(:hex => "e61ebe", :color => "Lila")