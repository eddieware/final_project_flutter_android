import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CalifPage extends StatefulWidget {
  List<charts.Series> seriesList;
  final bool animate;
  CalifPage(this.seriesList, {this.animate});
  //CalificacionesPage({Key key}) : super(key: key);

  factory CalifPage.withSampleData() {
    return new CalifPage(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  _CalifPageState createState() => _CalifPageState();
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('Fernando', 55),
      new OrdinalSales('Jose', 95),
      new OrdinalSales('Edgar', 50),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
          id: 'Sales',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (OrdinalSales sales, _) =>
              '${sales.sales.toString()}pts')
    ];
  }
}

class _CalifPageState extends State<CalifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calificaciones Page'),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('Notes').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('Loading...Please Wait...');
              } else {
                _newMethod(snapshot);
                return Column(
                  children: <Widget>[
                    // Text(snapshot.data.documents[0]['materia']),
                    // Text(snapshot.data.documents[0]['calif'].toString())
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      // padding: EdgeInsets.all(16),
                      //color: Colors.green,
                      height: 500,
                      width: 400,
                      child: charts.BarChart(
                        widget.seriesList,
                        animate: widget.animate,
                        // Set a bar label decorator.
                        // Example configuring different styles for inside/outside:
                        //       barRendererDecorator: new charts.BarLabelDecorator(
                        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
                        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
                        barRendererDecorator:
                            new charts.BarLabelDecorator<String>(),
                        domainAxis: new charts.OrdinalAxisSpec(),
                      ),
                    ),
                    Container(
                      //color: Colors.amber,
                      child: Text(
                        'Android Class',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                );
              }
            }));
  }

  void _newMethod(AsyncSnapshot snapshot) {}
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
