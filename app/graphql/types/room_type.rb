Types::RoomType = GraphQL::ObjectType.define do
  name "Room"
  interfaces [Interfaces::ActiveRecordInterface]
  field :id, types.Int
  field :name, types.String
  field :messages, types[Types::MessageType]
end
