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
        scaffoldBackgroundColor: const Color(0xfff5f6fa),
        colorScheme: ColorScheme.fromSeed(
          seedColor: ReadyRoomColors.red,
          primary: ReadyRoomColors.red,
          secondary: ReadyRoomColors.redSoft,
          surface: Colors.white,
        ),
      ),
      home: const ReadyRoomSplashScreen(),
    );
  }
}

class ReadyRoomColors {
  static const red = Color(0xffd62828);
  static const redDark = Color(0xff8f1212);
  static const redSoft = Color(0xffff6b6b);
  static const navy = Color(0xff0f172a);
  static const muted = Color(0xff64748b);
  static const bg = Color(0xfff5f6fa);
  static const softRed = Color(0xffffeeee);
  static const green = Color(0xff10b981);
  static const amber = Color(0xfff59e0b);
}

class ReadyRoomSplashScreen extends StatefulWidget {
  const ReadyRoomSplashScreen({super.key});

  @override
  State<ReadyRoomSplashScreen> createState() => _ReadyRoomSplashScreenState();
}

class _ReadyRoomSplashScreenState extends State<ReadyRoomSplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1600), () {
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 650),
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child: const MainNavigationPage(),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReadyRoomColors.navy,
      body: Stack(
        children: [
          Positioned(
            top: -80,
            right: -80,
            child: _GlowCircle(
              size: 220,
              color: ReadyRoomColors.red.withOpacity(0.35),
            ),
          ),
          Positioned(
            bottom: -90,
            left: -70,
            child: _GlowCircle(
              size: 240,
              color: ReadyRoomColors.redSoft.withOpacity(0.22),
            ),
          ),
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.86, end: 1),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeOutBack,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Opacity(
                    opacity: value.clamp(0.0, 1.0),
                    child: child,
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 102,
                    height: 102,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: ReadyRoomColors.red.withOpacity(0.34),
                          blurRadius: 42,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/readyroom.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'ReadyRoom',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Booking Transit & Full Day lebih cepat',
                    style: TextStyle(
                      color: Color(0xffcbd5e1),
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(99),
                      child: const LinearProgressIndicator(
                        minHeight: 5,
                        backgroundColor: Color(0x22ffffff),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          ReadyRoomColors.redSoft,
                        ),
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

class _GlowCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _GlowCircle({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
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
      backgroundColor: ReadyRoomColors.bg,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 260),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x16000000),
                blurRadius: 22,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: NavigationBar(
            height: 70,
            backgroundColor: Colors.white,
            indicatorColor: ReadyRoomColors.softRed,
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
                label: 'Beranda',
              ),
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore_rounded),
                label: 'Cari',
              ),
              NavigationDestination(
                icon: Icon(Icons.receipt_long_outlined),
                selectedIcon: Icon(Icons.receipt_long_rounded),
                label: 'Booking',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: 'Favorit',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isIndonesia = true;
  String selectedType = 'Transit';

  final List<Map<String, String>> branches = const [
    {
      'image': 'assets/photo_jakarta.jpg',
      'city': 'Gancit',
      'subtitle': 'Jakarta Selatan',
      'badge': 'Aktif',
    },
    {
      'image': 'assets/destinasi_bali.jpg',
      'city': 'Gandaria',
      'subtitle': 'Transit & Full Day',
      'badge': 'Ramai',
    },
    {
      'image': 'assets/destinasi_jogj.png',
      'city': 'Tebet',
      'subtitle': 'Booking cepat',
      'badge': 'Promo',
    },
    {
      'image': 'assets/tebing-breksi.jpg',
      'city': 'Fatmawati',
      'subtitle': 'Area strategis',
      'badge': 'Baru',
    },
  ];

  final List<Map<String, dynamic>> hotels = const [
    {
      'name': 'ReadyRoom Gancit',
      'city': 'Jakarta Selatan',
      'price': 'Rp 75.000',
      'priceNote': 'mulai 3 jam',
      'rating': '4.8',
      'tag': 'Transit Cepat',
      'image': 'assets/photo_jakarta.jpg',
    },
    {
      'name': 'ReadyRoom Gandaria',
      'city': 'Jakarta Selatan',
      'price': 'Rp 150.000',
      'priceNote': 'Full Day',
      'rating': '4.7',
      'tag': 'Full Day',
      'image': 'assets/destinasi_bali.jpg',
    },
    {
      'name': 'ReadyRoom Tebet',
      'city': 'Jakarta',
      'price': 'Rp 95.000',
      'priceNote': 'Transit',
      'rating': '4.9',
      'tag': 'Promo Cabang',
      'image': 'assets/destinasi_jogj.png',
    },
  ];

  void showComingSoon(String title) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => ReadyRoomSuccessSheet(title: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 28),
        children: [
          const SizedBox(height: 10),
          HomeHeroTopBar(
            isIndonesia: isIndonesia,
            onLanguageTap: () {
              setState(() {
                isIndonesia = !isIndonesia;
              });
            },
          ),
          const SizedBox(height: 14),
          SearchBookingCard(
            selectedType: selectedType,
            onTypeChanged: (value) {
              setState(() {
                selectedType = value;
              });
            },
            onSearch: () => showComingSoon('Pencarian kamar sedang disiapkan'),
          ),
          const SizedBox(height: 16),
          FastBookingBanner(
            selectedType: selectedType,
            onTap: () => showComingSoon('Simulasi booking berhasil'),
          ),
          const SizedBox(height: 18),
          const IndonesianFeatureSection(),
          const SizedBox(height: 24),
          SectionHeader(
            title: 'Room Shorts',
            subtitle: 'Preview kamar singkat ala platform besar',
            onSeeAll: () => showComingSoon('Room Shorts segera hadir'),
          ),
          const SizedBox(height: 14),
          const RoomShortsSection(),
          const SizedBox(height: 24),
          SectionHeader(
            title: 'Cabang Populer',
            subtitle: 'Pilih cabang ReadyRoom terdekat untuk Transit atau Full Day',
            onSeeAll: () => showComingSoon('Daftar cabang segera hadir'),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 176,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: branches.length,
              itemBuilder: (context, index) {
                final item = branches[index];
                return PremiumBranchCard(
                  image: item['image']!,
                  city: item['city']!,
                  subtitle: item['subtitle']!,
                  badge: item['badge']!,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          MiniPromoSection(
            onTap: () => showComingSoon('Promo ReadyRoom segera aktif'),
          ),
          const SizedBox(height: 24),
          SectionHeader(
            title: 'Hotel ReadyRoom',
            subtitle: 'Pilihan kamar untuk booking cepat dari aplikasi customer',
            onSeeAll: () => showComingSoon('Semua hotel segera hadir'),
          ),
          const SizedBox(height: 14),
          ...hotels.map(
                (hotel) => PremiumHotelCard(
              name: hotel['name'],
              city: hotel['city'],
              price: hotel['price'],
              priceNote: hotel['priceNote'],
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

class HomeHeroTopBar extends StatelessWidget {
  final bool isIndonesia;
  final VoidCallback onLanguageTap;

  const HomeHeroTopBar({
    super.key,
    required this.isIndonesia,
    required this.onLanguageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ReadyRoomColors.redDark,
            ReadyRoomColors.red,
            ReadyRoomColors.redSoft,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: ReadyRoomColors.red.withOpacity(0.28),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -18,
            bottom: -30,
            child: Icon(
              Icons.apartment_rounded,
              size: 120,
              color: Colors.white.withOpacity(0.07),
            ),
          ),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(17),
                  border: Border.all(color: Colors.white.withOpacity(0.18)),
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
                        fontWeight: FontWeight.w900,
                        fontSize: 19,
                        letterSpacing: -0.4,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Booking Transit & Full Day lebih cepat',
                      style: TextStyle(
                        color: Color(0xffffe3e3),
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onLanguageTap,
                child: Container(
                  height: 38,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                  ),
                  child: Center(
                    child: Text(
                      isIndonesia ? 'ID' : 'EN',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
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
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.white,
                      ),
                      Positioned(
                        top: 9,
                        right: 9,
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
        ],
      ),
    );
  }
}

class SearchBookingCard extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onTypeChanged;
  final VoidCallback onSearch;

  const SearchBookingCard({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final isTransit = selectedType == 'Transit';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 22,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari cabang, hotel, atau area',
              hintStyle: const TextStyle(color: Color(0xff94a3b8)),
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ReadyRoomColors.red,
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
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xfff8fafc),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _TypeButton(
                    label: 'Transit',
                    icon: Icons.access_time_rounded,
                    selected: isTransit,
                    onTap: () => onTypeChanged('Transit'),
                  ),
                ),
                Expanded(
                  child: _TypeButton(
                    label: 'Full Day',
                    icon: Icons.king_bed_rounded,
                    selected: !isTransit,
                    onTap: () => onTypeChanged('Full Day'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Expanded(
                child: SearchMiniCard(
                  icon: Icons.calendar_month_rounded,
                  title: 'Check In',
                  value: 'Pilih tanggal',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SearchMiniCard(
                  icon: isTransit
                      ? Icons.timer_rounded
                      : Icons.night_shelter_rounded,
                  title: isTransit ? 'Durasi' : 'Tipe',
                  value: isTransit ? '3 / 6 / 12 Jam' : 'Sampai 12.00',
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onSearch,
              icon: const Icon(Icons.search_rounded, size: 20),
              label: const Text('Cari Kamar ReadyRoom'),
              style: ElevatedButton.styleFrom(
                backgroundColor: ReadyRoomColors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _TypeButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: selected ? ReadyRoomColors.red : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected ? Colors.white : ReadyRoomColors.muted,
                size: 18,
              ),
              const SizedBox(width: 7),
              Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.white : ReadyRoomColors.navy,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
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
                    fontSize: 11.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    color: ReadyRoomColors.navy,
                    fontWeight: FontWeight.w800,
                    fontSize: 12.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FastBookingBanner extends StatelessWidget {
  final String selectedType;
  final VoidCallback onTap;

  const FastBookingBanner({
    super.key,
    required this.selectedType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.98, end: 1),
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff111827),
                Color(0xff7f1d1d),
                ReadyRoomColors.red,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: ReadyRoomColors.red.withOpacity(0.25),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                right: -26,
                bottom: -38,
                child: Icon(
                  Icons.bolt_rounded,
                  color: Colors.white.withOpacity(0.10),
                  size: 150,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Booking Cepat ReadyRoom',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 19,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.verified_rounded,
                        color: Color(0xffffdcdc),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Mode aktif: $selectedType. Pilih cabang, tentukan waktu, lalu kode booking masuk ke dashboard admin.',
                    style: const TextStyle(
                      color: Color(0xffffdfdf),
                      fontSize: 12.5,
                      height: 1.45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(
                        child: BannerStatCard(
                          title: 'Status Awal',
                          value: 'Menunggu Approval',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: BannerStatCard(
                          title: 'Kode',
                          value: 'RR- otomatis',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Row(
                    children: [
                      Expanded(
                        child: BannerMiniAction(
                          icon: Icons.access_time_rounded,
                          label: 'Transit',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: BannerMiniAction(
                          icon: Icons.king_bed_rounded,
                          label: 'Full Day',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: BannerMiniAction(
                          icon: Icons.support_agent_rounded,
                          label: 'Bantuan',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BannerStatCard extends StatelessWidget {
  final String title;
  final String value;

  const BannerStatCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.10)),
      ),
      child: Column(
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
              fontSize: 13.5,
              fontWeight: FontWeight.w900,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class BannerMiniAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const BannerMiniAction({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.13),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xffffecec), size: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class IndonesianFeatureSection extends StatelessWidget {
  const IndonesianFeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.hourglass_bottom_rounded, 'title': 'Transit'},
      {'icon': Icons.king_bed_rounded, 'title': 'Full Day'},
      {'icon': Icons.apartment_rounded, 'title': 'Cabang'},
      {'icon': Icons.local_offer_rounded, 'title': 'Promo'},
      {'icon': Icons.confirmation_number_rounded, 'title': 'Kode'},
      {'icon': Icons.receipt_long_rounded, 'title': 'Riwayat'},
      {'icon': Icons.notifications_active_rounded, 'title': 'Notifikasi'},
      {'icon': Icons.support_agent_rounded, 'title': 'Bantuan'},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 20,
            offset: Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Fitur Customer',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: ReadyRoomColors.navy,
                  ),
                ),
              ),
              Text(
                'Indonesia',
                style: TextStyle(
                  color: ReadyRoomColors.red,
                  fontWeight: FontWeight.w800,
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
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.92, end: 1),
      duration: Duration(milliseconds: 380 + title.length * 14),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: ReadyRoomColors.softRed,
              borderRadius: BorderRadius.circular(19),
            ),
            child: Icon(icon, color: ReadyRoomColors.red, size: 27),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: ReadyRoomColors.navy,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class RoomShortsSection extends StatelessWidget {
  const RoomShortsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final videos = [
      {
        'image': 'assets/photo_jakarta.jpg',
        'title': 'Room Tour',
        'subtitle': 'Preview kamar',
      },
      {
        'image': 'assets/destinasi_bali.jpg',
        'title': 'Transit Deal',
        'subtitle': 'Promo 3 jam',
      },
      {
        'image': 'assets/destinasi_jogj.png',
        'title': 'Full Day',
        'subtitle': 'Check-out 12.00',
      },
      {
        'image': 'assets/tebing-breksi.jpg',
        'title': 'Cabang Baru',
        'subtitle': 'Segera hadir',
      },
    ];

    return SizedBox(
      height: 208,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return RoomShortCard(
            image: video['image']!,
            title: video['title']!,
            subtitle: video['subtitle']!,
          );
        },
      ),
    );
  }
}

class RoomShortCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const RoomShortCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 132,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              image,
              width: 132,
              height: 208,
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
                  Color(0x22000000),
                  Color(0xdd000000),
                ],
              ),
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.22),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.18)),
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
          Positioned(
            left: 12,
            right: 12,
            bottom: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SHORT',
                  style: TextStyle(
                    color: Color(0xffffb4b4),
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xffe5e7eb),
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
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
                    fontWeight: FontWeight.w900,
                    color: ReadyRoomColors.navy,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xff94a3b8),
                    fontSize: 12.5,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onSeeAll,
            child: const Text(
              'Lihat semua',
              style: TextStyle(
                color: ReadyRoomColors.red,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PremiumBranchCard extends StatelessWidget {
  final String image;
  final String city;
  final String subtitle;
  final String badge;

  const PremiumBranchCard({
    super.key,
    required this.image,
    required this.city,
    required this.subtitle,
    required this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      margin: const EdgeInsets.only(right: 14),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              image,
              width: 148,
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
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.92),
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  color: ReadyRoomColors.red,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w900,
                ),
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
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xffe5e7eb),
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
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
  final VoidCallback onTap;

  const MiniPromoSection({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff111827),
              Color(0xff1f2937),
              Color(0xff3f1212),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x18000000),
              blurRadius: 20,
              offset: Offset(0, 9),
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
                    'Promo ReadyRoom',
                    style: TextStyle(
                      color: Color(0xffffd4d4),
                      fontWeight: FontWeight.w900,
                      fontSize: 12.5,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Booking cepat untuk Transit dan Full Day dari aplikasi customer.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 1.25,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Nanti promo ini bisa diatur dari dashboard admin ReadyRoom.',
                    style: TextStyle(
                      color: Color(0xffd1d5db),
                      fontSize: 12,
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),
              child: const Icon(
                Icons.local_offer_rounded,
                color: Color(0xffffd4d4),
                size: 38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PremiumHotelCard extends StatelessWidget {
  final String name;
  final String city;
  final String price;
  final String priceNote;
  final String rating;
  final String tag;
  final String image;

  const PremiumHotelCard({
    super.key,
    required this.name,
    required this.city,
    required this.price,
    required this.priceNote,
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
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 22,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                  child: Image.asset(
                    image,
                    height: 178,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 178,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x22000000),
                        Color(0x66000000),
                      ],
                    ),
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
                      color: Colors.white.withOpacity(0.94),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        color: ReadyRoomColors.red,
                        fontWeight: FontWeight.w900,
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
                      color: Colors.white.withOpacity(0.94),
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
                            fontWeight: FontWeight.w900,
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
                      color: ReadyRoomColors.navy,
                      fontWeight: FontWeight.w900,
                      fontSize: 18.5,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: ReadyRoomColors.red,
                        size: 17,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        city,
                        style: const TextStyle(
                          color: Color(0xff64748b),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
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
                        'Siap booking',
                        style: TextStyle(
                          color: Color(0xff94a3b8),
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      HotelFeaturePill(label: 'Transit'),
                      HotelFeaturePill(label: 'Full Day'),
                      HotelFeaturePill(label: 'Kode Booking'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: price,
                            style: const TextStyle(
                              color: ReadyRoomColors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                            ),
                            children: [
                              TextSpan(
                                text: ' / $priceNote',
                                style: const TextStyle(
                                  color: Color(0xff94a3b8),
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                          backgroundColor: ReadyRoomColors.red,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                        child: const Text(
                          'Lihat Kamar',
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
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class ReadyRoomSuccessSheet extends StatelessWidget {
  final String title;

  const ReadyRoomSuccessSheet({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.65, end: 1),
            duration: const Duration(milliseconds: 650),
            curve: Curves.elasticOut,
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: Container(
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                color: const Color(0xffdcfce7),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: ReadyRoomColors.green,
                size: 46,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ReadyRoomColors.navy,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Ini masih mode MVP tampilan. Nanti tombol ini akan terhubung ke API ReadyRoom dan masuk ke Booking List admin.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ReadyRoomColors.muted,
              fontSize: 13,
              height: 1.45,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: ReadyRoomColors.navy,
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

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Cari Kamar',
      subtitle: 'Nanti halaman ini berisi filter cabang, tanggal, Transit, dan Full Day.',
      icon: Icons.explore_rounded,
    );
  }
}

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Booking Saya',
      subtitle: 'Nanti di sini isi booking pending, confirmed, check-in, dan selesai.',
      icon: Icons.receipt_long_rounded,
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Favorit',
      subtitle: 'Simpan cabang dan hotel favorit customer dengan tampilan clean premium.',
      icon: Icons.favorite_rounded,
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderPage(
      title: 'Profil',
      subtitle: 'Nanti isi akun customer, bantuan, logout, dan pengaturan aplikasi.',
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
                color: Color(0x12000000),
                blurRadius: 22,
                offset: Offset(0, 10),
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
                  color: ReadyRoomColors.softRed,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(icon, color: ReadyRoomColors.red, size: 42),
              ),
              const SizedBox(height: 18),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: ReadyRoomColors.navy,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ReadyRoomColors.muted,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}