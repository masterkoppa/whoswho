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
      <div className='panel panel-default col-md-2'>
        <img src={this.state.url} />
        <InputGroup names={this.state.choices} onClick={this.selectNewChoice} selected={this.state.selected}/>
      </div>
    );
  },

  selectNewChoice: function(index) {
    this.setState({selected: index});
  }
});


InputGroup = React.createClass({
  propTypes: {
    onClick: React.PropTypes.func,
    selected: React.PropTypes.number,
    names: React.PropTypes.array
  },
  render: function() {
    return(
      <ul>
        {this.buildList()}
      </ul>
    )
  },
  buildList: function() {
    var selected = this.props.selected;
    var onClick = this.props.onClick
    return this.props.names.map(function(name, index){
      if (index === selected) {
        return (<li key={index}><input type='radio' onClick={onClick.bind(null, index)} checked>{name.full_name}</input></li>)
      }else {
        return (<li key={index}><input type='radio' onClick={onClick.bind(null, index)}>{name.full_name}</input></li>)
      }
      
    });
  }
});