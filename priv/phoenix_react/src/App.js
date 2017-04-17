import './App.css';
import React, { Component } from 'react';
import gql from "graphql-tag";
import logo from './logo.svg';
import { graphql } from "react-apollo";

class App extends Component {
    render() {
        let { loading, posts } = this.props.data;

        if (loading) {
            return (
                <p>Loading...</p>
            );
        }
        else {
            return (
                <div className="App">
                    <div className="App-header">
                        <img src={logo} className="App-logo" alt="logo" />
                        <h2>Welcome to React</h2>
                    </div>
                    { posts.map(post => {
                          return (
                              <div key={post.id}>
                                <h3>{post.title}</h3>
                                <p>{post.body}</p>
                              </div>
                          );
                      })}
                </div>
            );
        }
    }
}

export default graphql(gql`
    query posts {
        posts {
            id
            title
            body
        }
    }
`)(App);
