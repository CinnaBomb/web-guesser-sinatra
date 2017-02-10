require 'sinatra'
require 'sinatra/reloader'

NUM = rand(0..100)



get '/' do 

	guess = params['guess'].to_i
	message = check_guess(guess)
	erb :index, :locals => {:num => NUM, 
		:message => message}
	#throw params.inspect
end

def check_guess(guess)
	#puts guess-NUM
	if guess ==NUM
		message = "You got it right!"
	elsif guess-NUM > 5
		message = "Way too high!"
	elsif guess-NUM < -5
		message = "Way too low!"
	elsif guess-NUM >0
		message = "Too high!"
	elsif guess-NUM <0
		message = "Too low!"
	end
	message
end

