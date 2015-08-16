//= require ./score_card

GameWindow = React.createClass({

  render: function() {
    return (
      <div className='col-md-offset-4 col-md-4'>
        <ScoreCard title='Right' score={3} />
        <ScoreCard title='Wrong' score={1} />
        <Question />
      </div>
    );
  }
});
