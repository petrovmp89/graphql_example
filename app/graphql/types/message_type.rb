Types::MessageType = GraphQL::ObjectType.define do
  name "Message"
  interfaces [Interfaces::ActiveRecordInterface]
  field :text, types.String
  field :id, types.Int
end
