private

  def interpolation_options
    options = {}
    options[:resource_errors] =
    if resource && resource.errors.any?
      "#{resource.errors.full_messages.to_sentence}."
    else
      ""
    end

    options
  end