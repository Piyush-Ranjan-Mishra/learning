import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/Utils/style.dart';
import 'package:learning_people/Utils/utils.dart';
import 'package:learning_people/bloc/screen/radarBloc.dart';

import 'radarPainter.dart';

class Radar extends StatefulWidget {
  final Map values;
  final double labelPadding;
  final double gridStep;
  final double maxValue;

  Radar(this.values,
      {this.gridStep = 2, this.maxValue = 10, this.labelPadding = 4.0, Key key})
      : super(key: key);

  @override
  _RadarState createState() => _RadarState();
}

class _RadarState extends State<Radar> {
  final RadarBloc bloc = RadarBloc.instance;

  @override
  Widget build(BuildContext context) {
    List<Widget> labelWidgetList = [];
    int index = 0;
    widget.values.forEach((key, val) {
      labelWidgetList.add(RadarLabelHeadings(index++, key));
    });
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(300, 300),
                  painter: RadarPainter(this.widget.values,
                      maxValue: widget.maxValue,
                      steps: widget.gridStep,
                      bloc: this.bloc),
                ),
                StreamBuilder<List<Alignment>>(
                  stream: bloc.alignmentList.stream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Alignment>> snapshot) {
                     if (!snapshot.hasData) return Offstage();
                    int index = 0;
                    var format = NumberFormat('###.#', 'en_US');
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        // create circular label
                        ...snapshot.data
                            .map(
                              (alignment) => Align(
                                alignment: alignment,
                                child: RadarLabel(index++),
                              ),
                            )
                            .toList(),
                        ...Utils.range(widget.gridStep, widget.maxValue,
                                widget.gridStep)
                            .map((el) => Align(
                                alignment:
                                    Alignment(-0.05, -(el / widget.maxValue)),
                                child: Text(format.format(el))))
                            .toList(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Column(
            children: labelWidgetList,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

class RadarLabelHeadings extends StatelessWidget {
  final int index;
  final String text;
  const RadarLabelHeadings(this.index, this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingStudentProfileCards,
      child: Row(
        children: [
          RadarLabel(index),
          SizedBox(
            width: sizeBetweenWidget,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: primaryColor),
          )
        ],
      ),
    );
  }
}

class RadarLabel extends StatelessWidget {
  final int index;
  final double radius;
  const RadarLabel(this.index, {this.radius = 10, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const A_ASCII = 65;
    return Container(
      height: 2 * radius,
      width: 2 * radius,
      decoration: BoxDecoration(
        color: iconColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          String.fromCharCode(A_ASCII + index),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
