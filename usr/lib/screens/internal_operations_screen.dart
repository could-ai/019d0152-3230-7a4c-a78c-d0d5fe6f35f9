import 'package:flutter/material.dart';

class InternalOperationsScreen extends StatelessWidget {
  const InternalOperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phần mềm Nghiệp vụ nội bộ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Tích hợp AI để tự động hóa quy trình và hỗ trợ ra quyết định',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),

            // AI Assistant Banner
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade800, Colors.deepPurple.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.psychology, color: Colors.white, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Trợ lý AI Nội bộ',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tôi có thể giúp bạn tóm tắt báo cáo nhân sự, phân tích luồng tiền kế toán, hoặc tự động phân loại ticket hỗ trợ khách hàng. Bạn cần giúp gì hôm nay?',
                          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.purple.shade800,
                    ),
                    child: const Text('Chat với AI'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Modules Grid
            const Text(
              'Các phân hệ nghiệp vụ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 1.5,
                  children: [
                    _buildModuleCard(
                      context,
                      title: 'Quản trị Nhân sự (HRM)',
                      description: 'Quản lý nhân viên, chấm công, tính lương. AI hỗ trợ đánh giá hiệu suất.',
                      icon: Icons.people_alt,
                      color: Colors.blue,
                    ),
                    _buildModuleCard(
                      context,
                      title: 'Kế toán & Tài chính',
                      description: 'Quản lý thu chi, công nợ. AI tự động nhận diện hóa đơn và cảnh báo dòng tiền.',
                      icon: Icons.account_balance,
                      color: Colors.green,
                    ),
                    _buildModuleCard(
                      context,
                      title: 'Chăm sóc Khách hàng (CRM)',
                      description: 'Quản lý thông tin KH, lịch sử mua hàng. AI phân loại KH tiềm năng.',
                      icon: Icons.support_agent,
                      color: Colors.orange,
                    ),
                    _buildModuleCard(
                      context,
                      title: 'Quản lý Công việc',
                      description: 'Giao việc, theo dõi tiến độ dự án. AI tự động nhắc nhở deadline.',
                      icon: Icons.task_alt,
                      color: Colors.teal,
                    ),
                    _buildModuleCard(
                      context,
                      title: 'Chuỗi cung ứng (SCM)',
                      description: 'Quản lý nhà cung cấp, vận chuyển. AI tối ưu hóa tuyến đường giao hàng.',
                      icon: Icons.local_shipping,
                      color: Colors.indigo,
                    ),
                    _buildModuleCard(
                      context,
                      title: 'Báo cáo thông minh',
                      description: 'Tạo báo cáo động. AI tự động phân tích và đưa ra insight kinh doanh.',
                      icon: Icons.analytics,
                      color: Colors.red,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard(BuildContext context, {required String title, required String description, required IconData icon, required Color color}) {
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
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey.shade400),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600, height: 1.4),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
