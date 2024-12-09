import 'package:flutter/material.dart';

class ResponsiveHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan LayoutBuilder untuk mendapatkan ukuran layar
    return LayoutBuilder(
      builder: (context, constraints) {
        // Cek lebar layar untuk menentukan tata letak
        if (constraints.maxWidth > 600) {
          return _buildWideContainers(); // Tata letak desktop/tablet
        } else {
          return _buildNormalContainer(); // Tata letak mobile
        }
      },
    );
  }

  // Tata letak untuk layar lebar (desktop/tablet)
  Widget _buildWideContainers() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Homepage'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildSidebar(),
          ),
          Expanded(
            flex: 5,
            child: _buildMainContent(),
          ),
        ],
      ),
    );
  }

  // Tata letak untuk layar sempit (mobile)
  Widget _buildNormalContainer() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Homepage'),
      ),
      drawer: _buildSidebar(), // Sidebar menjadi drawer di layar kecil
      body: _buildMainContent(),
    );
  }

  // Widget sidebar
  Widget _buildSidebar() {
    return Container(
      color: Colors.blue[100],
      child: ListView(
        children: [
          ListTile(
            title: Text('Menu 1'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Menu 2'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // Konten utama homepage
  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Contoh grid responsif
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
