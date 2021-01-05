module Types
  module Input
    class MovieInputType < Types::BaseInputObject
      argument :name, String, required: true
      argument :release_date, String, required: true
      argument :is_featured, Boolean, required: false
      argument :number_of_downloads, Int, required: false
      argument :synopsis, String, required: true
      argument :languages, String, required: true
    end
  end
end
