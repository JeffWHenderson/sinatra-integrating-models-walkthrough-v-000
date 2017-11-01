require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'
#require_relative "models/textanalyzer.rb"

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]

    @analyzed_text = TextAnalyzer.new(text_from_user)
    @c = @analyzed_text.count_of_words
    erb :results
  end
end
