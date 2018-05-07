Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  field :addComment, field: Mutations::AddCommentMutation.field
  field :updateComment, field: Mutations::UpdateCommentMutation.field
  field :deleteComment, field: Mutations::DeleteCommentMutation.field
  field :addPost, field: Mutations::AddPostMutation.field
  field :addRoom, field: Mutations::AddRoomMutation.field
  field :addMessage, field: Mutations::AddMessageMutation.field
end
