class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # get '/' do
  #   "Hello World"
  # end
  
  get '/messages' do
    message = Message.all.order(:created_at)
    message.to_json
  end

  post '/messages' do
    message = Message.create(
      username: params[:username],
      body: params[:body]
    )
    message.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(
      body: params[:body]
    )
    message.to_json
  end

  delete '/messages/:id' do
    deleted_message = Message.find(params[:id])
    deleted_message.destroy
    deleted_message.to_json
  end
  
end
