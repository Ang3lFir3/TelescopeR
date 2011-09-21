require 'rubygems'
require 'Httparty'

def repos(repo)
	result = HTTParty.get('http://github.com/api/v2/json/repos/search/' + repo)
	result["repositories"].each do |x|
		puts x["url"]
	end
end

def user_repos(repoUser)
	pretty_print_results('https://api.github.com/users/' + repoUser + '/repos', {:ssh => "ssh_url", :clone => "clone_url"})
end

def user_gists(gistUser)
	pretty_print_results('https://api.github.com/users/' + gistUser + '/gists', {:description => "description", :pull_url => "git_pull_url"})
end

def pretty_print_results(uri, fields)
	result = HTTParty.get(uri)
	result.each do |x|
		fields.each do |y|
			puts y[0].to_s + ": " + x[y[1]].to_s
		end
		puts '----------------------------------------------------'
	end
end

fn = {:repos => repos(ARGV[1]), :urepos => user_repos(ARGV[1]), :ugists => user_gists(ARGV[1])}

fn[ARGV[0]]

