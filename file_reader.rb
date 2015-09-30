require 'rubygems'
require 'csv'

out_file = File.new('new_subcategory.csv', 'w')
i=1
# CSV.foreach ARGV[0], :headers => true do |row|
CSV.foreach ARGV[0] do |row|
  hash = Hash[i, row]
  print hash
  out_file.puts(hash.to_s.delete('{"}[]').gsub!('=>',';'))
  i+=1
end
out_file.close

puts "\nDone."