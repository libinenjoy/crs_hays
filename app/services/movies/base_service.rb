module Movies
  class BaseService < ::BaseService

    attr_accessor :params

    def initialize(params={})
      @params = params.dup
    end
  end
end
