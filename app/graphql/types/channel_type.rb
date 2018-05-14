Types::ChannelType = GraphQL::ObjectType.define do
  name "Channel"
  interfaces [Interfaces::ActiveRecordInterface]
  field :id, types.Int
  field :name, types.String
  field :messages, types[Types::MessageType]
end
