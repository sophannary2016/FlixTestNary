

describe MoviesController do 
	describe "GET #index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the movies into @movies" do
      movie1, movie2 = Movie.create!, Movie.create!
      get :index

      expect(assigns(:movies)).to match_array([movie1, movie2])
    end

end
end
