#!/usr/bin/env ruby

require 'fileutils'

MOUNTPOINT = ARGV[0] + '/'
ORIGIN_PATH = FileUtils.pwd

Dir.chdir(MOUNTPOINT)
folder = Dir.new(MOUNTPOINT).children[0]

saved_path = ARGV[0]

# Browse the file tree and save the path while browsing
until Dir.new('./').children.empty?
  saved_path += "/#{folder}"
  Dir.chdir folder
  folder = Dir.new('./').children[0]
end

# Remove the mountpoint prefix from the saved path
saved_path.slice!(MOUNTPOINT)

# Extract each folder as an hexadecimal character
cleartext = saved_path.split('/').map{|i| i.to_i.chr}.join
# Extract flag from the text
flag = /(sigsegv{.+})/.match(cleartext).captures[0]
puts flag