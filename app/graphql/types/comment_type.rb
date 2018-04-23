Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"
  interfaces [Interfaces::ActiveRecordInterface]
  field :body, types.String
  field :post_title do
    type types.String

    resolve -> (obj, args, ctx) {
      obj.post.title
    }
  end
end
