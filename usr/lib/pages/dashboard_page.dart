import 'package:flutter/material.dart';
import 'package:couldai_user_app/theme/app_colors.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 24),
          
          // Stats Cards
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final isMobile = width < 600;
              
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _StatCard(
                    title: 'Agendamentos Hoje',
                    value: '12',
                    icon: Icons.calendar_today,
                    width: isMobile ? width : (width - 48) / 4,
                  ),
                  _StatCard(
                    title: 'Renda Mensal',
                    value: 'R\$ 4.250',
                    icon: Icons.attach_money,
                    width: isMobile ? width : (width - 48) / 4,
                  ),
                  _StatCard(
                    title: 'Novos Clientes',
                    value: '+8',
                    icon: Icons.person_add_outlined,
                    width: isMobile ? width : (width - 48) / 4,
                  ),
                  _StatCard(
                    title: 'Pendentes',
                    value: '3',
                    icon: Icons.pending_actions,
                    width: isMobile ? width : (width - 48) / 4,
                  ),
                ],
              );
            },
          ),
          
          const SizedBox(height: 32),
          
          // Recent Appointments Section
          Text(
            'Próximos Agendamentos',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          
          Card(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.secondary,
                    child: Text(
                      'C${index + 1}',
                      style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text('Cliente Exemplo ${index + 1}'),
                  subtitle: const Text('Corte de Cabelo • 14:00 - 15:00'),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Confirmado',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final double width;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mutedForeground,
                ),
              ),
              Icon(icon, size: 16, color: AppColors.mutedForeground),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}
