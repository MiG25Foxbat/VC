import 'package:flutter/material.dart';

import '../models/models.dart';

String formatSalary(int? from, int? to) {
  if (from == null && to == null) return 'Зарплата не указана';
  if (from != null && to != null && from != to) return 'от $from до $to ₽';
  return 'от ${from ?? to} ₽';
}

class VacancyTile extends StatelessWidget {
  const VacancyTile({super.key, required this.item, this.onTap, this.trailing});

  final SearchResultItem item;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.companyName ?? 'Работодатель не указан'),
          Text('${formatSalary(item.salaryFrom, item.salaryTo)} · ${item.location ?? '—'}'),
          Row(
            children: [
              Chip(
                label: Text(item.source, style: const TextStyle(fontSize: 11)),
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
      isThreeLine: true,
      trailing: trailing,
    );
  }
}
