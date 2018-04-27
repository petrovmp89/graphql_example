Mutations::AddPostMutation = GraphQL::Relay::Mutation.define do
  name "AddPost"

  input_field :title, !types.String
  input_field :rating, !types.Int

  return_field :title, types.String
  return_field :me, types.String
  return_interfaces [Interfaces::MutationResult]

  resolve ->(object, inputs, ctx) {
    post = Post.new(title: inputs[:title], rating: inputs[:rating])
    post.save
    {
      success: post.persisted?,
      title: post.title,
      notice: post.attributes,
      errors: post.errors.full_messages.to_sentence,
      me: ctx[:current_user].name
    }
  }
end
