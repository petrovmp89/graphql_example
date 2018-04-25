Mutations::DeleteCommentMutation = GraphQL::Relay::Mutation.define do
  name "deleteComment"

  input_field :id, !types.ID

  return_interfaces [Interfaces::MutationResult]

  resolve ->(object, inputs, ctx) {
    comment = Comment.find_by(id: inputs[:id])
    return { success: false, errors: 'Comment not found' } if comment.nil?
    comment.destroy

    { success: true }
  }
end
