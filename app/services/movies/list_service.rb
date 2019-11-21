module Movies
  class ListService < Movies::BaseService
    include DateHelper

    def execute!
      @movies = Movie.where(presented_on: Chronic.parse("this week #{@params[:presented_day]} 00:00"))
      if !@movies.empty?
        to_api
      else
        "No records found!".to_json
      end
    end

    def to_api
      @movies.map do |m|
        {
            id: m.id,
            name: m.name,
            description: m.description,
            image_url: m.image_url,
            presented_on: format_date(m.presented_on.to_s)
        }
      end.to_json
    end
  end
end
