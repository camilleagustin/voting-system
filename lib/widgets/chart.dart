import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:voting_app/models/vote_model.dart';

class VoteChart extends StatelessWidget {
  final Future<List<Votes>> data;
  final String position;

  const VoteChart({Key key, this.data, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      initialData: [Votes(name: 'Loading', votes: 0)],
      builder: (BuildContext context, AsyncSnapshot<List<Votes>> data) {
        var series = [
          charts.Series(
            domainFn: (Votes votes, _) => votes.name,
            measureFn: (Votes votes, _) => votes.votes,
            id: position,
            labelAccessorFn: (Votes votes, _) => votes.votes.toString(),
            data: data.data,
          ),
        ];

        return Container(
          height: 200,
          child: charts.BarChart(
            series,
            behaviors: [
              charts.ChartTitle(position.toUpperCase()),
            ],
            animationDuration: Duration(microseconds: 2000),
            vertical: false,
            barRendererDecorator: charts.BarLabelDecorator<String>(
                insideLabelStyleSpec: charts.TextStyleSpec(
                    fontSize: 16, color: charts.Color.white)),
          ),
        );
      },
    );
  }
}
