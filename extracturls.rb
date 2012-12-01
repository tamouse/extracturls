#!/usr/bin/env ruby
=begin

   Yet another URL extractor

=end

require 'nokogiri'
require 'open-uri'

def extract (doc)
	doc.search("a").each do |a|
		puts a.attribute('href')
	end
	doc.search("img").each do |i|
		puts i.attribute('src')
	end
end

##
# MAIN
##
if ARGV.count > 0
	ARGV.each  do |fn| 
		f=File.open(fn)
		doc = Nokogiri::HTML(f)
		f.close
		extract(doc)
	end
else
	doc = Nokogiri::HTML(STDIN)
	extract(doc)
end