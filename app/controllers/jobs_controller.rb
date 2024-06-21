# frozen_string_literal: true

class JobsController < ApplicationController
  include Graphql::Queries::Jobs

  def index
    token = @jobber_account.jobber_access_token
    jobs = JobberService.new.execute_paginated_query(token, JobsQuery, variables, ["jobs"])

    render(json: { jobs: jobs }, status: :ok)
  rescue Exceptions::GraphQLQueryError => error
    render(json: { message: "#{error.class}: #{error.message}" }, status: :internal_server_error)
  end
end
