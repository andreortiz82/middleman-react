// This is where it all goes :)
import React, { Component } from "react";
import ReactDOM from "react-dom";

class Hello extends Component {
  constructor() {
    super();

    this.state = {
      title: "React is also running!"
    };
  }

  render() {
    return (
      <h2>{this.state.title}</h2>
    );
  }
}

ReactDOM.render(<Hello/>, document.getElementById('hello'));
