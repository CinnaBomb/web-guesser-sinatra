require 'sinatra'
require 'sinatra/reloader'

NUM = rand(0..100)



get '/' do 

	guess = params['guess'].to_i
	message = check_guess(guess)[0]
	background = check_guess(guess)[1]
	erb :index, :locals => {:num => NUM, 
		:message => message, :background => background}
	#throw params.inspect
end

def check_guess(guess)
	#puts guess-NUM
	if guess ==NUM
		message = "You got it right!"
		background = "background: green"
	elsif guess-NUM > 5
		message = "Way too high!"
		background = "background: red"
	elsif guess-NUM < -5
		message = "Way too low!"
		background = "background: red"
	elsif guess-NUM >0
		message = "Too high!"
		background = "background: pink"
	elsif guess-NUM <0
		message = "Too low!"
		background = "background: pink"
	end
	[message,background]
end

