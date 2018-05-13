Mutations::AddRoomMutation = GraphQL::Relay::Mutation.define do
  name "AddRoom"

  input_field :name, !types.String

  return_field :id, types.ID
  return_field :name, types.String

  resolve ->(object, inputs, ctx) {
    room = Room.new(name: inputs[:name])
    room.save
    {
      id: room.id,
      name: room.name
    }
  }
end
