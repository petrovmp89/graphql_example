export const typeDefs = `

type Room {
  id: ID!
  name: String
}

type Query {
  rooms: [Room]
}
`;
