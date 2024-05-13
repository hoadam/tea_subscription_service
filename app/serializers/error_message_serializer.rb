class ErrorMessageSerializer
  def initialize(error_object)
    @error_object = error_object
  end

  def serializer_json
    {
      errors: [
        {
          status: @error_object.status_code.to_s,
          title: @error_object.message
        }
      ]
    }
  end
end
