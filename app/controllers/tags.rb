get '/tags' do
	tag = Tag.first(:text => params[:search_tags])
	@links = tag ? tag.links : []
	erb :index
end