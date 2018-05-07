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

  field :rooms, !types[Types::RoomType] do
    argument :page, !types.ID
    resolve -> (obj, args, ctx) {
      Room.page(args["page"])
    }
  end

  field :room do
    type Types::RoomType
    argument :id, !types.ID
    description "Find a room by ID"
    resolve ->(obj, args, ctx) { Room.find(args["id"]) }
  end

  field :messages, !types[Types::MessageType] do
    argument :page, !types.ID
    resolve -> (obj, args, ctx) {
      Messase.page(args["page"])
    }
  end

  field :message do
    type Types::MessageType
    argument :id, !types.ID
    description "Find a message by ID"
    resolve ->(obj, args, ctx) { Message.find(args["id"]) }
  end

end
