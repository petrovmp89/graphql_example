import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

import ApolloClient from 'apollo-client';
import { graphql, ApolloProvider, createNetworkInterface } from 'react-apollo';
import gql from 'graphql-tag';

const networkInterface = createNetworkInterface({
  uri: 'http://localhost:4000/graphql',
});

const client = new ApolloClient({
  networkInterface,
});

const AddRoom = ({ mutate }) => {
  const handleKeyUp = (e) => {
    if (e.keyCode === 13) {
      e.persist();
      mutate({
        variables: { name: e.target.value },
        refetchQueries: [ { query: roomListQuery }]
      })
      .then( res => {
        e.target.value = '';
      });
    }
  };
  return (
    <input
      type="text"
      placeholder="New room"
      onKeyUp={handleKeyUp}
    />
  );
};

const addRoomMutation = gql`
  mutation addRoom($name: String!) {
    addRoom(input: { name: $name }) {
      id
      name
    }
  }
`;

const AddRoomWithMutation = graphql(addRoomMutation)(AddRoom);

const RoomList = ({ data: { loading, error, rooms }}) => {
  if (loading) {
    return <p>Loading ...</p>;
  }
  if (error) {
    return <p>{error.message}</p>;
  }

  return (
    <div className="roomList">
      <AddRoomWithMutation />
      { rooms.map( room =>
        (<div key={room.id} className="room">{room.name}</div>)
      )}
    </div>
  );
};

const roomListQuery = gql`
  query roomListQuery {
    rooms {
      id
      name
    }
  }
`;

const RoomListWithData = graphql(roomListQuery)(RoomList);
//const RoomListWithData = graphql(roomListQuery, { options: { pollInterval: 5000 }})(RoomList);

class App extends Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <div className="App">
          <div className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h2>GraphQL Subscriptions</h2>
          </div>
          <RoomListWithData />
        </div>
      </ApolloProvider>
    );
  }
}

export default App;
