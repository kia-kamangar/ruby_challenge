# frozen_string_literal: true

require 'csv'
require 'date'
require './lib/combiner'
require './lib/string'
require './lib/float'
require './lib/modifier_class'

def latest(name)
  files = Dir["*#{name}*.txt"]

  files.sort_by! do |file|
    last_date = /\d+-\d+-\d+_[[:alpha:]]+\.txt$/.match file
    last_date = last_date.to_s.match(/\d+-\d+-\d+/)

    date = DateTime.parse(last_date.to_s)
    date
  end

  throw RuntimeError if files.empty?

  files.last
end

modified = input = latest('project_2012-07-27_2012-10-10_performancedata')
modification_factor = 1
cancellaction_factor = 0.4
modifier = Modifier.new(modification_factor, cancellaction_factor)
modifier.modify(modified, input)

puts 'DONE modifying'
