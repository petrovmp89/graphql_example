Mutations::AddMessageMutation = GraphQL::Relay::Mutation.define do
  name "AddMessage"

  input_field :channel_id, !types.ID
  input_field :text, !types.String

  return_field :id, types.ID
  return_field :channel_id, types.ID
  return_field :text, types.String

  resolve ->(object, inputs, ctx) {
    message = Channel.find(inputs[:channel_id]).messages.build(text: inputs[:text])
    message.save
    GraphqlSchema.subscriptions.trigger("messageWasAdded", {}, message)

    {
      id: message.id,
      text: message.text,
      channel_id: message.channel_id
    }
  }
end
