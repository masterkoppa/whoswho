ScoreCard = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    score: React.PropTypes.node
  },

  render: function() {
    return (
      <div className='well col-md-6'>
        <h2 className='text-center'>{this.props.title}</h2>
        <h3 className='text-center'>{this.props.score}</h3>
      </div>
    );
  }
});
