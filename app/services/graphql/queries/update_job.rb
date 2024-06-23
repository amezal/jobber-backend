# frozen_string_literal: true

module Graphql
  module Queries
    module UpdateJob
      def update_variables
        {
          jobId: params[:id],
          input: {
            title: params[:title],
            instructions: params[:instructions],
          },
        }
      end

      UpdateJobQuery = JobberAppTemplateRailsApi::Client.parse(<<~'GRAPHQL')
        mutation(
          $jobId: EncodedId!,
          $input: JobEditInput!,
        ) {
          jobEdit(jobId: $jobId, input: $input) {
            job {
              id
            }
          }
        }
      GRAPHQL
    end
  end
end
