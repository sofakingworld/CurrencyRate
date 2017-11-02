// require ./currency_rate.es6.jsx
// Отображает компоненты CurrencyRate

class HeaderRatesContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {data: props.data, currencies: props.currencies}    
  }
  
  render () {

    return <div key={this.state.created_at}>
    { 
      this.state.currencies.map((Obj, idx) => {
        return <li key={`rate_${idx}`}>
          <CurrencyRate key={idx} currency={Obj.id} data={this.state.data.filter((f) => f.valute.id == Obj.id)}/>
        </li>
      })
    }
    </div>   
  }

}


