import 'package:flutter/material.dart';

class HotelDetailPage extends StatelessWidget {
  const HotelDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f7fb),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 320,
                pinned: true,
                elevation: 0,
                backgroundColor: const Color(0xfff6f7fb),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.94),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff111827),
                      ),
                    ),
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.94),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        color: Color(0xffd62828),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(42),
                          bottomRight: Radius.circular(42),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              'assets/1.jpeg',
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black26,
                                    Colors.black54,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 18,
                        right: 18,
                        bottom: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gandaria City',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800,
                                      height: 1.08,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    'Luxury stay experience with modern comfort',
                                    style: TextStyle(
                                      color: Color(0xfff3f4f6),
                                      fontSize: 13.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 9,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.95),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    color: Colors.orange,
                                    size: 18,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.8',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff111827),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 125),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HotelQuickInfoCard(),
                      const SizedBox(height: 22),
                      const SectionTitle(
                        title: 'About Hotel',
                        subtitle: 'Modern, elegant, and premium hospitality',
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x10000000),
                              blurRadius: 18,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Gandaria City menghadirkan pengalaman menginap yang modern, nyaman, dan berkelas. Cocok untuk staycation, perjalanan bisnis, maupun short escape di area Jakarta Selatan. Lokasinya strategis, tampilannya clean, dan ambience-nya dibuat premium agar pengalaman user terasa lebih eksklusif.',
                          style: TextStyle(
                            color: Color(0xff475569),
                            fontSize: 14,
                            height: 1.7,
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      const SectionTitle(
                        title: 'Facilities',
                        subtitle: 'Layanan unggulan untuk pengalaman menginap terbaik',
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: const [
                          FacilityChip(
                            icon: Icons.wifi_rounded,
                            label: 'Free WiFi',
                          ),
                          FacilityChip(
                            icon: Icons.ac_unit_rounded,
                            label: 'Air Conditioner',
                          ),
                          FacilityChip(
                            icon: Icons.local_parking_rounded,
                            label: 'Parking',
                          ),
                          FacilityChip(
                            icon: Icons.restaurant_rounded,
                            label: 'Restaurant',
                          ),
                          FacilityChip(
                            icon: Icons.pool_rounded,
                            label: 'Swimming Pool',
                          ),
                          FacilityChip(
                            icon: Icons.room_service_rounded,
                            label: 'Room Service',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const SectionTitle(
                        title: 'Gallery Preview',
                        subtitle: 'Lihat suasana hotel dengan tampilan lebih premium',
                      ),
                      const SizedBox(height: 12),
                      const GalleryPreviewSection(),
                      const SizedBox(height: 24),
                      const SectionTitle(
                        title: 'Available Rooms',
                        subtitle: 'Pilih kamar terbaik sesuai kebutuhan user',
                      ),
                      const SizedBox(height: 12),
                      const RoomCard(
                        roomName: 'Deluxe Room',
                        roomInfo:
                        '2 Guest • 1 Double Bed • Breakfast Included',
                        price: 'Rp720.000',
                        badge: 'Best Choice',
                      ),
                      const RoomCard(
                        roomName: 'Executive Room',
                        roomInfo: '2 Guest • 1 Queen Bed • City View',
                        price: 'Rp920.000',
                        badge: 'Business',
                      ),
                      const RoomCard(
                        roomName: 'Suite Room',
                        roomInfo: '3 Guest • 1 King Bed • Premium View',
                        price: 'Rp1.250.000',
                        badge: 'Luxury',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x18000000),
                    blurRadius: 22,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start from',
                          style: TextStyle(
                            color: Color(0xff94a3b8),
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Rp720.000 / night',
                          style: TextStyle(
                            color: Color(0xffd62828),
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffd62828),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Booking Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotelQuickInfoCard extends StatelessWidget {
  const HotelQuickInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: const [
          Row(
            children: [
              Expanded(
                child: InfoMiniItem(
                  icon: Icons.location_on_rounded,
                  title: 'Location',
                  value: 'Jakarta, Jakarta Selatan',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: InfoMiniItem(
                  icon: Icons.schedule_rounded,
                  title: 'Check In',
                  value: '14:00 PM',
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: InfoMiniItem(
                  icon: Icons.bed_rounded,
                  title: 'Room Type',
                  value: 'Suite & Deluxe',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: InfoMiniItem(
                  icon: Icons.support_agent_rounded,
                  title: 'Service',
                  value: '24/7 Available',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoMiniItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoMiniItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xfff8fafc),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xfffde8e8),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xffd62828),
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff94a3b8),
                    fontSize: 11.5,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xff0f172a),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Color(0xff0f172a),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xff94a3b8),
            fontSize: 12.5,
          ),
        ),
      ],
    );
  }
}

class FacilityChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const FacilityChip({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0f000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xffd62828), size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff0f172a),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class GalleryPreviewSection extends StatelessWidget {
  const GalleryPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [
      'assets/1.jpeg',
      'assets/1.jpeg',
      'assets/1.jpeg',
    ];

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.asset(
              images[index],
              width: 145,
              height: 110,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String roomName;
  final String roomInfo;
  final String price;
  final String badge;

  const RoomCard({
    super.key,
    required this.roomName,
    required this.roomInfo,
    required this.price,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xfffde8e8),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.hotel_rounded,
                  color: Color(0xffd62828),
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  roomName,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff0f172a),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xfffde8e8),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  badge,
                  style: const TextStyle(
                    color: Color(0xffd62828),
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            roomInfo,
            style: const TextStyle(
              color: Color(0xff64748b),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              RoomFeaturePill(label: 'WiFi'),
              RoomFeaturePill(label: 'Breakfast'),
              RoomFeaturePill(label: 'Smart TV'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Color(0xffd62828),
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                ' / night',
                style: TextStyle(
                  color: Color(0xff94a3b8),
                  fontSize: 12.5,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffd62828),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Select',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RoomFeaturePill extends StatelessWidget {
  final String label;

  const RoomFeaturePill({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xfff8fafc),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xff475569),
          fontSize: 11.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}