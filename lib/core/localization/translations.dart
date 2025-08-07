import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      // Authentication - Old Words
      'raqib': 'Raqib',
      'email': 'Email Address',
      'enter_email': 'Enter your email address',
      'password': 'Password',
      'enter_password': 'Enter your password',
      'forgot_password': 'Forgot Password?',
      'login': 'Sign In',
      'or_login_with': 'Or Sign In With',
      'no_account': 'Don\'t have an account?',
      'sign_in': 'Register Now',
      'please_enter_email': 'Please enter your email address and password',
      'leave_login': 'Do you want to exit the sign-in process?',
      'leave_app': 'Do you want to exit Raqib?',
      'log_out': 'Log Out',
      'error': 'Error',
      "unknown_error": "An unknown error occurred",
      "success": "Success",
      'create_account': 'Create Your Account',
      'fill_form_title': 'Fill the form',
      'fill_form': 'Please complete the form',
      'first_name': 'First Name',
      'last_name': 'Last Name',
      'enter_first_name': 'Enter your first name',
      'enter_last_name': 'Enter your last name',
      'confirm_password': 'Confirm Password',
      'enter_confirm_password': 'Re-enter your password',
      'create_account_button': 'Create Account',
      'leave_registration': 'Do you want to exit the registration process?',
      'registration': 'Registration',
      'anonymous_user': 'Anonymous User',
      'no_email': 'No Email',

      // New Words
      'are_you_sure': 'Are you sure?',
      'yes': 'Yes',
      'no': 'No',
      'welcome_back': 'Welcome back! Glad',
      'see_you_again': 'to see you, Again!',
      'field_required': 'This field is required',
      'valid_email': 'Please enter a valid email',
      'password_length': 'Password must be at least 6 characters',
      'not_match': 'Passwords do not match',
      'hello_register': 'Hello! Register to get',
      'started': 'Started',
      'register': 'Register',
      'have_account': 'Already have an account?',
      'log_in': 'Log In',

      // Home Page
      'Dashboard': 'Dashboard',
      'Welcome': 'Welcome',
      'Explore our services': 'Explore our services',
      'english': 'English',
      'arabic': 'Arabic',
      'french': 'French',
      'our_services': 'Our Services',
      'home': 'Home',
      // Products Card Translations
      'supported_product': 'Supported Products',
      'explore_supported_products': 'Explore our supported products',
      'what_are_the_supported_product': 'What are the supported products?',
      'supported_product_introduction':
          'Subsidezed products are goods for which the government cover part of the cost or Price for the end consummer',
      'explore_products': 'Explore Products',

      //pages
      'products': 'Products',
      'reporting': 'Reports',
      'report_tracking': 'My Reports',
      'law_info': 'Laws',
      'info': 'Info',
      'help&feedback': 'Help',

      // Report Types
      'Price Manipulation': 'Price Manipulation',
      'Monopoly & Speculation': 'Monopoly & Speculation',
      'Expired Products': 'Expired Products',
      'Illegal Products': 'Illegal Products',
      'Hygiene Violations': 'Hygiene Violations',
      'Other Violations': 'Other Violations',

      // Report descriptions
      'd1':
          'Report businesses that artificially increase prices or engage in unfair pricing practices.',
      'd2':
          'Report businesses hoarding products to create artificial scarcity or monopolistic practices.',
      'd3':
          'Report businesses selling products past their expiration date or with altered expiry information.',
      'd4':
          'Report the sale of prohibited, counterfeit, or unlicensed products.',
      'd5':
          'Report businesses with poor sanitation, unhygienic food handling, or unsanitary conditions.',
      'd6':
          'Report other raqib violations not covered by the categories above.',
      // Report Information Page
      'report': 'Report',
      'location_information': 'Location Information',
      'city': 'City',
      'enter_city_name': 'Enter city name',
      'please_enter_city_name': 'Please enter city name',
      'town_district': 'Town/District',
      'enter_town_district_name': 'Enter town or district name',
      'village_neighborhood': 'Village/Neighborhood',
      'enter_village_neighborhood_name': 'Enter village or neighborhood name',
      'market_information': 'Market Information',
      'market_store_name': 'Market/Store Name',
      'enter_market_store_name': 'Enter the name of the market or store',
      'please_enter_market_name': 'Please enter market name',
      'market_store_number': 'Market/Store Number',
      'enter_market_store_number':
          'Enter the number or identifier of the market',
      'violation_details': 'Violation Details',
      'description': 'Description',
      'provide_violation_details': 'Provide details about the violation',
      'please_provide_violation_details':
          'Please provide details about the violation',
      'submitting': 'Submitting...',
      'submit_report': 'Submit Report',
      'economic_reports_magazines': 'Economic Reports & Magazines',
      'investment_climate_report': 'Investment Climate Statement 2024',
      'algeria_stable_economy': 'Algeria: A Stable Rent Economy',
      'world_bank_report': 'World Bank Economic Report',
      'view_full_report': 'View Full Report',

      // Report Tracking
      'tracking_detail': 'Report Details',
      'report_not_found': 'Report not found',
      'location': 'Location',
      'submitted_on': 'Submitted on',
      'reported_by': 'Reported by',
      'tracking_progress': 'Tracking Progress',
      'view_details': 'View Details',
      'no_reports': 'No reports found',

      // Report Status
      'Under Review': 'Under Review',
      'Investigating': 'Investigating',
      'Resolved': 'Resolved',
      'Closed': 'Closed',
      'Submitted': 'Submitted',
      'Under Investigation': 'Under Investigation',
      'Rejected': 'Rejected',

      // Info Page
      'latest_raqib_news': 'Latest raqib News',
      'read_more': 'Read More',
      'view_report': 'View Report',
      'new_data_privacy_law': 'New Data Privacy Law in Effect',
      'new_legislation_ip': 'New Legislation on Counterfeiting and IP',
      'new_digital_strategy': 'New Digital Strategy Through 2029',
      'data_privacy_content':
          'Algeria has established a legal framework for data privacy through Law No. 18-07, enacted on June 10, 2018, which officially came into force on August 10, 2023. This law aims to protect personal data in digital transactions and services.',
      'ip_legislation_content':
          'The Algerian government is drafting new legislation on counterfeiting and intellectual property to improve enforcement and interagency coordination. Since March 2023, the government has also worked with WIPO to draft a national IP Strategy, expected to be completed by the end of 2024.',
      'digital_strategy_content':
          'Algeria has prepared a new digital strategy extending through 2029, built on improvement of the forthcoming digitalization law and enhanced cybersecurity. This strategy is expected to create a conducive environment for innovation and economic growth. Algeria\'s High Commission of Digitization (HCD) oversees the implementation of digital policies.',

      // Help and Feedback Page
      'contact_information': 'Contact Information',
      'phone': 'Phone',
      'address': 'Address',
      'working_hours': 'Working Hours',
      'emergency_contacts': 'Emergency Contacts',
      'consumer_protection_hotline': 'Consumer Protection Hotline',
      'trade_fraud_reporting': 'Trade Fraud Reporting',
      'social_media': 'Social Media',
      'facebook': 'Facebook',
      'telegram': 'Telegram',
      'website': 'Website',
      'developer_social': 'Developer Social',
      'instagram': 'Instagram',

      // Law Info Page
      'algerian_trade_laws': 'Algerian Trade Laws',
      'consumer_protection_law': 'Consumer Protection Law 09-03',
      'price_regulation_law': 'Price Regulation Law 10-06',
      'ecommerce_law': 'E-Commerce Law 18-05',
      'intellectual_property_protection': 'Intellectual Property Protection',
      'import_regulations': 'Import Regulations',
      'article_1': 'Article 1',
      'article_2': 'Article 2',
      'article_3': 'Article 3',
      'article_4': 'Article 4',
      'article_5': 'Article 5',
      'article_6': 'Article 6',
      'article_7': 'Article 7',
      'article_8': 'Article 8',
      'article_10': 'Article 10',
      'article_11': 'Article 11',
      'article_12': 'Article 12',
      'article_17': 'Article 17',
      'article_18': 'Article 18',
      'article_1_ipr': 'Article 1 (IPR Framework)',
      'article_1_import': 'Article 1 (Import Control)',
      'consumer_protection_article_1_desc':
          'Establishes general rules for consumer protection and fraud suppression in goods and services.',
      'consumer_protection_article_2_desc':
          'Defines a consumer as any natural or legal person who acquires or uses goods or services for non-professional purposes.',
      'consumer_protection_article_3_desc':
          'Requires that all products must be safe for consumer health and safety under normal or reasonably foreseeable conditions of use.',
      'consumer_protection_article_17_desc':
          'Prohibits the sale of counterfeit goods and services that violate commercial norms and rules of fairness.',
      'consumer_protection_article_18_desc':
          'Mandates that products must conform to the standards defined in the Codex Alimentarius for food products.',
      'price_regulation_article_1_desc':
          'Allows the government to set price controls on consumer goods and services to curb inflation and protect purchasing power.',
      'price_regulation_article_2_desc':
          'Establishes mechanisms for monitoring and regulating market prices of essential goods.',
      'price_regulation_article_5_desc':
          'Provides for subsidies on several consumer items including sugar, milk, water, petrol, diesel, and flour.',
      'price_regulation_article_8_desc':
          'Prohibits unjustified price increases and speculative practices that affect consumer purchasing power.',
      'ecommerce_article_1_desc':
          'Organizes e-commerce activity with a focus on protecting consumers in electronic transactions.',
      'ecommerce_article_6_desc':
          'Requires e-suppliers to send consumers an electronic copy of the contract and invoice in accordance with Algerian law.',
      'ecommerce_article_10_desc':
          'Mandates obtaining consumer consent before collecting personal data and guaranteeing system security and data confidentiality.',
      'ecommerce_article_12_desc':
          'Regulates electronic advertising and prohibits commercial prospection by email without prior consent.',
      'ipr_article_1_desc':
          'Establishes the legal framework for intellectual property rights protection in Algeria.',
      'ipr_article_4_desc':
          'Requires IP rights holders to register and seek enforcement of their rights under local laws, as foreign registrations are not automatically recognized.',
      'ipr_article_7_desc':
          'Prohibits counterfeiting of products, especially in cosmetics, clothing, shoes, electrical appliances, and consumer and food products.',
      'ipr_article_11_desc':
          'Provides for coordination between customs authorities and law enforcement to combat counterfeit merchandise.',
      'import_article_1_desc':
          'Bans the import of firearms, explosives, narcotics, certain pharmaceutical products, used equipment, GMO seeds, and pork products.',
      'import_article_3_desc':
          'Requires that imported food products must have at least 80% of their remaining shelf life upon arrival in Algeria.',
      'import_article_5_desc':
          'Establishes temporary duties between 30% and 200% applicable to certain import operations.',
      'import_article_8_desc':
          'Implements phyto-sanitary and sanitary control regulations for imported products.',

      // Feedback Form
      'feedback_title': 'Share Your Feedback',
      'feedback_subtitle':
          'Help us improve your experience by sharing your thoughts and suggestions',
      'full_name': 'Full Name',
      'enter_full_name': 'Enter your full name',
      'please_enter_full_name': 'Please enter your full name',
      'feedback_type': 'Feedback Type',
      'select_feedback_type': 'Select feedback type',
      'suggestion': 'Suggestion',
      'bug_report': 'Bug Report',
      'content_issue': 'Content Issue',
      'other': 'Other',
      'feedback_message': 'Your Message',
      'enter_feedback_message': 'Enter your feedback message',
      'min_message_length': 'Message should be at least 10 characters',
      'submit_feedback': 'Submit Feedback',
      'feedback_submitted': 'Thank you for your feedback!',

      // FAQ Section
      'faq_what_is': 'What is Raqib app?',
      'faq_what_is_answer':
          'Raqib is an application designed to help users understand and navigate Algerian trade laws, regulations, and procedures. It provides information about consumer rights, business regulations, and legal resources.',
      'faq_report_how': 'How do I report a trade law violation?',
      'faq_report_how_answer':
          'You can report violations through the "Report" section in the app. Fill out the required information including the type of violation, location, and any evidence you may have. Your report will be submitted to the relevant authorities.',
      'faq_track_how': 'How can I track my submitted reports?',
      'faq_track_how_answer':
          'Go to the "My Reports" section where you can view all your submitted reports and their current status. Each report has a unique tracking number that you can use to follow up on its progress.',
      'faq_violations': 'What types of trade violations can I report?',
      'faq_violations_answer':
          'You can report various violations including price manipulation, counterfeit products, misleading advertising, consumer rights violations, and unfair business practices.',
      'faq_privacy': 'Is my personal information secure?',
      'faq_privacy_answer':
          'Yes, we take data privacy seriously. Your personal information is protected according to Algerian Law No. 18-07 on personal data protection. We only share necessary information with relevant authorities for investigation purposes.',
      'faq_update_info': 'How do I update my account information?',
      'faq_update_info_answer':
          'Go to the "Profile" section in the app where you can edit your personal information, change your password, and manage your notification preferences.',
      'faq_offline': 'Can I use the app offline?',
      'faq_offline_answer':
          'Some features of the app are available offline, such as viewing previously loaded laws and regulations. However, submitting reports and accessing real-time updates requires an internet connection.',
    },
    'ar': {
      // Authentication - Old Words
      'raqib': 'Raqib',
      'email': 'البريد الإلكتروني',
      'enter_email': 'أدخل عنوان بريدك الإلكتروني',
      'password': 'كلمة المرور',
      'enter_password': 'أدخل كلمة المرور',
      'forgot_password': 'نسيت كلمة المرور؟',
      'login': 'تسجيل الدخول',
      'or_login_with': 'أو سجل الدخول باستخدام',
      'no_account': 'ليس لديك حساب؟',
      'sign_in': 'إنشاء حساب جديد',
      'please_enter_email': ' الرجاء إدخال البريد الإلكتروني و كلمة السر',
      'leave_login': 'هل تريد الخروج من عملية تسجيل الدخول؟',
      'leave_app': 'هل تريد الخروج من تطبيق Raqib؟',
      'log_out': 'تسجيل الخروج',
      'error': 'خطأ',
      "unknown_error": "حدث خطأ غير معروف",
      "success": "نجاح",
      'create_account': 'إنشاء حسابك',
      'fill_form_title': 'ملء النموذج',
      'fill_form': 'يرجى ملء النموذج ',
      'first_name': 'الاسم الأول',
      'last_name': 'اسم العائلة',
      'enter_first_name': 'أدخل اسمك الأول',
      'enter_last_name': 'أدخل اسم عائلتك',
      'confirm_password': 'تأكيد كلمة المرور',
      'enter_confirm_password': 'أدخل كلمة المرور مرة أخرى',
      'create_account_button': 'إنشاء حساب',
      'leave_registration': 'هل تريد مغادرة عملية التسجيل؟',
      'registration': 'التسجيل',
      'anonymous_user': 'مستخدم مجهول',
      'no_email': 'لا يوجد بريد إلكتروني',

      // New Words
      'are_you_sure': 'هل أنت متأكد؟',
      'yes': 'نعم',
      'no': 'لا',
      'welcome_back': 'مرحبًا بعودتك!',
      'see_you_again': 'سعداء برؤيتك مجددًا!',
      'field_required': 'هذا الحقل مطلوب',
      'valid_email': 'الرجاء إدخال بريد إلكتروني صحيح',
      'password_length': 'يجب أن تكون كلمة المرور 6 أحرف على الأقل',
      'not_match': 'كلمات المرور غير متطابقة',
      'hello_register': 'مرحبًا! سجل للحصول',
      'started': 'على حسابك الجديد',
      'register': 'تسجيل',
      'have_account': 'لديك حساب بالفعل؟',
      'log_in': 'تسجيل الدخول',

      // Home Page
      'Dashboard': 'لوحة التحكم',
      'Welcome': 'مرحباً',
      'Explore our services': 'استكشف خدماتنا',
      'english': 'الإنجليزية',
      'arabic': 'العربية',
      'french': 'الفرنسية',
      'our_services': 'خدماتنا',
      'home': 'الرئيسية',
      // Products Card Translations
      'supported_product': 'المنتجات المدعمة',
      'explore_supported_products': 'استكشف المنتجات المدعمة ',
      'what_are_the_supported_product': 'ما هي المنتجات المدعمة ؟',
      'supported_product_introduction':
          'المنتجات المدعمة هي السلع التي تتحمل الدولة جزء من تكلفتها بهدف تخفيض سعر بيعها للمستهلك النهائي',
      'explore_products': 'استكشف المنتجات',

      //pages
      'products': 'المنتجات',
      'reporting': 'البلاغات',
      'report_tracking': 'بلاغاتي',
      'law_info': 'القوانين',
      'info': 'معلومات',
      'help&fedback': 'المساعدة',

      // Report Types
      'Price Manipulation': 'التلاعب بالأسعار',
      'Monopoly & Speculation': 'الاحتكار والمضاربة',
      'Expired Products': 'منتجات منتهية الصلاحية',
      'Illegal Products': 'منتجات غير قانونية',
      'Hygiene Violations': 'مخالفات النظافة',
      'Other Violations': 'مخالفات أخرى',

      // Report descriptions
      'd1':
          'الإبلاغ عن الشركات التي ترفع الأسعار بشكل مصطنع أو تمارس سياسات تسعير غير عادلة.',
      'd2':
          'الإبلاغ عن الشركات التي تخزن المنتجات لخلق ندرة مصطنعة أو ممارسات احتكارية.',
      'd3':
          'الإبلاغ عن الشركات التي تبيع منتجات بعد تاريخ انتهاء صلاحيتها أو بمعلومات انتهاء صلاحية معدلة.',
      'd4': 'الإبلاغ عن بيع منتجات محظورة أو مزيفة أو غير مرخصة.',
      'd5':
          'الإبلاغ عن الشركات ذات النظافة السيئة أو التعامل غير الصحي مع الطعام أو الظروف غير الصحية.',
      'd6':
          'الإبلاغ عن انتهاكات أخرى لقانون التجارة غير مشمولة بالفئات المذكورة أعلاه.',
      // Report Information Page
      'report': 'الإبلاغ عن',
      'location_information': 'معلومات الموقع',
      'city': 'المدينة',
      'enter_city_name': 'أدخل اسم المدينة',
      'please_enter_city_name': 'الرجاء إدخال اسم المدينة',
      'town_district': 'البلدة/المنطقة',
      'enter_town_district_name': 'أدخل اسم البلدة أو المنطقة',
      'village_neighborhood': 'القرية/الحي',
      'enter_village_neighborhood_name': 'أدخل اسم القرية أو الحي',
      'market_information': 'معلومات السوق',
      'market_store_name': 'اسم السوق/المتجر',
      'enter_market_store_name': 'أدخل اسم السوق أو المتجر',
      'please_enter_market_name': 'الرجاء إدخال اسم السوق',
      'market_store_number': 'رقم السوق/المتجر',
      'enter_market_store_number': 'أدخل رقم أو معرف السوق',
      'violation_details': 'تفاصيل المخالفة',
      'description': 'الوصف',
      'provide_violation_details': 'قدم تفاصيل عن المخالفة',
      'please_provide_violation_details': 'الرجاء تقديم تفاصيل عن المخالفة',
      'submitting': 'جاري الإرسال...',
      'submit_report': 'إرسال البلاغ',

      // Report Tracking
      'tracking_detail': 'تفاصيل البلاغ',
      'report_not_found': 'لم يتم العثور على البلاغ',
      'location': 'الموقع',
      'submitted_on': 'تم التقديم في',
      'reported_by': 'تم الإبلاغ بواسطة',
      'tracking_progress': 'تتبع التقدم',
      'view_details': 'عرض التفاصيل',
      'no_reports': 'لا توجد بلاغات',

      // Report Status
      'Under Review': 'قيد المراجعة',
      'Investigating': 'قيد التحقيق',
      'Resolved': 'تم الحل',
      'Closed': 'مغلق',
      'Submitted': 'تم التقديم',
      'Under Investigation': 'قيد التحقيق',
      'Rejected': 'مرفوض',

      // Info Page
      'latest_raqib_news': 'أحدث أخبار قانون التجارة',
      'read_more': 'قراءة المزيد',
      'view_report': 'عرض التقرير',
      'new_data_privacy_law': 'قانون جديد لحماية البيانات ساري المفعول',
      'new_legislation_ip': 'تشريع جديد بشأن التزوير والملكية الفكرية',
      'new_digital_strategy': 'استراتيجية رقمية جديدة حتى عام 2029',
      'data_privacy_content':
          'وضعت الجزائر إطارًا قانونيًا لحماية البيانات من خلال القانون رقم 18-07، الذي تم سنه في 10 يونيو 2018، والذي دخل رسميًا حيز التنفيذ في 10 أغسطس 2023. يهدف هذا القانون إلى حماية البيانات الشخصية في المعاملات والخدمات الرقمية.',
      'ip_legislation_content':
          'تعمل الحكومة الجزائرية على صياغة تشريع جديد بشأن التزوير والملكية الفكرية لتحسين التنفيذ والتنسيق بين الوكالات. منذ مارس 2023، عملت الحكومة أيضًا مع المنظمة العالمية للملكية الفكرية لصياغة استراتيجية وطنية للملكية الفكرية، من المتوقع أن تكتمل بحلول نهاية عام 2024.',
      'digital_strategy_content':
          'أعدت الجزائر استراتيجية رقمية جديدة تمتد حتى عام 2029، مبنية على تحسين قانون الرقمنة المرتقب وتعزيز الأمن السيبراني. من المتوقع أن تخلق هذه الاستراتيجية بيئة مواتية للابتكار والنمو الاقتصادي. تشرف المفوضية العليا للرقمنة في الجزائر على تنفيذ السياسات الرقمية.',
      'economic_reports_magazines': 'التقارير والمجلات الاقتصادية',
      'investment_climate_report': 'تقرير مناخ الاستثمار 2024',
      'algeria_stable_economy': 'الجزائر: اقتصاد ريعي مستقر',
      'world_bank_report': 'تقرير البنك الدولي الاقتصادي',
      'view_full_report': 'عرض التقرير الكامل',

      // Help and Feedback Page
      'contact_information': 'معلومات الاتصال',
      'phone': 'الهاتف',
      'address': 'العنوان',
      'working_hours': 'ساعات العمل',
      'emergency_contacts': 'جهات اتصال للطوارئ',
      'consumer_protection_hotline': 'الخط الساخن لحماية المستهلك',
      'trade_fraud_reporting': 'الإبلاغ عن الاحتيال التجاري',
      'social_media': 'وسائل التواصل الاجتماعي',
      'facebook': 'فيسبوك',
      'telegram': 'تيليجرام',
      'website': 'الموقع الإلكتروني',
      'developer_social': 'وسائل التواصل للمطور',
      'instagram': 'إنستغرام',

      // Law Info Page
      'algerian_trade_laws': 'قوانين التجارة الجزائرية',
      'consumer_protection_law': 'قانون حماية المستهلك 09-03',
      'price_regulation_law': 'قانون تنظيم الأسعار 10-06',
      'ecommerce_law': 'قانون التجارة الإلكترونية 18-05',
      'intellectual_property_protection': 'حماية الملكية الفكرية',
      'import_regulations': 'لوائح الاستيراد',
      'article_1': 'المادة 1',
      'article_2': 'المادة 2',
      'article_3': 'المادة 3',
      'article_4': 'المادة 4',
      'article_5': 'المادة 5',
      'article_6': 'المادة 6',
      'article_7': 'المادة 7',
      'article_8': 'المادة 8',
      'article_10': 'المادة 10',
      'article_11': 'المادة 11',
      'article_12': 'المادة 12',
      'article_17': 'المادة 17',
      'article_18': 'المادة 18',
      'article_1_ipr': 'المادة 1 (إطار حقوق الملكية الفكرية)',
      'article_1_import': 'المادة 1 (مراقبة الاستيراد)',
      'consumer_protection_article_1_desc':
          'يضع قواعد عامة لحماية المستهلك وقمع الغش في السلع والخدمات.',
      'consumer_protection_article_2_desc':
          'يعرّف المستهلك بأنه أي شخص طبيعي أو اعتباري يقتني أو يستخدم سلعًا أو خدمات لأغراض غير مهنية.',
      'consumer_protection_article_3_desc':
          'يشترط أن تكون جميع المنتجات آمنة لصحة وسلامة المستهلك في ظل ظروف الاستخدام العادية أو المتوقعة بشكل معقول.',
      'consumer_protection_article_17_desc':
          'يحظر بيع السلع والخدمات المقلدة التي تنتهك المعايير التجارية وقواعد النزاهة.',
      'consumer_protection_article_18_desc':
          'يلزم بأن تتوافق المنتجات مع المعايير المحددة في دستور الأغذية للمنتجات الغذائية.',
      'price_regulation_article_1_desc':
          'يسمح للحكومة بوضع ضوابط للأسعار على السلع والخدمات الاستهلاكية للحد من التضخم وحماية القوة الشرائية.',
      'price_regulation_article_2_desc':
          'يضع آليات لمراقبة وتنظيم أسعار السوق للسلع الأساسية.',
      'price_regulation_article_5_desc':
          'ينص على تقديم إعانات على العديد من السلع الاستهلاكية بما في ذلك السكر والحليب والماء والبنزين والديزل والدقيق.',
      'price_regulation_article_8_desc':
          'يحظر الزيادات غير المبررة في الأسعار والممارسات المضاربة التي تؤثر على القوة الشرائية للمستهلك.',
      'ecommerce_article_1_desc':
          'ينظم نشاط التجارة الإلكترونية مع التركيز على حماية المستهلكين في المعاملات الإلكترونية.',
      'ecommerce_article_6_desc':
          'يتطلب من موردي الخدمات الإلكترونية إرسال نسخة إلكترونية من العقد والفاتورة للمستهلكين وفقًا للقانون الجزائري.',
      'ecommerce_article_10_desc':
          'يلزم بالحصول على موافقة المستهلك قبل جمع البيانات الشخصية وضمان أمن النظام وسرية البيانات.',
      'ecommerce_article_12_desc':
          'ينظم الإعلانات الإلكترونية ويحظر الاستكشاف التجاري عبر البريد الإلكتروني دون موافقة مسبقة.',
      'ipr_article_1_desc':
          'يضع الإطار القانوني لحماية حقوق الملكية الفكرية في الجزائر.',
      'ipr_article_4_desc':
          'يتطلب من أصحاب حقوق الملكية الفكرية تسجيل وطلب إنفاذ حقوقهم بموجب القوانين المحلية، حيث لا يتم الاعتراف تلقائيًا بالتسجيلات الأجنبية.',
      'ipr_article_7_desc':
          'يحظر تزوير المنتجات، خاصة في مستحضرات التجميل والملابس والأحذية والأجهزة الكهربائية والمنتجات الاستهلاكية والغذائية.',
      'ipr_article_11_desc':
          'ينص على التنسيق بين سلطات الجمارك وإنفاذ القانون لمكافحة البضائع المقلدة.',
      'import_article_1_desc':
          'يحظر استيراد الأسلحة النارية والمتفجرات والمخدرات وبعض المنتجات الصيدلانية والمعدات المستعملة وبذور الكائنات المعدلة وراثيًا ومنتجات لحم الخنزير.',
      'import_article_3_desc':
          'يشترط أن يكون لدى المنتجات الغذائية المستوردة ما لا يقل عن 80٪ من مدة صلاحيتها المتبقية عند وصولها إلى الجزائر.',
      'import_article_5_desc':
          'يضع رسومًا مؤقتة بين 30٪ و 200٪ تنطبق على عمليات استيراد معينة.',
      'import_article_8_desc':
          'ينفذ لوائح الرقابة الصحية النباتية والصحية للمنتجات المستوردة.',
      // Feedback Form
      'feedback_title': 'شارك ملاحظاتك',
      'feedback_subtitle':
          'ساعدنا في تحسين تجربتك من خلال مشاركة أفكارك واقتراحاتك',
      'full_name': 'الاسم الكامل',
      'enter_full_name': 'أدخل اسمك الكامل',
      'please_enter_full_name': 'الرجاء إدخال اسمك الكامل',
      'feedback_type': 'نوع الملاحظات',
      'select_feedback_type': 'اختر نوع الملاحظات',
      'suggestion': 'اقتراح',
      'bug_report': 'تقرير خطأ',
      'content_issue': 'مشكلة في المحتوى',
      'other': 'أخرى',
      'feedback_message': 'رسالتك',
      'enter_feedback_message': 'أدخل رسالة ملاحظاتك',
      'min_message_length': 'يجب أن تكون الرسالة 10 أحرف على الأقل',
      'submit_feedback': 'إرسال الملاحظات',
      'feedback_submitted': 'شكراً على ملاحظاتك!',

      // FAQ Section
      'faq_what_is': 'ما هو تطبيق Raqib؟',
      'faq_what_is_answer':
          'Raqib هو تطبيق مصمم لمساعدة المستخدمين على فهم وتصفح قوانين التجارة الجزائرية واللوائح والإجراءات. يوفر معلومات حول حقوق المستهلك واللوائح التجارية والموارد القانونية.',
      'faq_report_how': 'كيف يمكنني الإبلاغ عن مخالفة تجارية؟',
      'faq_report_how_answer':
          'يمكنك الإبلاغ عن المخالفات من خلال قسم "البلاغات" في التطبيق. املأ المعلومات المطلوبة بما في ذلك نوع المخالفة والموقع وأي دليل قد يكون لديك. سيتم تقديم بلاغك إلى السلطات المختصة.',
      'faq_track_how': 'كيف يمكنني تتبع بلاغاتي المقدمة؟',
      'faq_track_how_answer':
          'اذهب إلى قسم "بلاغاتي" حيث يمكنك عرض جميع بلاغاتك المقدمة وحالتها الحالية. لكل بلاغ رقم تتبع فريد يمكنك استخدامه لمتابعة تقدمه.',
      'faq_violations':
          'ما هي أنواع المخالفات التجارية التي يمكنني الإبلاغ عنها؟',
      'faq_violations_answer':
          'يمكنك الإبلاغ عن مخالفات متنوعة تشمل التلاعب بالأسعار والمنتجات المقلدة والإعلانات المضللة وانتهاكات حقوق المستهلك والممارسات التجارية غير العادلة.',
      'faq_privacy': 'هل معلوماتي الشخصية آمنة؟',
      'faq_privacy_answer':
          'نعم، نحن نأخذ خصوصية البيانات على محمل الجد. معلوماتك الشخصية محمية وفقاً للقانون الجزائري رقم 18-07 لحماية البيانات الشخصية. نحن نشارك فقط المعلومات الضرورية مع السلطات المختصة لأغراض التحقيق.',
      'faq_update_info': 'كيف يمكنني تحديث معلومات حسابي؟',
      'faq_update_info_answer':
          'اذهب إلى قسم "الملف الشخصي" حيث يمكنك تعديل معلوماتك الشخصية وتغيير كلمة المرور وإدارة تفضيلات الإشعارات.',
      'faq_offline': 'هل يمكنني استخدام التطبيق بدون إنترنت؟',
      'faq_offline_answer':
          'بعض ميزات التطبيق متاحة بدون إنترنت، مثل عرض القوانين واللوائح المحملة مسبقاً. ومع ذلك، يتطلب تقديم البلاغات والوصول إلى التحديثات الفورية اتصالاً بالإنترنت.',
    },
    'fr': {
      // Authentication - Old Words
      'raqib': 'Raqib',
      'email': 'Adresse e-mail',
      'enter_email': 'Saisissez votre adresse e-mail',
      'password': 'Mot de passe',
      'enter_password': 'Saisissez votre mot de passe',
      'forgot_password': 'Mot de passe oublié ?',
      'login': 'Se connecter',
      'or_login_with': 'Ou connectez-vous avec',
      'no_account': 'Vous n\'avez pas de compte ?',
      'sign_in': 'Créer un compte',
      'please_enter_email':
          'Veuillez saisir votre adresse e-mail et votre mot de passe',
      'leave_login': 'Voulez-vous quitter le processus de connexion ?',
      'leave_app': 'Voulez-vous quitter l\'application Raqib ?',
      'log_out': 'Déconnexion',
      'error': 'Erreur',
      "unknown_error": "Une erreur inconnue s'est produite",
      "success": "Succès",
      'create_account': 'Créez votre compte',
      'fill_form_title': 'remplir le formulaire',
      'fill_form': 'Veuillez remplir le formulaire',
      'first_name': 'Prénom',
      'last_name': 'Nom',
      'enter_first_name': 'Entrez votre prénom',
      'enter_last_name': 'Entrez votre nom',
      'confirm_password': 'Confirmer le mot de passe',
      'enter_confirm_password': 'Entrez à nouveau votre mot de passe',
      'create_account_button': 'Créer un compte',
      'leave_registration': 'Voulez-vous quitter le processus d\'inscription?',
      'registration': 'Inscription',
      'anonymous_user': 'Utilisateur anonyme',
      'no_email': 'Pas d\'email',

      // New Words
      'are_you_sure': 'Êtes-vous sûr?',
      'yes': 'Oui',
      'no': 'Non',
      'welcome_back': 'Bon retour! Heureux',
      'see_you_again': 'de vous revoir!',
      'field_required': 'Ce champ est obligatoire',
      'valid_email': 'Veuillez entrer un email valide',
      'password_length': 'Le mot de passe doit comporter au moins 6 caractères',
      'not_match': 'Les mots de passe ne correspondent pas',
      'hello_register': 'Bonjour! Inscrivez-vous pour',
      'started': 'commencer',
      'register': 'S\'inscrire',
      'have_account': 'Vous avez déjà un compte?',
      'log_in': 'Se connecter',

      // Home Page
      'Dashboard': 'Tableau de bord',
      'Welcome': 'Bienvenue',
      'Explore our services': 'Explorez nos services',
      'english': 'Anglais',
      'arabic': 'Arabe',
      'french': 'Francais',
      'our_services': 'Nos Services',
      'home': 'Accueil',
      // Products Card Translations
      'supported_product': 'Produits supportés',
      'explore_supported_products': 'Explorer nos produits supportés',
      'what_are_the_supported_product': 'Que sont les produits supportés?',
      'supported_product_introduction':
          'Les produits supportés sont les produits qui sont pris en charge par la région pour réduire le coût de vente à la finale du consommateur',
      'explore_products': 'Explorer les produits',

      //pages
      'products': 'Produits',
      'reporting': 'Rapports',
      'report_tracking': 'Suivre mes rapports',
      'law_info': 'Informations sur les lois',
      'info': 'Informations',
      'help&fedback': 'Aide',

      // Report Types
      'Price Manipulation': 'Manipulation des prix',
      'Monopoly & Speculation': 'Monopole et spéculation',
      'Expired Products': 'Produits expirés',
      'Illegal Products': 'Produits illégaux',
      'Hygiene Violations': 'Violations d\'hygiène',
      'Other Violations': 'Autres violations',

      // Report descriptions
      'd1':
          'Signalez les entreprises qui augmentent artificiellement les prix ou se livrent à des pratiques de prix déloyales.',
      'd2':
          'Signalez les entreprises qui accumulent des produits pour créer une rareté artificielle ou des pratiques monopolistiques.',
      'd3':
          'Signalez les entreprises qui vendent des produits après leur date d\'expiration ou avec des informations d\'expiration modifiées.',
      'd4':
          'Signalez la vente de produits interdits, contrefaits ou sans licence.',
      'd5':
          'Signalez les entreprises avec une mauvaise hygiène, une manipulation non hygiénique des aliments ou des conditions insalubres.',
      'd6':
          'Signalez d\'autres violations de la loi commerciale non couvertes par les catégories ci-dessus.',
      // Report Information Page
      'report': 'Signaler',
      'location_information': 'Informations sur l\'emplacement',
      'city': 'Ville',
      'enter_city_name': 'Entrez le nom de la ville',
      'please_enter_city_name': 'Veuillez entrer le nom de la ville',
      'town_district': 'Commune/District',
      'enter_town_district_name': 'Entrez le nom de la commune ou du district',
      'village_neighborhood': 'Village/Quartier',
      'enter_village_neighborhood_name':
          'Entrez le nom du village ou du quartier',
      'market_information': 'Informations sur le marché',
      'market_store_name': 'Nom du marché/magasin',
      'enter_market_store_name': 'Entrez le nom du marché ou du magasin',
      'please_enter_market_name': 'Veuillez entrer le nom du marché',
      'market_store_number': 'Numéro du marché/magasin',
      'enter_market_store_number':
          'Entrez le numéro ou l\'identifiant du marché',
      'violation_details': 'Détails de la violation',
      'description': 'Description',
      'provide_violation_details': 'Fournissez des détails sur la violation',
      'please_provide_violation_details':
          'Veuillez fournir des détails sur la violation',
      'submitting': 'Soumission en cours...',
      'submit_report': 'Soumettre le rapport',

      // Report Tracking
      'tracking_detail': 'Détails du rapport',
      'report_not_found': 'Rapport non trouvé',
      'location': 'Emplacement',
      'submitted_on': 'Soumis le',
      'reported_by': 'Signalé par',
      'tracking_progress': 'Suivi de progression',
      'view_details': 'Voir les détails',
      'no_reports': 'Aucun rapport trouvé',

      // Report Status
      'Under Review': 'En cours de révision',
      'Investigating': 'En cours d\'enquête',
      'Resolved': 'Résolu',
      'Closed': 'Fermé',
      'Submitted': 'Soumis',
      'Under Investigation': 'En cours d\'enquête',
      'Rejected': 'Rejeté',

      // Info Page
      'latest_raqib_news': 'Dernières Actualités du Droit Commercial',
      'read_more': 'Lire Plus',
      'view_report': 'Voir le Rapport',
      'new_data_privacy_law':
          'Nouvelle Loi sur la Protection des Données en Vigueur',
      'new_legislation_ip': 'Nouvelle Législation sur la Contrefaçon et la PI',
      'new_digital_strategy': 'Nouvelle Stratégie Numérique Jusqu\'en 2029',
      'data_privacy_content':
          'L\'Algérie a établi un cadre juridique pour la protection des données à travers la Loi n° 18-07, promulguée le 10 juin 2018, qui est officiellement entrée en vigueur le 10 août 2023. Cette loi vise à protéger les données personnelles dans les transactions et services numériques.',
      'ip_legislation_content':
          'Le gouvernement algérien élabore une nouvelle législation sur la contrefaçon et la propriété intellectuelle pour améliorer l\'application et la coordination interagences. Depuis mars 2023, le gouvernement a également travaillé avec l\'OMPI pour élaborer une stratégie nationale de PI, qui devrait être achevée d\'ici fin 2024.',
      'digital_strategy_content':
          'L\'Algérie a préparé une nouvelle stratégie numérique s\'étendant jusqu\'en 2029, basée sur l\'amélioration de la future loi sur la numérisation et le renforcement de la cybersécurité. Cette stratégie devrait créer un environnement propice à l\'innovation et à la croissance économique. La Haute Commission de la Numérisation de l\'Algérie supervise la mise en œuvre des politiques numériques.',
      'economic_reports_magazines': 'Rapports et Magazines Économiques',
      'investment_climate_report':
          'Rapport sur le Climat d\'Investissement 2024',
      'algeria_stable_economy': 'Algérie : Une Économie de Rente Stable',
      'world_bank_report': 'Rapport Économique de la Banque Mondiale',
      'view_full_report': 'Voir le Rapport Complet',
      // Help and Feedback Page
      'contact_information': 'Informations de Contact',
      'phone': 'Téléphone',
      'address': 'Adresse',
      'working_hours': 'Heures d\'Ouverture',
      'emergency_contacts': 'Contacts d\'Urgence',
      'consumer_protection_hotline':
          'Ligne d\'Assistance Protection des Consommateurs',
      'trade_fraud_reporting': 'Signalement de Fraude Commerciale',
      'social_media': 'Réseaux Sociaux',
      'facebook': 'Facebook',
      'telegram': 'Telegram',
      'website': 'Site Web',
      'developer_social': 'Réseaux Sociaux du Développeur',
      'instagram': 'Instagram',

      // Law Info Page
      'algerian_trade_laws': 'Lois Commerciales Algériennes',
      'consumer_protection_law': 'Loi de Protection du Consommateur 09-03',
      'price_regulation_law': 'Loi de Régulation des Prix 10-06',
      'ecommerce_law': 'Loi sur le Commerce Électronique 18-05',
      'intellectual_property_protection':
          'Protection de la Propriété Intellectuelle',
      'import_regulations': 'Réglementations d\'Importation',
      'article_1': 'Article 1',
      'article_2': 'Article 2',
      'article_3': 'Article 3',
      'article_4': 'Article 4',
      'article_5': 'Article 5',
      'article_6': 'Article 6',
      'article_7': 'Article 7',
      'article_8': 'Article 8',
      'article_10': 'Article 10',
      'article_11': 'Article 11',
      'article_12': 'Article 12',
      'article_17': 'Article 17',
      'article_18': 'Article 18',
      'article_1_ipr': 'Article 1 (Cadre de la PI)',
      'article_1_import': 'Article 1 (Contrôle des Importations)',
      'consumer_protection_article_1_desc':
          'Établit des règles générales pour la protection des consommateurs et la répression des fraudes dans les biens et services.',
      'consumer_protection_article_2_desc':
          'Définit un consommateur comme toute personne physique ou morale qui acquiert ou utilise des biens ou services à des fins non professionnelles.',
      'consumer_protection_article_3_desc':
          'Exige que tous les produits soient sûrs pour la santé et la sécurité des consommateurs dans des conditions normales ou raisonnablement prévisibles d\'utilisation.',
      'consumer_protection_article_17_desc':
          'Interdit la vente de biens et services contrefaits qui violent les normes commerciales et les règles d\'équité.',
      'consumer_protection_article_18_desc':
          'Mandates que les produits soient conformes aux normes définies dans le Codex Alimentarius pour les produits alimentaires.',
      'price_regulation_article_1_desc':
          'Permet au gouvernement de fixer des contrôles de prix sur les biens et services de consommation pour freiner l\'inflation et protéger le pouvoir d\'achat.',
      'price_regulation_article_2_desc':
          'Établit des mécanismes de surveillance et de régulation des prix du marché des biens essentiels.',
      'price_regulation_article_5_desc':
          'Prévoit des subventions sur plusieurs articles de consommation, notamment le sucre, le lait, l\'eau, l\'essence, le diesel et la farine.',
      'price_regulation_article_8_desc':
          'Interdit les augmentations de prix injustifiées et les pratiques spéculatives qui affectent le pouvoir d\'achat des consommateurs.',
      'ecommerce_article_1_desc':
          'Organise l\'activité du commerce électronique en mettant l\'accent sur la protection des consommateurs dans les transactions électroniques.',
      'ecommerce_article_6_desc':
          'Exige que les fournisseurs électroniques envoient aux consommateurs une copie électronique du contrat et de la facture conformément à la loi algérienne.',
      'ecommerce_article_10_desc':
          'Mandates obtaining consumer consent before collecting personal data and guaranteeing system security and data confidentiality.',
      'ecommerce_article_12_desc':
          'Regulates electronic advertising and prohibits commercial prospection by email without prior consent.',
      'ipr_article_1_desc':
          'Establishes the legal framework for intellectual property rights protection in Algeria.',
      'ipr_article_4_desc':
          'Requires IP rights holders to register and seek enforcement of their rights under local laws, as foreign registrations are not automatically recognized.',
      'ipr_article_7_desc':
          'Prohibits counterfeiting of products, especially in cosmetics, clothing, shoes, electrical appliances, and consumer and food products.',
      'ipr_article_11_desc':
          'Provides for coordination between customs authorities and law enforcement to combat counterfeit merchandise.',
      'import_article_1_desc':
          'Bans the import of firearms, explosives, narcotics, certain pharmaceutical products, used equipment, GMO seeds, and pork products.',
      'import_article_3_desc':
          'Requires that imported food products must have at least 80% of their remaining shelf life upon arrival in Algeria.',
      'import_article_5_desc':
          'Establishes temporary duties between 30% and 200% applicable to certain import operations.',
      'import_article_8_desc':
          'Implements phyto-sanitary and sanitary control regulations for imported products.',
      // Feedback Form
      'feedback_title': 'Partagez Vos Commentaires',
      'feedback_subtitle':
          'Aidez-nous à améliorer votre expérience en partageant vos pensées et suggestions',
      'full_name': 'Nom Complet',
      'enter_full_name': 'Entrez votre nom complet',
      'please_enter_full_name': 'Veuillez entrer votre nom complet',
      'feedback_type': 'Type de Commentaire',
      'select_feedback_type': 'Sélectionnez le type de commentaire',
      'suggestion': 'Suggestion',
      'bug_report': 'Rapport de Bug',
      'content_issue': 'Problème de Contenu',
      'other': 'Autre',
      'feedback_message': 'Votre Message',
      'enter_feedback_message': 'Entrez votre message',
      'min_message_length': 'Le message doit contenir au moins 10 caractères',
      'submit_feedback': 'Envoyer le Commentaire',
      'feedback_submitted': 'Merci pour vos commentaires !',
      // FAQ Section
      'faq_what_is': 'Qu\'est-ce que l\'application Raqib ?',
      'faq_what_is_answer':
          'Raqib est une application conçue pour aider les utilisateurs à comprendre et à naviguer dans les lois, réglementations et procédures commerciales algériennes. Elle fournit des informations sur les droits des consommateurs, les réglementations commerciales et les ressources juridiques.',
      'faq_report_how':
          'Comment signaler une violation de la loi commerciale ?',
      'faq_report_how_answer':
          'Vous pouvez signaler des violations via la section "Signalement" de l\'application. Remplissez les informations requises, y compris le type de violation, l\'emplacement et toute preuve que vous pourriez avoir. Votre signalement sera soumis aux autorités compétentes.',
      'faq_track_how': 'Comment puis-je suivre mes signalements soumis ?',
      'faq_track_how_answer':
          'Accédez à la section "Mes Signalements" où vous pouvez voir tous vos signalements soumis et leur statut actuel. Chaque signalement a un numéro de suivi unique que vous pouvez utiliser pour suivre sa progression.',
      'faq_violations':
          'Quels types de violations commerciales puis-je signaler ?',
      'faq_violations_answer':
          'Vous pouvez signaler diverses violations, notamment la manipulation des prix, les produits contrefaits, la publicité trompeuse, les violations des droits des consommateurs et les pratiques commerciales déloyales.',
      'faq_privacy': 'Mes informations personnelles sont-elles sécurisées ?',
      'faq_privacy_answer':
          'Oui, nous prenons la confidentialité des données au sérieux. Vos informations personnelles sont protégées conformément à la loi algérienne n° 18-07 sur la protection des données personnelles. Nous ne partageons que les informations nécessaires avec les autorités compétentes à des fins d\'enquête.',
      'faq_update_info':
          'Comment mettre à jour les informations de mon compte ?',
      'faq_update_info_answer':
          'Accédez à la section "Profil" où vous pouvez modifier vos informations personnelles, changer votre mot de passe et gérer vos préférences de notification.',
      'faq_offline': 'Puis-je utiliser l\'application hors ligne ?',
      'faq_offline_answer':
          'Certaines fonctionnalités de l\'application sont disponibles hors ligne, comme la consultation des lois et réglementations précédemment chargées. Cependant, la soumission de signalements et l\'accès aux mises à jour en temps réel nécessitent une connexion Internet.',
    },
  };
}
