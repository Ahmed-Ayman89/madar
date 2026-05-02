import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/widgets/custom_app_bar.dart';
import '../widgets/expandable_legal_item.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'السياسة والخصوصية'),
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            // Header Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'السياسة والخصوصية',
                        style: AppTextStyle.setStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF182D62),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Icon(
                        Icons.verified_user_outlined,
                        color: const Color(0xFF259CCB),
                        size: 32.r,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'خصوصيتك وأمان بياناتك من أولوياتنا',
                    style: AppTextStyle.setStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF182D62),
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'نلتزم في مدار بحماية خصوصية جميع المستخدمين والحفاظ على سرية البيانات الشخصية. توضح هذه الصفحة كيفية جمع المعلومات واستخدامها وحمايتها عند استخدام الموقع أو التطبيق أو أي من خدماتنا.',
                    style: AppTextStyle.setStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.n400,
                    ).copyWith(height: 1.6),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            // Legal Items
            const ExpandableLegalItem(
              title: 'المعلومات التي نقوم بجمعها',
              content: 'قد نقوم بجمع بعض المعلومات التي يقدمها المستخدم عند التسجيل أو التواصل معنا، مثل الاسم، البريد الإلكتروني، رقم الهاتف، وبيانات الاستخدام المتعلقة بالخدمات.',
              initiallyExpanded: true,
            ),
            const ExpandableLegalItem(
              title: 'كيفية استخدام المعلومات',
              content: 'نستخدم المعلومات بهدف تحسين تجربة المستخدم، تقديم الخدمات المطلوبة، التواصل مع العملاء، تطوير المنصة، وإرسال التحديثات أو العروض ذات الصلة عند الموافقة.',
              initiallyExpanded: true,
            ),
            const ExpandableLegalItem(
              title: 'حماية البيانات',
              content: 'نطبق إجراءات أمنية صارمة لحماية بياناتك من الوصول غير المصرح به أو التغيير أو الإفصاح، باستخدام تقنيات تشفير متطورة.',
            ),
            const ExpandableLegalItem(
              title: 'مشاركة المعلومات',
              content: 'لا نقوم ببيع أو تأجير بياناتك لأطراف خارجية. قد نشارك المعلومات فقط مع شركاء موثوقين لتقديم الخدمات أو بناءً على متطلبات قانونية.',
            ),
            const ExpandableLegalItem(
              title: 'ملفات تعريف الارتباط (Cookies)',
              content: 'نستخدم ملفات تعريف الارتباط لتحليل حركة المرور وتخصيص المحتوى وتحسين أداء المنصة بما يتناسب مع احتياجاتك.',
            ),
            const ExpandableLegalItem(
              title: 'حقوق المستخدم',
              content: 'لديك الحق في الوصول إلى بياناتك أو تصحيحها أو طلب حذفها، كما يمكنك سحب موافقتك على تلقي الرسائل التسويقية في أي وقت.',
            ),
            const ExpandableLegalItem(
              title: 'تحديثات السياسة',
              content: 'قد نقوم بتحديث سياسة الخصوصية من وقت لآخر لتعكس التغييرات في ممارساتنا أو المتطلبات القانونية، وسنقوم بإخطارك بأي تغييرات جوهرية.',
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
