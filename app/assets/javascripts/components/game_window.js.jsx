//= require ./score_card

GameWindow = React.createClass({

  render: function() {
    return (
      <div>
        <ScoreCard title='Right' score={3} />
        <ScoreCard title='Wrong' score={1} />
        <Question />
      </div>
    );
  }
});
