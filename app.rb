require "sinatra"
require "sinatra/reloader"

get "/" do 

	ori = params["ori"]
	shift = params["shift"]
	@secret = caesar_cipher(ori,shift.to_i) if ori || shift
	
	erb :main
end

def caesar_cipher(text,num)
  arr  = text.split('')
  for i in arr do
    next if i =~ /[^\w]/
    num.times do
      i.next!
    end
  end
  return arr.join
end