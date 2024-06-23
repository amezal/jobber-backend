# frozen_string_literal: true

module Exceptions
  class GraphQLQueryError < StandardError; end

  class AuthorizationException < StandardError
    def initialize(message = nil)
      super(message || "Unauthorized")
    end
  end

  class JobberAccountBlank < StandardError
    def initialize(message = nil)
      super(message || "Jobber Account is blank")
    end
  end

  class JobberAccountIdBlank < StandardError
    def initialize(message = nil)
      super(message || "Jobber Account ID is blank")
    end
  end
end
