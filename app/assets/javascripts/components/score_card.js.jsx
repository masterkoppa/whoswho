var ScoreCard = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    score: React.PropTypes.node
  },

  render: function() {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <div>Score: {this.props.score}</div>
      </div>
    );
  }
});
