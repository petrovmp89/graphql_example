GraphqlSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)

  resolve_type ->(type, obj, ctx) {}
end
