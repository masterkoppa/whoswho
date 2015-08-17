Question = React.createClass({
  getInitialState: function() {
    return {
      url: '',
      question: {},
      answer: {},
      choices: [],
      selected: -1
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
      <div className='panel panel-default col-md-12'>
        <img className='img-responsive' width='200' src={this.state.url + '?s=200'} />
        <InputGroup names={this.state.choices} onClick={this.selectNewChoice} onSubmit={this.submitAnswer} selected={this.state.selected}/>
      </div>
    );
  },

  selectNewChoice: function(index) {
    this.setState({selected: index});
  },

  submitAnswer: function(answer_id) {
    console.log(answer_id);
  }
});