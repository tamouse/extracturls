#!/usr/bin/env ruby
=begin

   extracturl.rb -- ruby script to pull out URLs in an HTML document

   Yet another URL extractor, this time in ruby

   *Author*:: Tamara Temple <tamara@tamaratemple.com>
   *Copyright*:: (c) 2012 Tamara Temple Web Development
   *License*:: GPLv2+
   *Version*:: 2012-12-01

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