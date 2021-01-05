module Types
  module Input
    class MovieSearchType < Types::BaseInputObject
      argument :year, String, required: false, default_value: nil
      argument :language, String, required: false, default_value: nil
      argument :quality, String, required: false, default_value: nil
      argument :genre, String, required: false, default_value: nil
      argument :rating, String, required: false, default_value: nil
      argument :title, String, required: false, default_value: nil
      argument :order_by, String, required: false, default_value: "created_at desc"
    end
  end
end
