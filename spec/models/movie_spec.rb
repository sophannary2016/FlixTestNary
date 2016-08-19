require "rails_helper"

describe Movie do 

 	it "is valid with valid attributes" do
	    subject.title = "Anything"
	    subject.description = "Anything"
	    expect(subject).to be_valid
  	end

	it "is not valid without a title" do
		subject.title = nil
	    expect(subject).to_not be_valid
	end

	it "is not valid without a description" do
	    subject.description = nil
	    expect(subject).to_not be_valid
	end

	it "should has title Spider man" do
		movie = Movie.create(:title => "Spider man")
		movie.title.should =="Spider man"
	end

	it "is a flop if the total gross is less than $50M" do
    	movie = Movie.new(total_gross: 40000000)
    	expect(movie).to be_flop
  	end
  
  	#test flop method
  	it "is not a flop if the total gross is greater than $50M" do
    	movie = Movie.new(total_gross: 60000000)
    	expect(movie).not_to be_flop
  	end

  	#test association
  	describe "Associations" do
	  	it "should have many reviews" do
			t = Movie.reflect_on_association(:reviews)
			t.macro.should == :has_many
	  	end
	end

	context "with 2 or more reviews" do
	    it "orders them in reverse chronologically" do
	      movie = Movie.create!(:title=>"Super man",:description=>"test")

	      review1 = movie.reviews.create!(:comment => "first comment")
	      review2 = movie.reviews.create!(:comment => "second comment")
	      expect(movie.reviews.count).to eq 2
	    end
  	end

end