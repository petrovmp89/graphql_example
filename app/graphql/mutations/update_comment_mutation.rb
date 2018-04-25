Mutations::UpdateCommentMutation = GraphQL::Relay::Mutation.define do
  name "updateComment"

  input_field :id, !types.ID
  input_field :body, !types.String

  return_interfaces [Interfaces::MutationResult]

  resolve ->(object, inputs, ctx) {
    comment = Comment.find(inputs[:id])
    updated_at = comment.updated_at
    comment.body = inputs[:body]
    comment.save

    {
      success: (updated_at != comment.updated_at),
      notice: comment.attributes,
      errors: comment.errors.full_messages.to_sentence
    }
  }
end
