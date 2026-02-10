import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'chapter_days_screen.dart';

class TeachScreen extends StatefulWidget {
  const TeachScreen({super.key});

  @override
  State<TeachScreen> createState() => _TeachScreenState();
}

class _TeachScreenState extends State<TeachScreen> {
  int? _expandedIndex;

  final List<Map<String, dynamic>> _chapters = [
    {
      'title': 'Chapter-1',
      'subtitle': 'Me and My Family',
      'lessons': ['Introduction to Family', 'Members of Family', 'Family Tree Activity']
    },
    {
      'title': 'Chapter-2',
      'subtitle': 'Animals and Plants',
      'lessons': ['Kinds of Animals', 'Parts of a Plant', 'How Plants Grow']
    },
    {
      'title': 'Chapter-3',
      'subtitle': 'Food and Shelter',
      'lessons': ['Types of Food', 'Different Types of Houses', 'Healthy Eating Habits']
    },
    {
      'title': 'Chapter-4',
      'subtitle': 'Air and Water, and animals, plants.',
      'lessons': ['Importance of Air', 'Sources of Water', 'Saving Water']
    },
    {
      'title': 'Chapter-5',
      'subtitle': 'Season and Festivals',
      'lessons': ['The Four Seasons', 'Why We Celebrate Festivals', 'National Festivals']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          _buildSearchBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _chapters.length,
              itemBuilder: (context, index) {
                return _buildChapterCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFFC107),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFFFFC107)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Text(
                    'English',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Color(0xFFFFC107)),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Add New Chapter feature coming soon!')),
                        );
                      },
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

  Widget _buildSearchBar() {
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))
            ],
            border: Border.all(color: const Color(0xFFFFC107).withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 15),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for Chapter',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.tune, color: Colors.black),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChapterCard(int index) {
    final chapter = _chapters[index];
    final bool isExpanded = _expandedIndex == index;

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FA),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _expandedIndex = isExpanded ? null : index;
                });
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.person_outline, color: Color(0xFFFFC107), size: 30),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chapter['title'],
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          chapter['subtitle'],
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: isExpanded ? Colors.redAccent : const Color(0xFFFFC107),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isExpanded ? Icons.remove : Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isExpanded ? 'Hide' : 'View',
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isExpanded) ...[
              const Divider(height: 32),
              Column(
                children: (chapter['lessons'] as List<String>).map((lesson) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterDaysScreen(
                            chapterTitle: chapter['title'],
                            color: const Color(0xFFFFC107),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        children: [
                          const Icon(Icons.play_circle_outline, color: Color(0xFFFFC107), size: 24),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              lesson,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
