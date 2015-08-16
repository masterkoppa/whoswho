//= require ./score_card

GameWindow = React.createClass({

  renderQuestion: function() {
    $.ajax('/questions/name', function( data ) {
      debugger
      setState({ question: data.responseJSON })
      return <Question url={this.state.question} />
    });
  },

  render: function() {
    return (
      <div>
        <div>Employee: {this.props.user.employee.name}</div>
        <ScoreCard title='Right' score={3} />
        <ScoreCard title='Wrong' score={1} />
        {this.renderQuestion()}
      </div>
    );
  }
});
