import 'package:flutter/material.dart';


/// Project credits, academic supervision, and development contributors.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ar = Localizations.localeOf(context).languageCode == 'ar';
    final theme = Theme.of(context);
    final people = <_PersonGroup>[
      _PersonGroup(
        title: ar ? 'الإشراف والمراجعة العلمية' : 'Academic supervision and review',
        icon: Icons.school_outlined,
        people: [
          _Person(
            name: ar ? 'الأستاذ الدكتور أحمد الناشري' : 'Prof. Dr. Ahmed Al-Nashiri',
            role: ar ? 'المشرف على المشروع' : 'Project Supervisor',
            education: ar ? 'خريج إحدى الجامعات في المملكة العربية السعودية' : 'Graduate of a university in Saudi Arabia',
            bio: ar
                ? 'أشرف على المشروع وقدم التوجيه والملاحظات العلمية، وأسهمت مراجعته ومقترحاته في ضبط أهداف النظام وتطوير فكرته وتحسين مخرجاته.'
                : 'Provided project supervision, academic guidance, and review. His feedback and recommendations helped refine the system goals and improve its outcomes.',
          ),
          _Person(
            name: ar ? 'الأستاذ الدكتور عبد الرزاق الأهدل' : 'Prof. Dr. Abdulrazzaq Al-Ahdal',
            role: ar ? 'مراجع علمي ومساهم معرفي' : 'Academic Reviewer and Advisor',
            education: ar ? 'خريج إحدى الجامعات في الهند' : 'Graduate of a university in India',
            bio: ar
                ? 'أسهم بخبرته الأكاديمية وملاحظاته في إثراء المشروع ومراجعة جوانبه المعرفية. ويُذكر ضمن التعريف بالمشروع بوصفه أول بروفيسور، وفق المعلومات المقدمة من فريق المشروع.'
                : 'Contributed academic insight and feedback to strengthen the project. The project team identifies him as its first professor, based on the information supplied by the team.',
          ),
          _Person(
            name: ar ? 'الدكتور ضياء القدمي' : 'Dr. Diaa Al-Qudmi',
            role: ar ? 'مساهم بالمقترحات والتطوير' : 'Ideas and Development Contributor',
            education: ar ? 'خريج إحدى الجامعات في الجزائر' : 'Graduate of a university in Algeria',
            bio: ar
                ? 'شارك بالمقترحات والأفكار التطويرية، وأسهمت ملاحظاته في مناقشة الحلول وتحسين بعض جوانب النظام.'
                : 'Contributed ideas and development recommendations, helping assess solutions and improve parts of the system.',
          ),
          _Person(
            name: ar ? 'الأستاذ الدكتور عبده شويه' : 'Prof. Dr. Abduh Shuwayh',
            role: ar ? 'مساهم في تحليل الفكرة' : 'Concept Analysis Contributor',
            education: ar ? 'خريج جامعة صنعاء' : 'Graduate of Sana’a University',
            bio: ar
                ? 'شارك في تحليل فكرة المشروع ومناقشة احتياجاته، وقدم رؤى وملاحظات ساعدت على توضيح نطاق النظام ومتطلباته.'
                : 'Participated in analyzing the project concept and its needs, offering insights that helped clarify the system scope and requirements.',
          ),
          _Person(
            name: ar ? 'الأستاذة سمر' : 'Ms. Samar',
            role: ar ? 'تجربة المستخدم وواجهة المستخدم (UX/UI)' : 'User Experience and Interface (UX/UI)',
            education: ar ? 'حاصلة على درجة الماجستير – جامعة صنعاء' : 'Master’s degree – Sana’a University',
            bio: ar
                ? 'ساهمت في مراجعة تجربة المستخدم وواجهة الاستخدام، وتحسين وضوح الشاشات وتسلسل الإجراءات وسهولة التعامل مع النظام.'
                : 'Contributed to reviewing the user experience and interface, improving screen clarity, workflow, and ease of use.',
          ),
        ],
      ),
      _PersonGroup(
        title: ar ? 'فريق التطوير والمشاركون' : 'Development Team and Contributors',
        icon: Icons.code_rounded,
        people: [
          _Person(
            name: ar ? 'محمد غالب العصيمي' : 'Mohammed Ghaleb Al-Osaimi',
            role: ar ? 'المطور الرئيسي ومهندس النظام' : 'Lead Developer and Systems Engineer',
            bio: ar
                ? 'طالب ومطور برمجيات شامل، يتولى تصميم وبناء النظام وتطوير واجهاته وخدماته الخلفية وقواعد بياناته، مع التركيز على تكامل الوحدات وجودة التنفيذ وقابلية الصيانة.'
                : 'A student and full-stack software developer responsible for system design, application interfaces, backend services, and data architecture, with a focus on integration, quality, and maintainability.',
          ),
          _Person(
            name: ar ? 'رمزي محمد حزام السرابي' : 'Ramzi Mohammed Hizam Al-Sarabi',
            role: ar ? 'مطور ومشارك في تنفيذ المشروع' : 'Developer and Project Contributor',
            bio: ar
                ? 'شارك في أعمال تطوير المشروع وتنفيذ مكوناته. سيُضاف رابط مستودعه البرمجي بعد تزويد الفريق بالرابط الصحيح للتحقق منه.'
                : 'Contributed to developing and implementing project components. His repository link will be added after the team provides the verified URL.',
          ),
          _Person(
            name: ar ? 'عرفات الكاملي' : 'Arafat Al-Kamali',
            role: ar ? 'مشارك في المشروع' : 'Project Contributor',
            bio: ar
                ? 'شارك في المشروع ضمن فريق العمل، ويُستكمل وصف طبيعة مساهمته التفصيلية عند اعتماد المهام المنجزة منه.'
                : 'Participated as a member of the project team. A more detailed contribution statement can be added once his specific completed tasks are confirmed.',
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(ar ? 'عن المشروع والفريق' : 'About the Project and Team')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [theme.colorScheme.primaryContainer, theme.colorScheme.surface],
                ),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset('assets/icon/app_icon.png', width: 68, height: 68),
                  ),
                  const SizedBox(height: 12),
                  Text('ABDULMALIK ERP', textDirection: TextDirection.ltr,
                      style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    ar
                        ? 'نظام متكامل لإدارة أعمال بيع الهواتف وصيانتها ومخزونها ومبيعاتها وتقاريرها.'
                        : 'An integrated system for phone retail, repair, inventory, sales, and reporting.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          for (final group in people) ...[
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 20, 4, 10),
              child: Row(children: [
                Icon(group.icon, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Expanded(child: Text(group.title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold))),
              ]),
            ),
            for (final person in group.people) _PersonCard(person: person),
          ],
          const SizedBox(height: 16),
          Text(
            ar
                ? 'تنويه: هذه النبذات تعريفية بصياغة فريق المشروع، وتُراجع المسميات الأكاديمية والتفاصيل والسير الذاتية النهائية مع أصحابها قبل النشر الرسمي.'
                : 'Note: These biographies are project-team drafts. Academic titles, details, and final biographies should be confirmed with each person before official publication.',
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _PersonGroup {
  const _PersonGroup({required this.title, required this.icon, required this.people});
  final String title;
  final IconData icon;
  final List<_Person> people;
}

class _Person {
  const _Person({required this.name, required this.role, required this.bio, this.education});
  final String name;
  final String role;
  final String bio;
  final String? education;
}

class _PersonCard extends StatelessWidget {
  const _PersonCard({required this.person});
  final _Person person;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: theme.colorScheme.secondaryContainer,
            child: Icon(Icons.person_outline_rounded, color: theme.colorScheme.onSecondaryContainer, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(person.name, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 3),
            Text(person.role, style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.primary)),
            if (person.education != null) ...[
              const SizedBox(height: 5),
              Text(person.education!, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            ],
            const SizedBox(height: 8),
            Text(person.bio, style: theme.textTheme.bodyMedium),
          ])),
        ]),
      ),
    );
  }
}
