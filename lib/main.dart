import 'package:flutter/material.dart';
import 'pages/hotel_detail_page.dart';
import 'pages/notifications_page.dart';

void main() {
  runApp(const ReadyRoomApp());
}

class ReadyRoomApp extends StatelessWidget {
  const ReadyRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReadyRoom',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xfff6f7fb),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffd62828),
          primary: const Color(0xffd62828),
          secondary: const Color(0xffff6b6b),
          surface: Colors.white,
        ),
      ),
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ExplorePage(),
    BookingPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x10000000),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: NavigationBar(
            height: 68,
            backgroundColor: Colors.white,
            indicatorColor: const Color(0xfffde8e8),
            selectedIndex: _currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore_rounded),
                label: 'Explore',
              ),
              NavigationDestination(
                icon: Icon(Icons.receipt_long_outlined),
                selectedIcon: Icon(Icons.receipt_long_rounded),
                label: 'Booking',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> destinations = const [
    {
      'image': 'assets/destinasi_bali.jpg',
      'city': 'Bali',
      'subtitle': 'Beach Escape',
    },
    {
      'image': 'assets/photo_jakarta.jpg',
      'city': 'Jakarta',
      'subtitle': 'Business Hub',
    },
    {
      'image': 'assets/destinasi_jogj.png',
      'city': 'Jogja',
      'subtitle': 'Culture Stay',
    },
    {
      'image': 'assets/tebing-breksi.jpg',
      'city': 'Semarang',
      'subtitle': 'Urban Trip',
    },
    {
      'image': 'assets/destinasi aceh.jpg',
      'city': 'Aceh',
      'subtitle': 'Hidden Paradise',
    },
  ];

  final List<Map<String, dynamic>> hotels = const [
    {
      'name': 'Ocean View Resort',
      'city': 'Bali',
      'price': 'Rp720.000',
      'rating': '4.8',
      'tag': 'Best Seller',
      'image': 'assets/destinasi_bali.jpg',
    },
    {
      'name': 'Jakarta Business Hotel',
      'city': 'Jakarta',
      'price': 'Rp600.000',
      'rating': '4.7',
      'tag': 'Business',
      'image': 'assets/photo_jakarta.jpg',
    },
    {
      'name': 'Jogja Heritage Stay',
      'city': 'Jogja',
      'price': 'Rp540.000',
      'rating': '4.9',
      'tag': 'Popular',
      'image': 'assets/destinasi_jogj.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          const SizedBox(height: 10),
          const HomeTopBar(),
          const SizedBox(height: 14),
          const SearchBarSection(),
          const SizedBox(height: 16),
          const WalletSection(),
          const SizedBox(height: 18),
          const FeatureMenuSection(),
          const SizedBox(height: 24),
          SectionHeader(
            title: 'Destinasi Pilihan',
            subtitle: 'Pilih kota favorit dengan vibe modern dan cepat',
            onSeeAll: () {},
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 170,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                final item = destinations[index];
                return PremiumDestinationCard(
                  image: item['image']!,
                  city: item['city']!,
                  subtitle: item['subtitle']!,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          const MiniPromoSection(),
          const SizedBox(height: 24),
          SectionHeader(
            title: 'Rekomendasi Hotel',
            subtitle: 'Hotel pilihan dengan Nuansa Ekslusif',
            onSeeAll: () {},
          ),
          const SizedBox(height: 14),
          ...hotels.map(
                (hotel) => PremiumHotelCard(
              name: hotel['name'],
              city: hotel['city'],
              price: hotel['price'],
              rating: hotel['rating'],
              tag: hotel['tag'],
              image: hotel['image'],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xffd62828),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26d62828),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              'assets/readyroom.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ReadyRoom',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Tempat Rehat Paling Tepat',
                  style: TextStyle(
                    color: Color(0xffffe3e3),
                    fontSize: 12.5,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationsPage(),
                ),
              );
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.white,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
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

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search hotel, destination, or branch',
              hintStyle: const TextStyle(color: Color(0xff94a3b8)),
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xffd62828),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.tune_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              filled: true,
              fillColor: const Color(0xfff8fafc),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(
                child: SearchMiniCard(
                  icon: Icons.calendar_month_rounded,
                  title: 'Check In',
                  value: '21 Apr 2026',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: SearchMiniCard(
                  icon: Icons.access_time_rounded,
                  title: 'Duration',
                  value: 'Overnight',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchMiniCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const SearchMiniCard({
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
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xfffde8e8),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xffd62828), size: 19),
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
                    fontSize: 11.5,
                  ),
                ),
                const SizedBox(height: 2),
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

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffb71c1c),
            Color(0xffd62828),
            Color(0xffef5350),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26d62828),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'ReadyRoom Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
              ),
              Icon(
                Icons.account_balance_wallet_rounded,
                color: Color(0xffffdcdc),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Kini kamu bisa bayar dengan ReadyRoom Pay',
              style: TextStyle(
                color: Color(0xffffdfdf),
                fontSize: 12.5,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.10)),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: WalletInfoItem(
                    title: 'Saldo',
                    value: 'Rp 2.450.000',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: WalletInfoItem(
                    title: 'Points',
                    value: '1.280',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(
                child: WalletActionButton(
                  icon: Icons.add_card_rounded,
                  label: 'Top Up',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: WalletActionButton(
                  icon: Icons.send_rounded,
                  label: 'Transfer',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: WalletActionButton(
                  icon: Icons.qr_code_scanner_rounded,
                  label: 'Pay',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WalletInfoItem extends StatelessWidget {
  final String title;
  final String value;

  const WalletInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xffffdada),
            fontSize: 11.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class WalletActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const WalletActionButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xffffecec), size: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureMenuSection extends StatelessWidget {
  const FeatureMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.hourglass_bottom_rounded, 'title': 'Transit'},
      {'icon': Icons.king_bed_rounded, 'title': 'Deluxe'},
      {'icon': Icons.apartment_rounded, 'title': 'Hotel'},
      {'icon': Icons.local_offer_rounded, 'title': 'Promo'},
      {'icon': Icons.map_rounded, 'title': 'Nearby'},
      {'icon': Icons.work_outline_rounded, 'title': 'Business'},
      {'icon': Icons.family_restroom_rounded, 'title': 'Family'},
      {'icon': Icons.star_outline_rounded, 'title': 'Luxury'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Smart Fitur',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff0f172a),
                  ),
                ),
              ),
              Text(
                'Ready for scale',
                style: TextStyle(
                  color: Color(0xffd62828),
                  fontWeight: FontWeight.w700,
                  fontSize: 12.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 16,
              childAspectRatio: 0.78,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return PremiumMenuItem(
                icon: item['icon'] as IconData,
                title: item['title'] as String,
              );
            },
          ),
        ],
      ),
    );
  }
}

class PremiumMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const PremiumMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: const Color(0xfff8fafc),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(icon, color: const Color(0xffd62828), size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xff0f172a),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onSeeAll;

  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
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
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onSeeAll,
            child: const Text(
              'See all',
              style: TextStyle(
                color: Color(0xffd62828),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PremiumDestinationCard extends StatelessWidget {
  final String image;
  final String city;
  final String subtitle;

  const PremiumDestinationCard({
    super.key,
    required this.image,
    required this.city,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      margin: const EdgeInsets.only(right: 14),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.asset(
              image,
              width: 144,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xaa000000),
                ],
              ),
            ),
          ),
          Positioned(
            left: 14,
            right: 14,
            bottom: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xffe5e7eb),
                    fontSize: 11.5,
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

class MiniPromoSection extends StatelessWidget {
  const MiniPromoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff111827),
            Color(0xff222938),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Spesial Diskon',
                  style: TextStyle(
                    color: Color(0xffffd4d4),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.5,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Temukan Banyak Promo Dengan Berlangganan ReadyRoom VIP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 1.25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Banyak Berbagai Pilihan Promo',
                  style: TextStyle(
                    color: Color(0xffd1d5db),
                    fontSize: 12,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.workspace_premium_rounded,
              color: Color(0xffffd4d4),
              size: 38,
            ),
          ),
        ],
      ),
    );
  }
}

class PremiumHotelCard extends StatelessWidget {
  final String name;
  final String city;
  final String price;
  final String rating;
  final String tag;
  final String image;

  const PremiumHotelCard({
    super.key,
    required this.name,
    required this.city,
    required this.price,
    required this.rating,
    required this.tag,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HotelDetailPage(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 14),
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
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(26),
                  ),
                  child: Image.asset(
                    image,
                    height: 175,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: Color(0xffd62828),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.orange,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff111827),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Color(0xff0f172a),
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Color(0xffd62828),
                        size: 17,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        city,
                        style: const TextStyle(
                          color: Color(0xff64748b),
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.bed_rounded,
                        size: 16,
                        color: Color(0xff94a3b8),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '2 Guest',
                        style: TextStyle(
                          color: Color(0xff94a3b8),
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      HotelFeaturePill(label: 'Free WiFi'),
                      HotelFeaturePill(label: 'Breakfast'),
                      HotelFeaturePill(label: 'Parking'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: price,
                          style: const TextStyle(
                            color: Color(0xffd62828),
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                          children: const [
                            TextSpan(
                              text: ' / night',
                              style: TextStyle(
                                color: Color(0xff94a3b8),
                                fontSize: 12.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const HotelDetailPage(),
                            ),
                          );
                        },
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
                          'View Detail',
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
            ),
          ],
        ),
      ),
    );
  }
}

class HotelFeaturePill extends StatelessWidget {
  final String label;

  const HotelFeaturePill({super.key, required this.label});

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

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Explore',
      subtitle: 'Halaman explore siap kamu upgrade berikutnya.',
      icon: Icons.explore_rounded,
    );
  }
}

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'My Booking',
      subtitle: 'Nanti di sini isi booking pending, confirmed, dan completed.',
      icon: Icons.receipt_long_rounded,
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Favorite',
      subtitle: 'Simpan hotel favorit user dengan tampilan clean premium.',
      icon: Icons.favorite_rounded,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Profile',
      subtitle: 'Nanti isi akun, bantuan, logout, dan pengaturan user.',
      icon: Icons.person_rounded,
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const PlaceholderPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: Color(0x10000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 82,
                height: 82,
                decoration: BoxDecoration(
                  color: const Color(0xfffde8e8),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(icon, color: const Color(0xffd62828), size: 42),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff0f172a),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff64748b),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}