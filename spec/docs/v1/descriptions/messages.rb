module Docs
  module V1
    module Messages
      extend Dox::DSL::Syntax

      document :api do
        resource 'Messages' do
          endpoint '/messages'
          group 'Messages'
        end
      end

      document :show do
        action 'Get a message'
      end

      document :create do
        action 'Create a message'
      end
    end
  end
end
