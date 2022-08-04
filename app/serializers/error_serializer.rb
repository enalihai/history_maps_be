class ErrorSerializer
  def self.show_errors
    {
      errors: [
        {
          id: "nil_results",
          no_results: "Search returns some type of nil results"
        }
      ]
    }
  end
end
