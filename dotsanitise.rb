#!/usr/bin/env ruby

if ARGV.size != 2 then
    puts "USAGE: #{$0} <input.dot> <output.dot>"
    exit 1
end

input = File.read(ARGV[0])
output = File.open(ARGV[1], 'w')

input.each do |line|
    quotes = line.scan(/"/)
    if quotes.size > 2 then
        # sub all " with \"
        subbed = line.gsub(/"/, '\"')
        # sub only first \" with "
        subbed = subbed.sub(/\\"/, '"')
        # sub only final \" with "
        subbed = subbed.sub(/(.*)\\"/, '\1"')
        output.write(subbed)
    else
        output.write(line)
    end
end

output.close
