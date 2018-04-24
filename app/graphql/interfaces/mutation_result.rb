Interfaces::MutationResult = GraphQL::InterfaceType.define do
  name "MutationResult"
  field :success, !types.Boolean
  field :notice, types.String
  field :errors, types.String
end
