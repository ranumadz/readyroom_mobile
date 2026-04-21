import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      const NotificationItemData(
        title: 'ReadyRoom',
        message:
        'Pengingat: waktu booking Anda tersisa 5 menit lagi. Perpanjang sekarang agar tetap melanjutkan penggunaan kamar.',
        time: 'Baru saja',
        icon: Icons.access_time_filled_rounded,
        iconBg: Color(0xfffde8e8),
        iconColor: Color(0xffd62828),
        isUnread: true,
      ),
      const NotificationItemData(
        title: 'ReadyRoom Pay',
        message:
        '🎉 Selamat, dana masuk berhasil. Saldo Anda bertambah sebesar Rp50.000.000.',
        time: '2 menit lalu',
        icon: Icons.account_balance_wallet_rounded,
        iconBg: Color(0xfffee2e2),
        iconColor: Color(0xffd62828),
        isUnread: true,
      ),
      const NotificationItemData(
        title: 'ReadyRoom',
        message:
        'Booking Anda berhasil dibuat. Silakan datang sesuai jadwal dan tunjukkan kode booking saat check-in.',
        time: '10 menit lalu',
        icon: Icons.check_circle_rounded,
        iconBg: Color(0xffdcfce7),
        iconColor: Color(0xff16a34a),
        isUnread: false,
      ),
      const NotificationItemData(
        title: 'ReadyRoom',
        message:
        'Booking Anda telah disetujui admin. Kamar sudah disiapkan dan siap digunakan sesuai waktu yang dipilih.',
        time: '18 menit lalu',
        icon: Icons.verified_rounded,
        iconBg: Color(0xffdbeafe),
        iconColor: Color(0xff2563eb),
        isUnread: false,
      ),
      const NotificationItemData(
        title: 'ReadyRoom',
        message:
        '🔥 Promo spesial hari ini! Diskon hingga 25% untuk hotel pilihan di area favorit Anda.',
        time: '1 jam lalu',
        icon: Icons.local_fire_department_rounded,
        iconBg: Color(0xffffedd5),
        iconColor: Color(0xfff97316),
        isUnread: false,
      ),
      const NotificationItemData(
        title: 'ReadyRoom Pay',
        message:
        'Refund berhasil diproses. Dana telah dikembalikan ke saldo ReadyRoom Pay Anda.',
        time: '2 jam lalu',
        icon: Icons.payments_rounded,
        iconBg: Color(0xffede9fe),
        iconColor: Color(0xff7c3aed),
        isUnread: false,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff6f7fb),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xffd62828),
                borderRadius: BorderRadius.circular(26),
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
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.16),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Pusat pengingat dan aktivitas akun ReadyRoom',
                          style: TextStyle(
                            color: Color(0xffffe3e3),
                            fontSize: 12.5,
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
                      color: Colors.white.withOpacity(0.16),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      '2 New',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final item = notifications[index];
                  return NotificationCard(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItemData {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final bool isUnread;

  const NotificationItemData({
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.isUnread,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationItemData item;

  const NotificationCard({
    super.key,
    required this.item,
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
        border: item.isUnread
            ? Border.all(
          color: const Color(0xfffde8e8),
          width: 1.4,
        )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: item.iconBg,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              item.icon,
              color: item.iconColor,
              size: 26,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          color: Color(0xff0f172a),
                          fontWeight: FontWeight.w800,
                          fontSize: 15.5,
                        ),
                      ),
                    ),
                    if (item.isUnread)
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xffd62828),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item.message,
                  style: const TextStyle(
                    color: Color(0xff475569),
                    fontSize: 13,
                    height: 1.55,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.time,
                  style: const TextStyle(
                    color: Color(0xff94a3b8),
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