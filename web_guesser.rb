require 'sinatra'
require 'sinatra/reloader'
	
num = rand(0..100)

get '/' do 
	"The secret number is #{num} yupp"
end