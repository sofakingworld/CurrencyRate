// Компонент, который открывает WS и ждет информацию по курсу
class CurrencyRate extends React.Component {
  constructor(props) {
    super(props);

    this.state = {data: props.data, channel: props.currency}    
  }

  subscribe_on_channel(name) {
    let react = this;
    App.currency_rate_cable = App.cable.subscriptions.create(
      {channel: "CurrencyRateChannel", 
       currency_id: name},
      {
        connected: function() {
          console.log('CurrencyRateChannel_'+name+' - connected');
          react.get_actual_data(react.state.channel) 
        },
        disconnected: function() {
          console.log('CurrencyRateChannel_'+name+' - disconnected');
        },
        received: function(data) {
          console.log('CurrencyRateChannel_'+name+' - data received');
          react.setState({data: data})
        }
      }
    );
  }
  
  render () {
    return <a>
    {
      this.state.data.map((Obj, idx) => {
        return `${Obj['valute']['char_code']}: ${Obj['last_rate']['first_value']}`
      })
    }
    </a>   
  }

  componentDidMount() {
      this.subscribe_on_channel(this.state.channel)
  }
  
  get_actual_data(channel) {
    let react = this;
    $.ajax(`/api/current_rate?ids=${channel}`).done((response) => {
      react.setState({data: response})
    })
  }


}


