class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  # before_action :authenticate!

  exceptions = [
    ActiveRecord::RecordInvalid,
    ActiveRecord::RecordNotFound
  ]

  rescue_from(*exceptions) do |exception|
    error, status = mapped_errors(exception)
    render(
      json: error,
      status:
    )
  end

  private

  def authenticate!
    # auth = authenticate_with_http_basic do |name, email|
    #   user = User.find_by(name:, email:)
    #   user.name == name && user.email == email
    # end
    #
    # return if auth
    #
    # request_http_basic_authentication
    true
  end

  def render(*args)
    options = args.extract_options!
    options[:json] = options[:json].to_json
    args << options
    super(*args)
  end

  def mapped_errors(exception)
    errors = (exception&.record&.errors || []).map do |error|
      {
        field: error.attribute,
        message: error.message
      }
    end

    case exception
    when ActiveRecord::RecordInvalid
      [
        {
          code: 'UNPROCESSABLE_ENTITY',
          message: 'The request was well-formed but was unable to be followed due to semantic errors.',
          errors:
        },
        422
      ]
    when ActiveRecord::RecordNotFound
      [
        {
          code: 'NOT_FOUND',
          message: 'The requested resource could not be found',
          errors:
        },
        404
      ]
    else
      [
        {
          code: 'INTERNAL_SERVER_ERROR',
          message: 'Internal Server Error.',
          errors: []
        },
        500
      ]
    end
  end
end
