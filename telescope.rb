require 'rubygems'
require 'Httparty'

@base_url_v3 = 'https://api.github.com/users/'
@base_url_v2 = 'http://github.com/api/v2/json/repos/'

def repos(repo)
	pretty_print_results( @base_url_v2 + 'search/' + repo.to_s , {:url => "url"}, "repositories" )
end

def user_repos(repoUser)
	pretty_print_results( @base_url_v3 + repoUser + '/repos', {:ssh => "ssh_url", :clone => "clone_url"}, nil)
end

def user_gists(gistUser)
	pretty_print_results( @base_url_v3 + gistUser + '/gists', {:description => "description", :pull_url => "git_pull_url"}, nil)
end

def pretty_print_results(uri, fields, rootNode)
	result = HTTParty.get(uri)
	puts rootNode
	if rootNode != nil
		result = result[rootNode]	
	end

	result.each do |x|
		fields.each do |y|
			puts y[0].to_s + ": " + x[y[1]].to_s
		end
		puts '----------------------------------------------------'
	end
end

method(ARGV[0]).call(ARGV[1])

