require 'sinatra'
require 'sinatra/reloader'
get "/hello/:name" do
	params[:name]
end
get "/form" do
	erb :forms
end
get "/secret" do  
  erb :secrets  
end  
post '/secret' do  
  params[:secret].reverse  
end  
get '/decrypt/:secret' do  
  params[:secret].reverse  
end 
post '/form' do  
  "You said '#{params[:message]}'"  
end  
get "/" do
	"Hello, world"
end
get "/more/*" do
	params[:splat]
end	

get '/about' do
	my name is marianne
end
get '/time&&date' do
time1 = Time.now
"Current Time and Date : " + time1.inspect
end
not_found do  
  halt 404, 'page not found'  
end  