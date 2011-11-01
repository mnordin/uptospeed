# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Color.create(:hex => "transparent", :color => "none")
Color.create(:hex => "#f52a2a", :color => "red")
Color.create(:hex => "#ffb545", :color => "orange")
Color.create(:hex => "#fce917", :color => "yellow")
Color.create(:hex => "#91f016", :color => "lime")
Color.create(:hex => "#04c71b", :color => "green")
Color.create(:hex => "#42bdff", :color => "light_blue")
Color.create(:hex => "#1842d9", :color => "blue")
Color.create(:hex => "#e61ebe", :color => "purple")