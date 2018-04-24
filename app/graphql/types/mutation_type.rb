Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  field :addComment, field: Mutations::AddCommentMutation.field
  field :addPost, field: Mutations::AddPostMutation.field
end
