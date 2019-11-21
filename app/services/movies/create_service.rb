module Movies
  class CreateService < Movies::BaseService

    def execute!
      movie = Movie.new(@params)
      if movie.valid?
        movie.save
        success("Movie Created Successfully", 201)
      else
        error(movie.errors.full_messages, 400)
      end
    end
  end
end
