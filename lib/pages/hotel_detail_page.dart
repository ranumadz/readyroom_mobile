import 'package:flutter/material.dart';

class HotelDetailPage extends StatefulWidget {
  const HotelDetailPage({super.key});

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  final List<RoomOption> rooms = const [
    RoomOption(
      name: 'Superior Room',
      info: '2 Tamu • AC • Smart TV • Kamar nyaman untuk short stay',
      transitPrice: 'Rp 75.000',
      fullDayPrice: 'Rp 250.000',
      badge: 'Paling Cepat',
      image: 'assets/1.jpeg',
    ),
    RoomOption(
      name: 'Deluxe Room',
      info: '2 Tamu • Queen Bed • WiFi • Cocok untuk istirahat premium',
      transitPrice: 'Rp 95.000',
      fullDayPrice: 'Rp 320.000',
      badge: 'Best Value',
      image: 'assets/photo_jakarta.jpg',
    ),
    RoomOption(
      name: 'Executive Room',
      info: '2 Tamu • Ruang lebih lega • View kota • Full Day nyaman',
      transitPrice: 'Rp 125.000',
      fullDayPrice: 'Rp 420.000',
      badge: 'Premium',
      image: 'assets/destinasi_bali.jpg',
    ),
  ];

  void _openBookingSheet(RoomOption room) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BookingSheet(
        room: room,
        onSuccess: (bookingCode) {
          _showSuccessSheet(bookingCode, room);
        },
      ),
    );
  }

  void _showSuccessSheet(String bookingCode, RoomOption room) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => SuccessBookingSheet(
        bookingCode: bookingCode,
        roomName: room.name,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReadyRoomColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 330,
                pinned: true,
                elevation: 0,
                backgroundColor: ReadyRoomColors.dark,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const GlassCircleButton(
                      icon: Icons.arrow_back_rounded,
                    ),
                  ),
                ),
                actions: const [
                  GlassCircleButton(icon: Icons.ios_share_rounded),
                  SizedBox(width: 8),
                  GlassCircleButton(icon: Icons.favorite_border_rounded),
                  SizedBox(width: 14),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(38),
                          bottomRight: Radius.circular(38),
                        ),
                        child: Image.asset(
                          'assets/1.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(38),
                            bottomRight: Radius.circular(38),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x55000000),
                              Color(0x22000000),
                              Color(0xdd0f172a),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        right: 18,
                        bottom: 28,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const PremiumBadge(
                                  label: 'ReadyRoom',
                                  icon: Icons.verified_rounded,
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 7,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.16),
                                    borderRadius: BorderRadius.circular(999),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.20),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '4.8',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'ReadyRoom Gancit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                                height: 1.05,
                              ),
                            ),
                            const SizedBox(height: 7),
                            const Text(
                              'Booking hotel Transit dan Full Day lebih cepat di area Jakarta Selatan.',
                              style: TextStyle(
                                color: Color(0xffe5e7eb),
                                fontSize: 13.5,
                                height: 1.45,
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Row(
                              children: [
                                HeroInfoPill(
                                  icon: Icons.location_on_rounded,
                                  label: 'Gandaria City',
                                ),
                                SizedBox(width: 8),
                                HeroInfoPill(
                                  icon: Icons.access_time_rounded,
                                  label: 'Transit 3/6/12 Jam',
                                ),
                              ],
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
                        title: 'Kenapa pilih cabang ini?',
                        subtitle: 'Ringkas, cepat, dan cocok untuk kebutuhan operasional harian.',
                      ),
                      const SizedBox(height: 12),
                      const AboutReadyRoomCard(),
                      const SizedBox(height: 22),
                      const SectionTitle(
                        title: 'Fasilitas Utama',
                        subtitle: 'Fasilitas yang membantu customer merasa aman dan nyaman.',
                      ),
                      const SizedBox(height: 12),
                      const Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          FacilityChip(
                            icon: Icons.wifi_rounded,
                            label: 'WiFi',
                          ),
                          FacilityChip(
                            icon: Icons.ac_unit_rounded,
                            label: 'AC',
                          ),
                          FacilityChip(
                            icon: Icons.tv_rounded,
                            label: 'Smart TV',
                          ),
                          FacilityChip(
                            icon: Icons.local_parking_rounded,
                            label: 'Parkir',
                          ),
                          FacilityChip(
                            icon: Icons.cleaning_services_rounded,
                            label: 'Cleaning',
                          ),
                          FacilityChip(
                            icon: Icons.support_agent_rounded,
                            label: 'Bantuan Admin',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const SectionTitle(
                        title: 'Room Shorts',
                        subtitle: 'Preview singkat ala video pendek untuk lihat suasana kamar.',
                      ),
                      const SizedBox(height: 12),
                      const RoomShortsPreview(),
                      const SizedBox(height: 24),
                      const SectionTitle(
                        title: 'Pilih Kamar',
                        subtitle: 'Pilih tipe kamar, lalu lanjutkan ke simulasi booking customer.',
                      ),
                      const SizedBox(height: 12),
                      ...rooms.map(
                            (room) => RoomCard(
                          room: room,
                          onBook: () => _openBookingSheet(room),
                        ),
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
            child: BottomBookingBar(
              onBook: () => _openBookingSheet(rooms.first),
            ),
          ),
        ],
      ),
    );
  }
}

