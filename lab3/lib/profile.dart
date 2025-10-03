import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Profile Image
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.green.shade600, Colors.green.shade400],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Profile Image
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYvCpU4PYu_6_KWmiwslfo3r8QJnOMWavguw&s',
                          ),
                        ),
                      ),
                      SizedBox(height: 16),

                      // Name
                      Text(
                        'Anas Asghar',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      // Title
                      Text(
                        'Flutter Developer',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white.withAlpha(1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Profile Description
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Text(
                'From Figma to App Store/Play Store, I build production‑ready Flutter apps using clean, feature‑first architecture (Riverpod/BLoC) and isolates, backed by CI/CD (GitHub Actions), release monitoring (Firebase Crashlytics/Analytics), and staged rollouts — integrating REST APIs and Supabase (Auth/Realtime/Edge).',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Skills Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Skills & Technologies',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Core Flutter Skills
                  _buildSkillCategory('Core Flutter & Dart', [
                    'Flutter',
                    'Dart',
                    'Riverpod',
                    'BLoC',
                    'Provider',
                    'GetX',
                    'Isolates',
                    'Async/Streams',
                    'Performance Optimisation',
                    'Memory Management',
                  ], Colors.blue),

                  SizedBox(height: 16),

                  // Backend & APIs
                  _buildSkillCategory('Backend & APIs', [
                    'REST APIs',
                    'GraphQL',
                    'Firebase (Auth/Firestore/Crashlytics/Analytics/FCM)',
                    'Supabase',
                  ], Colors.orange),

                  SizedBox(height: 16),

                  // DevOps & Tools
                  _buildSkillCategory('DevOps & Tools', [
                    'Git',
                    'GitHub Actions (CI/CD)',
                    'Testing (Unit/Widget/Integration)',
                    'App Store Connect',
                    'Google Play Console',
                    'Background Services/Notifications',
                  ], Colors.green),

                  SizedBox(height: 16),

                  // AI & Advanced
                  _buildSkillCategory('AI/LLMs & Computer Vision', [
                    'TensorFlow Lite',
                    'OpenCV',
                    'Prompt/Context Engineering (ChatGPT API)',
                    'MCP servers ',
                    'Claude Code CLI',
                    'GitHub Copilot',
                    'Cursor',
                  ], Colors.purple),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory(String title, List<String> skills, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map(
                  (skill) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: color.withOpacity(0.3)),
                    ),
                    child: Text(
                      skill,
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: color.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
