class Movie < Sequel::Model(:movies)
  plugin :validation_helpers

  one_to_many :reservations

  def validate
    super
    validates_presence [:name, :image_url, :presented_on]
  end
end