class RoomOption {
  final String name;
  final String info;
  final String transitPrice;
  final String fullDayPrice;
  final String badge;
  final String image;

  const RoomOption({
    required this.name,
    required this.info,
    required this.transitPrice,
    required this.fullDayPrice,
    required this.badge,
    required this.image,
  });
}

class ReadyRoomColors {
  static const red = Color(0xffd62828);
  static const redDark = Color(0xff991b1b);
  static const dark = Color(0xff0f172a);
  static const muted = Color(0xff64748b);
  static const softRed = Color(0xffffeeee);
  static const background = Color(0xfff5f6fb);
}

class GlassCircleButton extends StatelessWidget {
  final IconData icon;

  const GlassCircleButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 14,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Icon(icon, color: ReadyRoomColors.dark, size: 20),
    );
  }
}

class PremiumBadge extends StatelessWidget {
  final String label;
  final IconData icon;

  const PremiumBadge({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: ReadyRoomColors.red, size: 15),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              color: ReadyRoomColors.dark,
              fontWeight: FontWeight.w900,
              fontSize: 11.5,
            ),
          ),
        ],
      ),
    );
  }
}

class HeroInfoPill extends StatelessWidget {
  final IconData icon;
  final String label;

  const HeroInfoPill({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.14),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.white.withOpacity(0.16)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 15),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 11.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelQuickInfoCard extends StatelessWidget {
  const HotelQuickInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InfoMiniItem(
                  icon: Icons.flash_on_rounded,
                  title: 'Flow',
                  value: 'Pending Admin',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InfoMiniItem(
                  icon: Icons.schedule_rounded,
                  title: 'Check In',
                  value: 'Fleksibel',
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InfoMiniItem(
                  icon: Icons.king_bed_rounded,
                  title: 'Booking',
                  value: 'Transit / Full Day',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: InfoMiniItem(
                  icon: Icons.confirmation_number_rounded,
                  title: 'Kode',
                  value: 'Siap dibawa',
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
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xfff8fafc),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffeef2f7)),
      ),
      child: Row(
        children: [
          Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              color: ReadyRoomColors.softRed,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: ReadyRoomColors.red, size: 19),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff94a3b8),
                    fontSize: 10.8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: ReadyRoomColors.dark,
                    fontWeight: FontWeight.w900,
                    fontSize: 12.2,
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

class AboutReadyRoomCard extends StatelessWidget {
  const AboutReadyRoomCard({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cabang ini disiapkan untuk customer yang butuh kamar cepat, nyaman, dan jelas alurnya. Setelah booking dibuat, kode booking akan diproses oleh admin dari dashboard ReadyRoom.',
            style: TextStyle(
              color: ReadyRoomColors.muted,
              fontSize: 14,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(
                child: MiniProcessCard(
                  number: '1',
                  title: 'Pilih Kamar',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MiniProcessCard(
                  number: '2',
                  title: 'Isi Data',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: MiniProcessCard(
                  number: '3',
                  title: 'Kode Jadi',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MiniProcessCard extends StatelessWidget {
  final String number;
  final String title;

  const MiniProcessCard({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xfffff7f7),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffffdddd)),
      ),
      child: Column(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: ReadyRoomColors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: ReadyRoomColors.dark,
              fontWeight: FontWeight.w800,
              fontSize: 11.5,
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
            fontWeight: FontWeight.w900,
            color: ReadyRoomColors.dark,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xff94a3b8),
            fontSize: 12.5,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class FacilityChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const FacilityChip({super.key, required this.icon, required this.label});

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
          Icon(icon, color: ReadyRoomColors.red, size: 18),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: ReadyRoomColors.dark,
              fontWeight: FontWeight.w800,
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }
}

class RoomShortsPreview extends StatelessWidget {
  const RoomShortsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    const shorts = [
      {
        'image': 'assets/1.jpeg',
        'title': 'Preview Kamar',
        'tag': '15 detik',
      },
      {
        'image': 'assets/photo_jakarta.jpg',
        'title': 'Transit Cepat',
        'tag': 'Populer',
      },
      {
        'image': 'assets/destinasi_bali.jpg',
        'title': 'Full Day Nyaman',
        'tag': 'Promo',
      },
    ];

    return SizedBox(
      height: 176,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: shorts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = shorts[index];
          return Container(
            width: 126,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 16,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    item['image']!,
                    width: 126,
                    height: 176,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0xcc000000),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: ReadyRoomColors.red,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['tag']!,
                        style: const TextStyle(
                          color: Color(0xffe5e7eb),
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final RoomOption room;
  final VoidCallback onBook;

  const RoomCard({super.key, required this.room, required this.onBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
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
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(26),
                ),
                child: Image.asset(
                  room.image,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.93),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    room.badge,
                    style: const TextStyle(
                      color: ReadyRoomColors.red,
                      fontWeight: FontWeight.w900,
                      fontSize: 11.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        room.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: ReadyRoomColors.dark,
                        ),
                      ),
                    ),
                    const Icon(Icons.star_rounded, color: Colors.orange, size: 18),
                    const SizedBox(width: 4),
                    const Text(
                      '4.8',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: ReadyRoomColors.dark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  room.info,
                  style: const TextStyle(
                    color: ReadyRoomColors.muted,
                    height: 1.45,
                    fontSize: 13.2,
                  ),
                ),
                const SizedBox(height: 12),
                const Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    RoomFeaturePill(label: 'Transit'),
                    RoomFeaturePill(label: 'Full Day'),
                    RoomFeaturePill(label: 'Kode Booking'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            room.transitPrice,
                            style: const TextStyle(
                              color: ReadyRoomColors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Transit mulai 3 jam • Full Day ${room.fullDayPrice}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xff94a3b8),
                              fontSize: 11.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onBook,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ReadyRoomColors.red,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Pesan',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoomFeaturePill extends StatelessWidget {
  final String label;

  const RoomFeaturePill({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xfff8fafc),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xffeef2f7)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xff475569),
          fontSize: 11.5,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class BottomBookingBar extends StatelessWidget {
  final VoidCallback onBook;

  const BottomBookingBar({super.key, required this.onBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Mulai dari',
                  style: TextStyle(
                    color: Color(0xff94a3b8),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Rp 75.000 / Transit',
                  style: TextStyle(
                    color: ReadyRoomColors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: onBook,
            icon: const Icon(Icons.flash_on_rounded, size: 18),
            label: const Text('Pesan'),
            style: ElevatedButton.styleFrom(
              backgroundColor: ReadyRoomColors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              textStyle: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}

class BookingSheet extends StatefulWidget {
  final RoomOption room;
  final ValueChanged<String> onSuccess;

  const BookingSheet({super.key, required this.room, required this.onSuccess});

  @override
  State<BookingSheet> createState() => _BookingSheetState();
}

class _BookingSheetState extends State<BookingSheet> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  String bookingType = 'Transit';
  String duration = '3 Jam';
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    noteController.dispose();
    super.dispose();
  }

  String get dateText {
    if (selectedDate == null) return 'Pilih tanggal';
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];
    return '${selectedDate!.day} ${months[selectedDate!.month - 1]} ${selectedDate!.year}';
  }

  String get timeText {
    if (selectedTime == null) return 'Pilih jam';
    final hour = selectedTime!.hour.toString().padLeft(2, '0');
    final minute = selectedTime!.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String get totalPrice {
    if (bookingType == 'Full Day') return widget.room.fullDayPrice;
    if (duration == '6 Jam') return 'Rp 125.000';
    if (duration == '12 Jam') return 'Rp 175.000';
    return widget.room.transitPrice;
  }

  Future<void> pickDate() async {
    final now = DateTime.now();
    final result = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 90)),
      helpText: 'Pilih tanggal check-in',
      confirmText: 'OK',
      cancelText: 'Batal',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ReadyRoomColors.red,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: ReadyRoomColors.dark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (result != null) {
      setState(() => selectedDate = result);
    }
  }

  Future<void> pickTime() async {
    final result = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      helpText: 'Pilih jam check-in',
      confirmText: 'OK',
      cancelText: 'Batal',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ReadyRoomColors.red,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: ReadyRoomColors.dark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (result != null) {
      setState(() => selectedTime = result);
    }
  }

  void submitBooking() {
    if (nameController.text.trim().isEmpty) {
      showMessage('Nama tamu wajib diisi');
      return;
    }

    if (phoneController.text.trim().isEmpty) {
      showMessage('Nomor WhatsApp wajib diisi');
      return;
    }

    if (selectedDate == null || selectedTime == null) {
      showMessage('Tanggal dan jam check-in wajib dipilih');
      return;
    }

    final code = 'RR-MOBILE-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
    Navigator.pop(context);
    widget.onSuccess(code);
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: ReadyRoomColors.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xffe5e7eb),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: ReadyRoomColors.softRed,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.king_bed_rounded, color: ReadyRoomColors.red),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.room.name,
                          style: const TextStyle(
                            color: ReadyRoomColors.dark,
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'Simulasi booking customer mobile',
                          style: TextStyle(
                            color: ReadyRoomColors.muted,
                            fontSize: 12.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: ChoicePill(
                      selected: bookingType == 'Transit',
                      title: 'Transit',
                      onTap: () => setState(() {
                        bookingType = 'Transit';
                        duration = '3 Jam';
                      }),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ChoicePill(
                      selected: bookingType == 'Full Day',
                      title: 'Full Day',
                      onTap: () => setState(() {
                        bookingType = 'Full Day';
                        duration = '1 Hari';
                      }),
                    ),
                  ),
                ],
              ),
              if (bookingType == 'Transit') ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    for (final item in ['3 Jam', '6 Jam', '12 Jam']) ...[
                      Expanded(
                        child: ChoicePill(
                          selected: duration == item,
                          title: item,
                          compact: true,
                          onTap: () => setState(() => duration = item),
                        ),
                      ),
                      if (item != '12 Jam') const SizedBox(width: 8),
                    ],
                  ],
                ),
              ],
              const SizedBox(height: 16),
              ReadyRoomTextField(
                controller: nameController,
                label: 'Nama Tamu',
                hint: 'Contoh: Ranu',
                icon: Icons.person_rounded,
              ),
              const SizedBox(height: 12),
              ReadyRoomTextField(
                controller: phoneController,
                label: 'Nomor WhatsApp',
                hint: 'Contoh: 0812...',
                icon: Icons.phone_rounded,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: PickerCard(
                      icon: Icons.calendar_month_rounded,
                      title: 'Tanggal',
                      value: dateText,
                      onTap: pickDate,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: PickerCard(
                      icon: Icons.access_time_rounded,
                      title: 'Jam',
                      value: timeText,
                      onTap: pickTime,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ReadyRoomTextField(
                controller: noteController,
                label: 'Catatan Opsional',
                hint: 'Contoh: Datang agak malam',
                icon: Icons.notes_rounded,
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xfffff7f7),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xffffdddd)),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estimasi Harga',
                            style: TextStyle(
                              color: ReadyRoomColors.muted,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Status awal: Menunggu Approval',
                            style: TextStyle(
                              color: ReadyRoomColors.dark,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      totalPrice,
                      style: const TextStyle(
                        color: ReadyRoomColors.red,
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: submitBooking,
                  icon: const Icon(Icons.check_circle_rounded),
                  label: const Text('Buat Booking Dummy'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ReadyRoomColors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Catatan: ini masih dummy UI. Nanti tombol ini akan dikoneksikan ke API Laravel agar booking masuk ke Booking List admin web.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff94a3b8),
                  fontSize: 11.5,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoicePill extends StatelessWidget {
  final bool selected;
  final String title;
  final VoidCallback onTap;
  final bool compact;

  const ChoicePill({
    super.key,
    required this.selected,
    required this.title,
    required this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(vertical: compact ? 11 : 14),
        decoration: BoxDecoration(
          color: selected ? ReadyRoomColors.red : const Color(0xfff8fafc),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? ReadyRoomColors.red : const Color(0xffe5e7eb),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : ReadyRoomColors.dark,
              fontWeight: FontWeight.w900,
              fontSize: compact ? 12.5 : 14,
            ),
          ),
        ),
      ),
    );
  }
}

class ReadyRoomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final int maxLines;
  final TextInputType? keyboardType;

  const ReadyRoomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: ReadyRoomColors.dark,
            fontWeight: FontWeight.w900,
            fontSize: 12.5,
          ),
        ),
        const SizedBox(height: 7),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xff94a3b8)),
            prefixIcon: Icon(icon, color: ReadyRoomColors.red, size: 20),
            filled: true,
            fillColor: const Color(0xfff8fafc),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: ReadyRoomColors.red, width: 1.2),
            ),
          ),
        ),
      ],
    );
  }
}

class PickerCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const PickerCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: const Color(0xfff8fafc),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xffe5e7eb)),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: ReadyRoomColors.softRed,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: ReadyRoomColors.red, size: 19),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xff94a3b8),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ReadyRoomColors.dark,
                      fontSize: 12.2,
                      fontWeight: FontWeight.w900,
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
}

class SuccessBookingSheet extends StatelessWidget {
  final String bookingCode;
  final String roomName;

  const SuccessBookingSheet({
    super.key,
    required this.bookingCode,
    required this.roomName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(
              color: const Color(0xffdcfce7),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xff16a34a),
              size: 48,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Booking Dummy Berhasil',
            style: TextStyle(
              color: ReadyRoomColors.dark,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Simulasi booking untuk $roomName sudah dibuat. Nanti kode ini akan masuk ke dashboard admin setelah API disambungkan.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ReadyRoomColors.muted,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xfffff7f7),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xffffdddd)),
            ),
            child: Column(
              children: [
                const Text(
                  'Kode Booking',
                  style: TextStyle(
                    color: ReadyRoomColors.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  bookingCode,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ReadyRoomColors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: ReadyRoomColors.dark,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Mengerti',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
