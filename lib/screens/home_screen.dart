import 'package:flutter/material.dart';
import 'package:my_app/screens/finddoctor_screen.dart';
import 'package:my_app/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> services = ["Tooth", "Heart", "Eye", "Skin"];
  final List<String> serviceIcons = ["🦷", "❤️", "👁️", "🧴"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: _bottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              const SizedBox(height: 16),
              _searchBar(context),
              const SizedBox(height: 24),
              _sectionTitle("Live Doctors"),
              _liveDoctorsSection(),
              const SizedBox(height: 16),
              _serviceIconsSection(),
              const SizedBox(height: 24),
              _sectionTitle("Popular Doctor", showSeeAll: true),
              _popularDoctors(),
              const SizedBox(height: 24),
              _sectionTitle("Feature Doctor", showSeeAll: true),
              _featuredDoctors(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Handwerker!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                "Find Your Doctor",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          child: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ),
      ],
    );
  }

  Widget _searchBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FindDoctorScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, {bool showSeeAll = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (showSeeAll) Text("See all", style: TextStyle(color: Colors.green)),
      ],
    );
  }

  Widget _liveDoctorsSection() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(right: 12),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/doctor${index + 1}.jpg',
                      width: 100,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "LIVE",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  Widget _serviceIconsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(services.length, (index) {
        return Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor:
                  Colors.primaries[index % Colors.primaries.length].shade100,
              child: Text(serviceIcons[index], style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 6),
            Text(services[index], style: TextStyle(fontSize: 12)),
          ],
        );
      }),
    );
  }

  Widget _popularDoctors() {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _doctorCard("Dr. Fillerup Grab", "Medicine Specialist"),
          _doctorCard("Dr. Blessing", "Cardio Specialist"),
          _doctorCard("Dr. Blessing", "Cardio Specialist"),
          _doctorCard("Dr. Blessing", "Cardio Specialist"),
          _doctorCard("Dr. Blessing", "Cardio Specialist"),
          _doctorCard("Dr. Blessing", "Cardio Specialist"),
          _doctorCard("Dr. Blessing", "Cardio Specialist"),
          _doctorCard("Dr. Blessing", "Cardio Specialist"),
          _doctorCard("Dr. Blessing", "Cardio Specialist"),
          _doctorCard("Dr. Blessing", "Cardio Specialist"),
        ],
      ),
    );
  }

  Widget _featuredDoctors() {
    return SizedBox(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _miniDoctorCard("Dr. Criek", "⭐ 3.0"),
          _miniDoctorCard("Dr. Strain", "⭐ 5.0"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
          _miniDoctorCard("Dr. Lazhivet", "⭐ 4.7"),
        ],
      ),
    );
  }

  Widget _doctorCard(String name, String title) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('assets/images/doctor.jpg'),
          ),
          SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _miniDoctorCard(String name, String rating) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage('assets/images/doctor.jpg'),
          ),
          SizedBox(height: 6),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
          Text(rating, style: TextStyle(color: Colors.orange, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      ],
    );
  }
}
