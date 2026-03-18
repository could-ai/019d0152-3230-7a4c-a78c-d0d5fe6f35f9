import 'package:flutter/material.dart';

class ProductManagementScreen extends StatelessWidget {
  const ProductManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dữ liệu Hàng hóa & Kho',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Thêm sản phẩm'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // AI Inventory Insight
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.auto_awesome, color: Colors.blue.shade700),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'AI Dự báo: Sản phẩm "Áo khoác mùa đông" dự kiến sẽ tăng 40% nhu cầu trong tuần tới do thời tiết lạnh. Đề xuất nhập thêm 200 sản phẩm.',
                      style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Tạo đơn nhập'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Products Table
            Container(
              width: double.infinity,
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
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm sản phẩm...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                      columns: const [
                        DataColumn(label: Text('Mã SP')),
                        DataColumn(label: Text('Tên sản phẩm')),
                        DataColumn(label: Text('Danh mục')),
                        DataColumn(label: Text('Giá bán')),
                        DataColumn(label: Text('Tồn kho')),
                        DataColumn(label: Text('Trạng thái')),
                        DataColumn(label: Text('Thao tác')),
                      ],
                      rows: [
                        _buildProductRow('SP001', 'Áo thun nam basic', 'Thời trang nam', '150,000 đ', 120, 'Còn hàng', Colors.green),
                        _buildProductRow('SP002', 'Quần jean nữ', 'Thời trang nữ', '350,000 đ', 45, 'Còn hàng', Colors.green),
                        _buildProductRow('SP003', 'Giày thể thao Sneaker', 'Giày dép', '850,000 đ', 4, 'Sắp hết', Colors.orange),
                        _buildProductRow('SP004', 'Áo khoác mùa đông', 'Thời trang nam', '550,000 đ', 0, 'Hết hàng', Colors.red),
                        _buildProductRow('SP005', 'Balo laptop chống nước', 'Phụ kiện', '450,000 đ', 89, 'Còn hàng', Colors.green),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildProductRow(String id, String name, String category, String price, int stock, String status, Color statusColor) {
    return DataRow(
      cells: [
        DataCell(Text(id, style: const TextStyle(fontWeight: FontWeight.w500))),
        DataCell(Text(name)),
        DataCell(Text(category)),
        DataCell(Text(price)),
        DataCell(Text(stock.toString())),
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
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(icon: const Icon(Icons.edit, size: 18, color: Colors.blue), onPressed: () {}),
              IconButton(icon: const Icon(Icons.delete, size: 18, color: Colors.red), onPressed: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
