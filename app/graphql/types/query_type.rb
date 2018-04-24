Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  field :posts, !types[Types::PostType] do
    argument :page, !types.Int
    resolve -> (obj, args, ctx) {
      Post.page(args["page"])
    }
  end

  field :post do
    type Types::PostType
    argument :id, !types.ID
    description "Find a Post by ID"
    resolve ->(obj, args, ctx) { Post.find(args["id"]) }
  end

  field :comments, !types[Types::CommentType] do
    argument :page, !types.ID
    resolve -> (obj, args, ctx) {
      Comment.page(args["page"])
    }
  end

  field :comment do
    type Types::CommentType
    argument :id, !types.ID
    description "Find a Comment by ID"
    resolve ->(obj, args, ctx) { Comment.find(args["id"]) }
  end

end
