import 'package:flutter/material.dart';

class AiInsightPanel extends StatelessWidget {
  const AiInsightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade900,
            Colors.indigo.shade800,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                'AI Phân tích & Gợi ý',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildInsightItem(
            icon: Icons.trending_up,
            title: 'Xu hướng tăng trưởng',
            description: 'Sản phẩm "Áo thun nam" đang có xu hướng tăng 25% doanh số trong 3 ngày qua. Đề xuất nhập thêm hàng.',
          ),
          const SizedBox(height: 16),
          _buildInsightItem(
            icon: Icons.warning_amber_rounded,
            title: 'Cảnh báo tồn kho',
            description: 'Có 12 mặt hàng sắp hết (dưới 5 sản phẩm). Hệ thống đã tự động tạo bản nháp đơn đặt hàng nhà cung cấp.',
          ),
          const SizedBox(height: 16),
          _buildInsightItem(
            icon: Icons.group_add,
            title: 'Hành vi khách hàng',
            description: 'Khách hàng mua "Giày thể thao" thường mua kèm "Tất cổ ngắn". Đề xuất tạo combo giảm giá 5% để tăng giá trị đơn hàng.',
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // Future: Open AI Chat interface
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tính năng Chat với AI đang được phát triển...')),
                );
              },
              icon: const Icon(Icons.chat_bubble_outline, size: 18),
              label: const Text('Hỏi AI chi tiết hơn'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.indigo.shade900,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInsightItem({required IconData icon, required String title, required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
