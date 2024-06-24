# frozen_string_literal: true

module Graphql
  module Queries
    module Jobs
      JOBS_LIMIT = 50

      def variables
        {
          limit: JOBS_LIMIT,
          cursor: nil,
          filter: nil,
        }
      end

      JobsQuery = JobberAppTemplateRailsApi::Client.parse(<<~'GRAPHQL')
        fragment PageInfoFragment on PageInfo {
          endCursor
          hasNextPage
        }
        query(
          $limit: Int,
          $cursor: String,
          $filter: JobFilterAttributes,
        ) {
          jobs(first: $limit, after: $cursor, filter: $filter, sort: {key: JOB_NUMBER, direction: DESCENDING}) {
            nodes {
              id
              title
              client {
                name
              }
              startAt
              endAt
              jobNumber
            }
            pageInfo {
              ...PageInfoFragment
            }
          }
        }
      GRAPHQL
    end
  end
end
