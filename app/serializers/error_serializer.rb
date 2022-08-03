class ErrorSerializer
  def self.show_errors
    {
      errors: [
        {
          id: "unknown_error",
          no_results: "an error ocurred please forgive us"
        }
      ]
    }
  end
end
