Question = React.createClass({
  propTypes: {
    question: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <img src={this.props.question.url} />
        <ul>
          {
            this.props.question.choices.map(function(choice) {
              return (
                <li><input type='radio' ></input></li>
              )
            })
          }
        </ul>
      </div>
    );
  }
});
