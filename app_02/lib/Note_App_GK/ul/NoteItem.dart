import 'package:flutter/material.dart';
import '../model/NoteModel.dart';
import 'NoteDetailScreen.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;
  final bool isSelected;

  const NoteItem({
    super.key,
    required this.note,
    required this.onDelete,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color backgroundColor = Colors.white;
    if (note.color != null) {
      try {
        String hexColor = note.color!.replaceFirst('#', '');
        if (hexColor.length == 6) {
          backgroundColor = Color(int.parse('0xff$hexColor'));
        }
      } catch (e) {
        backgroundColor = isDarkMode ? Colors.grey[800]! : Colors.white;
      }
    } else {
      backgroundColor = isDarkMode ? Colors.grey[800]! : Colors.white;
    }

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: isSelected
            ? BorderSide(color: Colors.red[400]!, width: 2)
            : BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(
            note.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.content,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.priority_high,
                    size: 16,
                    color: note.priority == 1
                        ? Colors.green[400]
                        : note.priority == 2
                        ? Colors.orange[400]
                        : Colors.red[400],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    note.priority == 1
                        ? 'Thấp'
                        : note.priority == 2
                        ? 'Trung bình'
                        : 'Cao',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                  ),
                ],
              ),
              if (note.tags != null && note.tags!.isNotEmpty) ...[
                const SizedBox(height: 6),
                Wrap(
                  spacing: 6,
                  children: note.tags!
                      .map((tag) => Chip(
                    label: Text(
                      tag,
                      style: const TextStyle(fontSize: 12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    backgroundColor: isDarkMode ? Colors.grey[700] : Colors.blue[50],
                    labelStyle: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.blue[600],
                    ),
                  ))
                      .toList(),
                ),
              ],
            ],
          ),
          onTap: () async {
            final updated = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteDetailScreen(note: note),
              ),
            );
            if (updated == true) {
              onDelete();
            }
          },
        ),
      ),
    );
  }
}