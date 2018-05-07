Mutations::AddMessageMutation = GraphQL::Relay::Mutation.define do
  name "AddMessage"

  input_field :room_id, !types.ID
  input_field :text, !types.String

  return_interfaces [Interfaces::MutationResult]

  resolve ->(object, inputs, ctx) {
    message = Room.find(inputs[:room_id]).messages.build(text: inputs[:text])
    message.save

    {
      success: message.persisted?,
      notice: message.attributes,
      errors: message.errors.full_messages.to_sentence
    }
  }
end
