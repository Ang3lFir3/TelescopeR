require 'rubygems'
require 'Httparty'

def repos(repo)
	result = HTTParty.get('http://github.com/api/v2/json/repos/search/' + repo)
	result["repositories"].each do |x|
		puts x["url"]
	end
end

def user_repos(user)
	result = HTTParty.get('https://api.github.com/users/' + user + '/repos')
	result.each do |x|
		puts "ssh: " + x["ssh_url"] 
		puts "clone: " + x["clone_url"]
		puts '----------------------------------------------------'
	end
end

case ARGV[0]
when "repos" then repos ARGV[1]
when "user_repos" then user_repos ARGV[1]
else puts "you can't just ask a genie to be awesome"
end

