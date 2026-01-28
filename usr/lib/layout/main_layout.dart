import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_colors.dart';
import 'package:couldai_user_app/pages/dashboard_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  bool _isSidebarOpen = true;

  final List<Widget> _pages = [
    const DashboardPage(),
    const Center(child: Text('Agendamentos')),
    const Center(child: Text('Clientes')),
    const Center(child: Text('Configurações')),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final showSidebar = isDesktop && _isSidebarOpen;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar (Desktop)
          if (showSidebar)
            Container(
              width: 250,
              decoration: const BoxDecoration(
                color: AppColors.sidebarBackground,
                border: Border(right: BorderSide(color: AppColors.sidebarBorder)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(Icons.calendar_month, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Minha Agenda',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(12),
                      children: [
                        _SidebarItem(
                          icon: Icons.dashboard_outlined,
                          label: 'Dashboard',
                          isSelected: _selectedIndex == 0,
                          onTap: () => setState(() => _selectedIndex = 0),
                        ),
                        _SidebarItem(
                          icon: Icons.calendar_today_outlined,
                          label: 'Agendamentos',
                          isSelected: _selectedIndex == 1,
                          onTap: () => setState(() => _selectedIndex = 1),
                        ),
                        _SidebarItem(
                          icon: Icons.people_outline,
                          label: 'Clientes',
                          isSelected: _selectedIndex == 2,
                          onTap: () => setState(() => _selectedIndex = 2),
                        ),
                        _SidebarItem(
                          icon: Icons.settings_outlined,
                          label: 'Configurações',
                          isSelected: _selectedIndex == 3,
                          onTap: () => setState(() => _selectedIndex = 3),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.slate200,
                          child: Icon(Icons.person, size: 16, color: AppColors.slate600),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Usuário', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                            Text('admin@agenda.com', style: TextStyle(fontSize: 12, color: AppColors.mutedForeground)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Header
                Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColors.border)),
                  ),
                  child: Row(
                    children: [
                      if (!isDesktop)
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      if (isDesktop)
                        IconButton(
                          icon: Icon(_isSidebarOpen ? Icons.menu_open : Icons.menu),
                          onPressed: () => setState(() => _isSidebarOpen = !_isSidebarOpen),
                        ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                // Page Content
                Expanded(
                  child: _pages[_selectedIndex],
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: !isDesktop
          ? Drawer(
              backgroundColor: AppColors.sidebarBackground,
              child: Column(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(Icons.calendar_month, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Minha Agenda',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(12),
                      children: [
                        _SidebarItem(
                          icon: Icons.dashboard_outlined,
                          label: 'Dashboard',
                          isSelected: _selectedIndex == 0,
                          onTap: () {
                            setState(() => _selectedIndex = 0);
                            Navigator.pop(context);
                          },
                        ),
                        _SidebarItem(
                          icon: Icons.calendar_today_outlined,
                          label: 'Agendamentos',
                          isSelected: _selectedIndex == 1,
                          onTap: () {
                            setState(() => _selectedIndex = 1);
                            Navigator.pop(context);
                          },
                        ),
                        _SidebarItem(
                          icon: Icons.people_outline,
                          label: 'Clientes',
                          isSelected: _selectedIndex == 2,
                          onTap: () {
                            setState(() => _selectedIndex = 2);
                            Navigator.pop(context);
                          },
                        ),
                        _SidebarItem(
                          icon: Icons.settings_outlined,
                          label: 'Configurações',
                          isSelected: _selectedIndex == 3,
                          onTap: () {
                            setState(() => _selectedIndex = 3);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: isSelected ? AppColors.sidebarAccent : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected ? AppColors.sidebarAccentForeground : AppColors.mutedForeground,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                    color: isSelected ? AppColors.sidebarAccentForeground : AppColors.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
