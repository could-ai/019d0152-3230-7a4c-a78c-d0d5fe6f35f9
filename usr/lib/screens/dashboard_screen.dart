import 'package:flutter/material.dart';
import '../widgets/stat_card.dart';
import '../widgets/ai_insight_panel.dart';
import '../widgets/recent_orders_table.dart';
import '../widgets/simple_bar_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 1000;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tổng quan kinh doanh',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            
            // Stats Row
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 800 ? 4 : (constraints.maxWidth > 500 ? 2 : 1);
                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.5,
                  children: const [
                    StatCard(title: 'Tổng doanh thu (Tháng)', value: '1,245,000,000 đ', icon: Icons.account_balance_wallet, color: Colors.green),
                    StatCard(title: 'Tổng đơn hàng (Tháng)', value: '3,452', icon: Icons.shopping_cart_checkout, color: Colors.blue),
                    StatCard(title: 'Doanh thu hôm nay', value: '24,500,000 đ', icon: Icons.attach_money, color: Colors.orange),
                    StatCard(title: 'Đơn hàng hôm nay', value: '142', icon: Icons.shopping_bag, color: Colors.purple),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),

            // Middle Section: Chart & AI Insights
            if (isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildChartSection(context),
                  ),
                  const SizedBox(width: 24),
                  const Expanded(
                    flex: 1,
                    child: AiInsightPanel(),
                  ),
                ],
              )
            else
              Column(
                children: [
                  _buildChartSection(context),
                  const SizedBox(height: 24),
                  const AiInsightPanel(),
                ],
              ),
            
            const SizedBox(height: 24),
            
            // Bottom Section: Data Table
            const RecentOrdersTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildChartSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Doanh thu theo ngày (7 ngày qua)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const SizedBox(
            height: 300,
            child: SimpleBarChart(),
          ),
        ],
      ),
    );
  }
}
