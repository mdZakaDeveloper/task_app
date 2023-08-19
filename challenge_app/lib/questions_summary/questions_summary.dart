import 'package:challenge_app/questions_summary/summary_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          
          children: summaryData.map((data) {
            return SummaryItems(data);
            
          }).toList(),
        ),
      ),
    );
  }
}
