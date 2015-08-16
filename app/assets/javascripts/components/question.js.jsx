Question = React.createClass({
  getInitialState: function() {
    return {
      url: '',
      question: {},
      answer: {},
      choices: []
    };
  },

  componentDidMount: function() {
    $.get('/questions/name', function( data ) {
      if (this.isMounted()) {
        this.setState({ 
          url: data.question.answer[0].url,
          answer: data.question.answer,
          choices: data.question.choices
        });
      }
    }.bind(this));
  },

  render: function() {
    return (
      <div className='panel panel-default col-md-2'>
        <img src={this.state.url} />
        <ul>
          {
            this.state.choices.map(function(choice) {
              return (
                <li><input type='radio' >{choice.full_name}</input></li>
              )
            })
          }
        </ul>
      </div>
    );
  }
});
