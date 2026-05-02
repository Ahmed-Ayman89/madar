import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:madar/core/helper/app_colors.dart';
import 'package:madar/core/helper/app_text_style.dart';
import 'package:madar/core/widgets/custom_app_bar.dart';
import '../widgets/expandable_legal_item.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الشروط والأحكام'),
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
                        'الشروط والأحكام',
                        style: AppTextStyle.setStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF182D62),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Icon(
                        Icons.description_outlined,
                        color: const Color(0xFF259CCB),
                        size: 32.r,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'لضمان أفضل تجربة استخدام',
                    style: AppTextStyle.setStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF182D62),
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'نحرص في مدار على تقديم تجربة موثوقة وواضحة لجميع المستخدمين، لذلك توضح هذه الصفحة الشروط والأحكام المنظمة لاستخدام الموقع والتطبيق والخدمات المقدمة من قبلنا. يرجى الاطلاع عليها قبل البدء باستخدام المنصة.',
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
              title: 'قبول الشروط',
              content: 'باستخدامك لموقع أو تطبيق مدار فإنك توافق على الالتزام بهذه الشروط والأحكام وجميع السياسات المرتبطة بها.',
              initiallyExpanded: true,
            ),
            const ExpandableLegalItem(
              title: 'استخدام الخدمات',
              content: 'يحق للمستخدم الاستفادة من الخدمات المقدمة بما يتوافق مع الأنظمة والقوانين المعمول بها، ويمنع استخدام المنصة لأي أغراض غير قانونية أو تسيء للآخرين.',
              initiallyExpanded: true,
            ),
            const ExpandableLegalItem(
              title: 'الحسابات والمعلومات',
              content: 'يتحمل المستخدم مسؤولية دقة المعلومات المقدمة في حسابه والحفاظ على سرية بيانات الدخول الخاصة به.',
            ),
            const ExpandableLegalItem(
              title: 'الطلبات والدفع',
              content: 'تخضع جميع الطلبات والخدمات لسياسات التسعير والدفع الموضحة في المنصة، ونحتفظ بالحق في تعديل الأسعار أو شروط الخدمة.',
            ),
            const ExpandableLegalItem(
              title: 'الملكية الفكرية',
              content: 'جميع المحتويات والعلامات التجارية الموجودة على المنصة هي ملك لمدار، ولا يحق استخدامها دون إذن مسبق.',
            ),
            const ExpandableLegalItem(
              title: 'التعديلات',
              content: 'نحتفظ بالحق في تعديل هذه الشروط في أي وقت، وسيتم نشر النسخة المحدثة على هذه الصفحة وتعتبر سارية فور نشرها.',
            ),
            const ExpandableLegalItem(
              title: 'إيقاف الخدمة',
              content: 'نحتفظ بالحق في إيقاف أو تقييد الوصول للخدمات لأي مستخدم يخالف هذه الشروط والأحكام.',
            ),
            const ExpandableLegalItem(
              title: 'التواصل معنا',
              content: 'في حال وجود أي استفسارات حول هذه الشروط، يرجى التواصل معنا عبر القنوات المتاحة في صفحة اتصل بنا.',
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
