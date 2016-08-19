RSpec.describe MoviesController, type: :controller do
	describe "GET #index" do
      movie_param = { title: 'Spider Man222', description: 'testing description.', rating: 'PG-13', total_gross: 23333 }

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
      movie1 = Movie.create!(:title=>"spider man", :description=>"test vv")
      movie2 = Movie.create!(:title=>"Iron Man", :description=>"test aaa")
      get :index

      expect(assigns(:movies)).to match_array([movie1, movie2])
    end

    # test redirect
    it "responds successfully with an HTTP 302 status code" do
      post :create, movie: movie_param
      expect(response).to have_http_status(302)
    end


end
end
