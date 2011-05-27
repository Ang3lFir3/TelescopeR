require 'rubygems'
require 'Httparty'

result = HTTParty.get('http://github.com/api/v2/json/repos/search/' + ARGV[0])
result["repositories"].each do |x|
 puts x["url"]
end