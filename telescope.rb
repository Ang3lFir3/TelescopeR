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

fn = {:repos => repos(ARGV[1]), :user_repos => user_repos(ARGV[1]) }

fn[ARGV[0]]

