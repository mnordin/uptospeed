# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


# ------------ OFFICES ------------

#sweden
Office.create(:title => "stockholm", :lat => "59.31399270000001", :lng => "18.0569371")
Office.create(:title => "gothenburg", :lat => "57.7049839", :lng => "11.9665058")
Office.create(:title => "malmoe", :lat => "55.6097999", :lng => "12.9789877")

#norway
Office.create(:title => "oslo", :lat => "59.9151187", :lng => "10.7589839")

#finland
Office.create(:title => "helsinki", :lat => "60.1659347", :lng => "24.9458518")

#denmark
Office.create(:title => "copenhagen", :lat => "55.6773034", :lng => "12.5905514")

#uk
Office.create(:title => "london", :lat => "51.5155983", :lng => "-0.104606")

#singapore
Office.create(:title => "singapore", :lat => "1.288985", :lng => "103.848418")