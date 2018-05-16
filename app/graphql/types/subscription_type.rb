Types::SubscriptionType = GraphQL::ObjectType.define do
  name "Subscription"
  field :messageWasAdded, !Types::MessageType
end
