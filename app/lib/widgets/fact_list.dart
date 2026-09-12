import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/models.dart';

/// Список фактов письма с источниками. В модели данных нет привязки
/// конкретного факта к конкретному абзацу — только общий список
/// claim+source_url на всё письмо, поэтому показываем его сразу под
/// письмом целиком: источник виден рядом с текстом, а не потерян где-то
/// в другом экране.
class FactList extends StatelessWidget {
  const FactList({super.key, required this.facts});

  final List<LetterFact> facts;

  bool _looksLikeUrl(String value) => value.startsWith('http://') || value.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (facts.isEmpty) {
      return const Text('Фактов нет — справки на письмо не хватило.');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Факты и источники', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 4),
        for (final fact in facts)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 4, right: 6),
                  child: Icon(Icons.link, size: 14),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fact.claim, style: Theme.of(context).textTheme.bodySmall),
                      if (_looksLikeUrl(fact.sourceUrl))
                        InkWell(
                          onTap: () => launchUrl(Uri.parse(fact.sourceUrl)),
                          child: Text(
                            fact.sourceUrl,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        )
                      else
                        Text(
                          'Источник: ${fact.sourceUrl}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontStyle: FontStyle.italic,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
