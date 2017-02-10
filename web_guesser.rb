require 'sinatra'
require 'sinatra/reloader'

@@num = rand(0..100)
@@guesses_remaining = 5


get '/' do 
	if !params['guess'].nil?
		guess = params['guess'].to_i
		arr = check_guess(guess)
		message = arr[0]
		background = arr[1]
	end
	erb :index, :locals => {:num => @@num, 
		:message => message, :background => background}
	#throw params.inspect
end

def check_guess(guess)
	if guess ==@@num
		message = "You got it right!"
		background = "background: green"
		message = "You WON! A new number has been generated."
		@@num = rand(0..100)
		@@guesses_remaining = 5
		return [message,background]
	elsif guess-@@num > 5
		message = "Way too high!"
		background = "background: red"
	elsif guess-@@num < -5
				puts guess
		message = "Way too low!"
		background = "background: red"
	elsif guess-@@num >0
		message = "Too high!"
		background = "background: pink"
	elsif guess-@@num <0
		message = "Too low!"
		background = "background: pink"
	else
		message = ""
		background = ""
	end
	@@guesses_remaining -= 1

	if @@guesses_remaining == 0
		message = "You lost! A new number has been generated."
		@@num = rand(0..100)
		@@guesses_remaining = 5
	end

	[message,background]
end

