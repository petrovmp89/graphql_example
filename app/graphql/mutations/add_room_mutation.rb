Mutations::AddRoomMutation = GraphQL::Relay::Mutation.define do
  name "AddRoom"

  input_field :name, !types.String

  return_interfaces [Interfaces::MutationResult]

  resolve ->(object, inputs, ctx) {
    room = Room.new(name: inputs[:name])
    room.save
    {
      success: room.persisted?,
      notice: room.attributes,
      errors: room.errors.full_messages.to_sentence
    }
  }
end
