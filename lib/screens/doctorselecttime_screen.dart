import 'package:flutter/material.dart';

class DoctorSelectTimeScreen extends StatelessWidget {
  const DoctorSelectTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Time')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/doctor1.png'),
              ),
              title: const Text('Dr. Shruti Kedia'),
              subtitle: const Text('Upasana Dental Clinic'),
            ),
            const SizedBox(height: 20),
            const Text('Available Dates:'),
            const SizedBox(height: 10),
            Row(
              children: [
                ChoiceChip(label: const Text('Today'), selected: false),
                const SizedBox(width: 8),
                ChoiceChip(label: const Text('Tomorrow'), selected: true),
                const SizedBox(width: 8),
                ChoiceChip(label: const Text('Thu'), selected: false),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Next availability on Wed, 24 Feb'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Contact Clinic'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
