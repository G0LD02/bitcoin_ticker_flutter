import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectCurrrency = 'USD';
  String btcPrice = '?';
  String EthPrice = '?';
  String LtcPrice = '?';

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> dropDownItem = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(child: Text(currency), value: currency,);
      dropDownItem.add(newItem);
    }

    return dropDownItem;
  }

  @override
  void initState() {
    super.initState();
    getBtcPrice();
    getEthPrice();
    getLtcPrice();
  }

  void getBtcPrice() async {
    print('getPrice() called');

    CoinData coinData = CoinData();

    double rate = await coinData.getBtcPrice(selectCurrrency);

    setState(() {
      btcPrice = rate.toStringAsFixed(0);
    });
  }
  void getEthPrice() async {
    print('getPrice() called');

    CoinData coinData = CoinData();

    double rate = await coinData.getEthPrice(selectCurrrency);

    setState(() {
      EthPrice = rate.toStringAsFixed(0);
    });
  }
  void getLtcPrice() async {
    print('getPrice() called');

    CoinData coinData = CoinData();

    double rate = await coinData.getLtcPrice(selectCurrrency);

    setState(() {
      LtcPrice = rate.toStringAsFixed(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $btcPrice $selectCurrrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $EthPrice $selectCurrrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LCT = $LtcPrice $selectCurrrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
                value: selectCurrrency,
                items: getDropdownItems(),
                onChanged: (value) {
                setState(() {
                selectCurrrency = value!;
                btcPrice = '?';
               EthPrice = '?';
               LtcPrice = '?';

                });

                getBtcPrice();
                getEthPrice();
                getLtcPrice();
              } ,
            ),
          ),
        ],
      ),
    );
  }
}
