<div align="center">

<img src="source/assets/icon/app_icon.png" width="96" alt="ABDULMALIK ERP logo">

# ABDULMALIK ERP

**A product in the M.GH.AL Software, Systems & Applications portfolio**  
**منتج ضمن ملف أعمال شركة M.GH.AL للبرمجيات والأنظمة والتطبيقات**

M.GH.AL focuses on custom software, business and ERP systems, web and mobile applications, workflow automation, database engineering, system integration, reporting, and digital transformation. Its approach combines requirements analysis, software architecture, user experience, engineering, quality assurance, and continuous improvement.

> The M.GH.AL mark in the application is a brand and portfolio identifier. It is not a government registration or third-party certification.


**Windows desktop ERP for one phone repair and retail shop**

نظام إدارة محل صيانة وبيع الهواتف: الصيانة، الكاشير، المخزون، الفواتير، العملاء، التقارير والنسخ الاحتياطي.

![Flutter](https://img.shields.io/badge/Flutter-desktop-02569B?logo=flutter)
![Platform](https://img.shields.io/badge/current%20release-Windows%20x64-blue)
![Version](https://img.shields.io/badge/version-1.1.0-blue)

</div>

## Current delivery scope

The active delivery target is **Windows x64 only**. Android/mobile packaging and mobile-specific work are intentionally deferred until the Windows application, installer, and shop workflows are verified.

- Dedicated accessories inventory with categories, barcode support, stock tracking, and separation from general inventory.
- Local SQLite database on the shop PC.
- Local HTTP service for LAN connectivity, ready for a later mobile client.
- Repair intake and workflow, customers, products, barcode sales, phones/IMEI, purchases, cash drawer, wallets/services, reports, users/roles, audit history and backup/restore.
- Arabic/English locale foundation, RTL/LTR switching, Arabic/English date formatting and Windows installer language selection.
- Open initial edition: no activation code, subscription, trial expiry, or device-count restrictions. Licensing is deferred to a future major update.
- No external service is required for the core local Windows workflow.

## Cloud integration — future development base

Firebase code, Firestore rules and sync routines are retained as a **development base**. Public tracking is disabled in this release; its public page is a static notice and makes no Firebase requests. Cloud credentials are intentionally empty and cloud sync is disabled by default. No connection to the previous owner's Firebase project is performed.

When cloud work begins, create a Firebase project owned by the ABDULMALIK ERP maintainer, configure its API key/project ID, review Firestore security rules and privacy requirements, then explicitly enable cloud sync. Until then, the Windows application remains local/offline-first.

## Build Windows

Requirements:
- Windows 10/11 x64
- Flutter stable SDK with Windows desktop support
- Visual Studio 2022 Build Tools with Desktop development with C++
- Inno Setup 6

From the `source` directory:

```powershell
flutter doctor -v
powershell -ExecutionPolicy Bypass -File .\tool\build_release.ps1
```

The release script restores dependencies, runs static analysis and tests, builds the Windows x64 Release bundle, downloads the official Microsoft Visual C++ x64 runtime installer, and compiles:

```
builds/ABDULMALIK-ERP-Setup-1.1.0.exe
```

The installer supports Arabic and English setup wizard languages, desktop shortcut selection, optional Windows startup, firewall rule setup, and preserves shop data during uninstall.

A GitHub Actions workflow runs the same Windows build on pushes to `main` and `abdulmalik/development`, and publishes the installer as a 30-day workflow artifact. Open the repository Actions tab and download `ABDULMALIK-ERP-Windows-Setup` after a successful run.

## Licensing roadmap

The initial release is intentionally open for use. Activation keys, subscription plans, device limits, and offline license issuance are deferred; they do not block installation or daily shop operations in this edition.

## Repository layout

```
source/
  lib/src/server/       Local API server, SQLite database, authentication
  lib/src/features/     Repair, POS, inventory, customers, reports and settings UI
  lib/src/core/         App configuration, locale, formatting and cryptographic utilities
  installer/            Inno Setup Windows installer
  tool/                 Windows build and maintenance tools
  firebase/              Retained cloud integration development base
  test/                  Unit and API tests
signing/                 Owner-only private key folder (gitignored; never commit)
.github/workflows/       Windows CI and installer artifact pipeline
```

## Data safety

- SQLite data and backups live in the app's Windows application-data directory, not the installation folder.
- Uninstall does not delete shop data.
- Back up the database regularly and verify restore before using the system for live shop operations.
- Test the installer and restore procedure on a separate Windows user/profile before the production shop PC.

## Provenance

This repository preserves the upstream Git history and original copyright notices. Product branding changes do not transfer authorship of upstream code. The maintainer has stated that permission for this single-shop adaptation was obtained; retain the written permission with project records.

---

## بالعربية

### نطاق الإصدار الحالي

الإصدار الجاري تجهيزه هو **Windows x64 فقط**. تم تأجيل تطبيق الهاتف حتى اكتمال برنامج ويندوز واختبار قاعدة البيانات والمثبت.

يتضمن المخزون قسماً مستقلاً للأكسسوارات بتصنيفات مثل الجرابات والسماعات والشواحن والكابلات وحماية الشاشة، مع بقائها قابلة للبيع من الكاشير.

البرنامج يعتمد على قاعدة SQLite محلية، ويشغّل خدمة محلية على كمبيوتر المحل. يمكن للأجهزة المتصلة بالشبكة المحلية الاستفادة منها مستقبلاً، لكن إصدار الهاتف مؤجل.

### البناء

من مجلد `source` في PowerShell:

```powershell
flutter doctor -v
powershell -ExecutionPolicy Bypass -File .\tool\build_release.ps1
```

يقوم السكربت باستعادة الحزم، والتحليل الساكن، والاختبارات، وبناء نسخة Windows Release، ثم إنشاء مثبت EXE. لا يعتبر الإصدار جاهزاً حتى تنجح جميع هذه الخطوات.

### السحابي

احتفظنا بكود Firebase وFirestore وقواعد الأمان والمزامنة كقاعدة تطوير مستقبلية. التتبع العام معطّل في هذا الإصدار وصفحته تعرض إشعاراً ثابتاً ولا تتصل بمشروع Firebase السابق. بيانات الاتصال السحابية فارغة والمزامنة معطلة افتراضياً. عند بدء التطوير السحابي سننشئ مشروعاً مستقلاً ونراجع قواعد الأمان قبل تفعيله.

### الإصدار المفتوح والتراخيص

الإصدار الحالي مفتوح للاستخدام دون كود تفعيل أو اشتراك أو فترة تجريبية أو حدود ترخيص للأجهزة والفروع. تم تأجيل نظام التراخيص وأدوات إصدار المفاتيح إلى تحديث رئيسي مستقبلي.

قد تبقى بعض ملفات وأدوات الترخيص القديمة داخل المستودع لأغراض التوافق والتطوير المستقبلي، لكنها ليست مطلوبة لتثبيت الإصدار الحالي أو تشغيل وظائفه اليومية. لا تستخدم أدوات إصدار المفاتيح أو تعليمات التفعيل القديمة مع هذا الإصدار.

### حماية البيانات

إلغاء تثبيت البرنامج لا يحذف قاعدة بيانات المحل. مع ذلك يجب اختبار النسخ الاحتياطي والاستعادة على نسخة تجريبية قبل تشغيل النظام الفعلي.

### حقوق المصدر

تم الإبقاء على سجل Git وإشعارات حقوق المصدر الأصلي. تغيير هوية المنتج لا يعني انتقال ملكية تأليف الكود السابق. احتفظ بموافقة صاحب المشروع الأصلية ضمن مستندات المشروع.


### Legacy compatibility policy

The fixtrack.db database filename and the fixtrack-enc / fixtrack-mac key-derivation labels are intentionally retained because changing them without a verified data migration could make existing shop data or encrypted values unreadable. Android package/channel identifiers are also retained while Android delivery is deferred. These are compatibility identifiers, not current product branding.
