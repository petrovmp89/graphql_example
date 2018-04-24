Mutations::AddCommentMutation = GraphQL::Relay::Mutation.define do
  name "AddComment"

  input_field :post_id, !types.ID
  input_field :body, !types.String

  return_field :body, types.String
  return_interfaces [Interfaces::MutationResult]

  resolve ->(object, inputs, ctx) {
    comment = Post.find(inputs[:post_id]).comments.build(body: inputs[:body])
    comment.save

    {
      success: comment.persisted?,
      body: comment.body,
      notice: comment.attributes,
      errors: comment.errors.full_messages.to_sentence
    }
  }
end
