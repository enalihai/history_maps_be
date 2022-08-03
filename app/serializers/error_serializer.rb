class ErrorSerializer
  def self.show_errors
    {
      errors: [
        {
          id: "nil_results",
          no_results: "Search return nil results"
        }
      ]
    }
  end
end
