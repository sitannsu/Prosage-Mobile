import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics & Reports')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildFilters(context),
            const SizedBox(height: 24),
            Responsive(
              mobile: Column(children: [_buildBarChart(), const SizedBox(height: 24), _buildPieChart()]),
              tablet: Row(children: [Expanded(child: _buildBarChart()), const SizedBox(width: 24), Expanded(child: _buildPieChart())]),
              desktop: Row(children: [Expanded(child: _buildBarChart()), const SizedBox(width: 24), Expanded(child: _buildPieChart())]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Class', border: OutlineInputBorder()),
            value: '10-A',
            items: ['10-A', '9-B', '12-C'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) {},
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Month', border: OutlineInputBorder()),
            value: 'October',
            items: ['September', 'October', 'November'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) {},
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Class', border: OutlineInputBorder()),
              value: '10-A',
              items: ['10-A', '9-B', '12-C'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) {},
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Month', border: OutlineInputBorder()),
              value: 'October',
              items: ['September', 'October', 'November'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) {},
            ),
          ),
        ],
      );
    }
  }

  Widget _buildBarChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Attendance Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)]),
          child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.bar_chart, size: 64, color: AppTheme.primaryColor), SizedBox(height: 8), Text('Attendance Bar Chart Placeholder', style: TextStyle(color: Colors.grey))])),
        ),
      ],
    );
  }

  Widget _buildPieChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Student Performance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)]),
          child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.pie_chart, size: 64, color: AppTheme.secondaryColor), SizedBox(height: 8), Text('Performance Pie Chart Placeholder', style: TextStyle(color: Colors.grey))])),
        ),
      ],
    );
  }
}
