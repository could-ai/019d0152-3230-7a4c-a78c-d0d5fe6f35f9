import 'package:flutter/material.dart';

class RecentOrdersTable extends StatelessWidget {
  const RecentOrdersTable({super.key});

  @override
  Widget build(BuildContext context) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Đơn hàng gần đây',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Xem tất cả'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              columns: const [
                DataColumn(label: Text('Mã ĐH')),
                DataColumn(label: Text('Khách hàng')),
                DataColumn(label: Text('Sản phẩm')),
                DataColumn(label: Text('Tổng tiền')),
                DataColumn(label: Text('Trạng thái')),
              ],
              rows: [
                _buildRow('DH-1001', 'Nguyễn Văn A', 'Áo thun nam x2', '350,000 đ', 'Hoàn thành', Colors.green),
                _buildRow('DH-1002', 'Trần Thị B', 'Giày thể thao x1', '1,200,000 đ', 'Đang giao', Colors.blue),
                _buildRow('DH-1003', 'Lê Văn C', 'Balo laptop x1', '550,000 đ', 'Chờ xử lý', Colors.orange),
                _buildRow('DH-1004', 'Phạm Thị D', 'Mũ lưỡi trai x3', '450,000 đ', 'Hoàn thành', Colors.green),
                _buildRow('DH-1005', 'Hoàng Văn E', 'Áo khoác x1', '850,000 đ', 'Đã hủy', Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(String id, String customer, String product, String total, String status, Color statusColor) {
    return DataRow(
      cells: [
        DataCell(Text(id, style: const TextStyle(fontWeight: FontWeight.w500))),
        DataCell(Text(customer)),
        DataCell(Text(product)),
        DataCell(Text(total)),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
