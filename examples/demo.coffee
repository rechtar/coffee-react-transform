
{Parser, serialise, transform} = require '../lib/transformer'

coffeeCompile = require('coffee-script').compile

fs = require 'fs'

start = new Date()

parseTree = new Parser().parse(fs.readFileSync('./car.csx', 'utf8'))

'''

<Car doors=4 safety={getSafetyRating()*2} crackedWindscreen = "yep" insurance={ insurancehas() ? 'cool': 'ahh noooo'} data-yolo='swag\\' checked check=me_out />

'''
"""
# @jsx React.DOM

<Person name={window.isLoggedIn ? window.name : ''} />

<Person name={window.isLoggedIn 
? window.name 
: \'\'} />


<Person name={window.isLoggedIn 
? window.name 
: \'\'}> 
{

  for n in a
    <div>
      asf
      <li xy={"as"}>{ n+1 }<a /> <a /> </li>
    </div>
}

</Person>

<Person name={window.isLoggedIn ? window.name : \'\'} 
loltags='on new line' />

HelloWorld = React.createClass({
  render: () ->
    return (
      <p>
        Hello, <input type="text" placeholder="Your name here" />!
        It is {this.props.date.toTimeString()}
      </p>
    );
});

setInterval(() ->
  React.renderComponent(
    <HelloWorld date="{new Date()}" />,
    document.getElementById('example')
  );
, 500);

React.createClass
  render: ->
    return <Nav color="blue">
      {<Profile>click{Math.random(),<Selfclosing coolattr />}</Profile> for i in [start...finish]}
    </Nav>


"""
console.log 'Parse tree:'
console.log JSON.stringify(parseTree, null, 4)
console.log 'Transformed to coffee:'
coffeescriptCode = serialise parseTree
console.log coffeescriptCode
console.log 'Compiled to JS:'
console.log(coffeeCompile(coffeescriptCode))

end = new Date()

console.log "done in #{end - start}ms"

