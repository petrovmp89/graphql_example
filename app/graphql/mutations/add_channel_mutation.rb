Mutations::AddChannelMutation = GraphQL::Relay::Mutation.define do
  name "AddChannel"

  input_field :name, !types.String

  return_field :id, types.ID
  return_field :name, types.String

  resolve ->(object, inputs, ctx) {
    channel = Channel.new(name: inputs[:name])
    channel.save
    {
      id: channel.id,
      name: channel.name
    }
  }
end
