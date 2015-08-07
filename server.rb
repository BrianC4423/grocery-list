require "sinatra"

get '/' do
  redirect '/grocery_list'
end

get '/grocery_list' do
  list_item = File.readlines("grocery_list.txt")
  erb :groceries, local: { list_item: list_item }
end

post '/grocery_list' do
  item = params["item_added"]
    unless item.empty?
  File.open("grocery_list.txt", "a") do |f|
      f.write("#{item}\n")
    end
  end
    redirect "/grocery_list"
end
