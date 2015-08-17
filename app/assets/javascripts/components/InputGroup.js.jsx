InputGroup = React.createClass({
  propTypes: {
    onClick: React.PropTypes.func,
    selected: React.PropTypes.number,
    names: React.PropTypes.array
  },
  render: function() {
    return(
      <form>
        {this.buildList()}
        <button className="btn btn-default">Check Answer</button>
      </form>
    )
  },
  buildList: function() {
    var selected = this.props.selected;
    var onClick = this.props.onClick;
    
    return this.props.names.map(function(name, index){
      if (index === selected) {
        return (
          <div className="radio" key={index}>
            <label>
              <input type='radio' onChange={onClick.bind(null, index)} checked/>{name.full_name}
            </label>
          </div>)
      }else {
        return (
          <div className="radio" key={index}>
            <label>
              <input type='radio' onChange={onClick.bind(null, index)}/>{name.full_name}
            </label>
          </div>)
      }
      
    });
  }
});
