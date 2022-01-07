class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get "/" do
    arr = ["e", "a"]
    "Welcome to the Se#{arr.sample}n project!"
  end

  get "/all" do
    h = Household.all.to_json
    u = User.all.to_json
    p = Pet.all.to_json
    t = Task.all.to_json
    [h, u, p, t] # < not json format
  end

end
