GraphqlSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)
  subscription(Types::SubscriptionType)

  resolve_type ->(type, obj, ctx) {}
end
