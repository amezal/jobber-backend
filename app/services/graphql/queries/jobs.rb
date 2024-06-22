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
          sort: { key: "JOB_NUMBER", direction: "ASCENDING" },
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
          $sort: [JobsSortInput!]
        ) {
          jobs(first: $limit, after: $cursor, filter: $filter, sort: $sort) {
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
