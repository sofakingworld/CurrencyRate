// В список динамически не загружаются форсированные курсы, пока... возможно :)
// Компопнент строит графики курсов валют
class RateChart extends React.Component {
  constructor(props) {
    super(props);

    props.currencies.map((c) => {
        let data = props.rates.filter((f) => f.second_currency_type_id == c.id)
        c['data'] = data.map((v) => {      
            return [v.created_at, v.first_value]
        })
        return c
    })
    this.state = {range:["-30","0"], data: props, checked: []}
  }

  toggleCheckBox(rateId) {
      let temp = this.state.checked.filter(item => item != rateId) 
      if (temp.toString() == this.state.checked.toString()) {
          temp.push(rateId)
      }
      this.setState({checked:temp})
  }

  numberName(n, str1, str2, str3 ) {
    switch (true) {
        case (Math.floor(n/10) == 1):
            return str3
            break
        case (n%10 == 1):
            return str1
            break
        case (n%10 >= 5 && n%10 <= 9 || n%10 == 0):
            return str3
        default:
            return str2
    }
  }

  render () {
    const qtyRateRange = this.state.range[1] - this.state.range[0];
    const height = {height: 500, overflowX: 'auto' }
    return ( 
        <div>
            <h3 className='center'> {qtyRateRange} {this.numberName(qtyRateRange, 'последнее изменение', 'последних изменений', 'последних изменений')}  курса</h3>
            <div className='row'>
                <div className='col s4' style={height}>
                {
                    this.props.currencies.map((c) => {
                        return <div className='checkbox' key={'chr_'+c.id}>                            
                             <input type='checkbox' id={c.id} onClick={()=> this.toggleCheckBox(c.id)}/>
                             <label htmlFor={c.id}>{`${c.nominal} ${c.title} (${c.char_code})`}</label>
                        </div>
                    })
                }
                </div>
                <div className='col s8'>
                    
                    <div style={height} id='rate-chart-1'></div>
                </div>

                <hr/>
            </div>
                <div className='row'>
                <div id='slider'></div>
            </div>  
        </div>
    )
  }

  sliderChange(range) {

    this.setState({range: range})
    
  }
  componentDidUpdate() {
    let range = this.state.range
    let CR = this.state.data.currencies.filter((f) => {
            return this.state.checked.indexOf(f.id)!=-1
        }).map((c) => {          
            let len = Object.keys(c.data).length
            return {name: c.char_code, data: c.data.slice(len+parseInt(range[0]), len + parseInt(range[1]))}
        })
    this.drawChart(CR) 
  }
  drawChart(data) {
    new Chartkick.LineChart("rate-chart-1", data, {ytitle: "RUB", legend: this.state.checked.length > 0})
  }

  componentDidMount() {
      var slider = document.getElementById('slider');      
      let noUISlider = noUiSlider.create(slider, {
       start: [-30, 0],
       connect: true,
       step: 1,
       orientation: 'horizontal',
       range: {
         'min': -100,
         'max': 0
       },
       format: wNumb({
         decimals: 0
       })
      });
      noUISlider.on('set', ()=> this.sliderChange(noUISlider.get()))
  }

  setRateData(data) {
    this.setState({data: data})
  }

}


