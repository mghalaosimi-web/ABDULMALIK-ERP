<div align="center">

<img src="source/assets/icon/app_icon.png" width="96" alt="ABDULMALIK ERP logo">

# ABDULMALIK ERP

**Windows desktop ERP for one phone repair and retail shop**

نظام إدارة محل صيانة وبيع الهواتف: الصيانة، الكاشير، المخزون، الفواتير، العملاء، التقارير والنسخ الاحتياطي.

![Flutter](https://img.shields.io/badge/Flutter-desktop-02569B?logo=flutter)
![Platform](https://img.shields.io/badge/current%20release-Windows%20x64-blue)
![Version](https://img.shields.io/badge/version-1.1.0-blue)

</div>

## Current delivery scope

The active delivery target is **Windows x64 only**. Android/mobile packaging and mobile-specific work are intentionally deferred until the Windows application, installer, licensing, and shop workflows are verified.

- Local SQLite database on the shop PC.
- Local HTTP service for LAN connectivity, ready for a later mobile client.
- Repair intake and workflow, customers, products, barcode sales, phones/IMEI, purchases, cash drawer, wallets/services, reports, users/roles, audit history and backup/restore.
- Arabic/English locale foundation, RTL/LTR switching, Arabic/English date formatting and Windows installer language selection.
- Offline Ed25519 activation with a 14-day trial and device-bound license.
- No external service is required for the core local Windows workflow.

## Cloud integration — future development base

Firebase code, Firestore rules, sync routines and the tracking/branch architecture are retained as a **development base**. Cloud credentials are intentionally empty and cloud sync is disabled by default. No connection to the previous owner's Firebase project is performed.

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

## Offline license management

The application contains only the **public Ed25519 key**. The private key is owner-only and must never be committed to GitHub, sent with the installer, or stored on the shop PC.

1. Extract the supplied `ABDULMALIK-ERP-Signing-Keys.zip` in a secure offline location.
2. Keep `license-private.key` in at least two encrypted/offline backups.
3. For issuing codes, place a copy at repository-root `signing/license-private.key` on the owner's trusted workstation. The root `.gitignore` excludes the entire `signing/` folder.
4. In PowerShell, from `source`, issue a lifetime license:

```powershell
dart run tool/issue_license.dart ABCDE-FGHIJ "Shop name" lifetime
```

For a dated license:

```powershell
dart run tool/issue_license.dart ABCDE-FGHIJ "Shop name" yearly 2027-12-31 3 1
```

Arguments are device code, shop name, plan, optional expiry date, maximum devices (default 3), and maximum branches (default 1). Valid plans: `monthly`, `yearly`, `lifetime`, `custom`. The expiry date is inclusive through 23:59:59 UTC.

The license is signed offline and bound to the shop server's device code. The private key never needs to be on the target shop PC. Losing the private key means no new activation codes can be issued for this public key. Rotating it invalidates existing licenses unless a migration strategy is implemented.

## Repository layout

```
source/
  lib/src/server/       Local API server, SQLite database, authentication, licensing
  lib/src/features/     Repair, POS, inventory, customers, reports and settings UI
  lib/src/core/         App configuration, locale, formatting, cryptographic license verification
  installer/            Inno Setup Windows installer
  tool/                 Windows build and offline license issuance tools
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

الإصدار الجاري تجهيزه هو **Windows x64 فقط**. تم تأجيل تطبيق الهاتف حتى اكتمال برنامج ويندوز واختبار قاعدة البيانات والترخيص والمثبت.

البرنامج يعتمد على قاعدة SQLite محلية، ويشغّل خدمة محلية على كمبيوتر المحل. يمكن للأجهزة المتصلة بالشبكة المحلية الاستفادة منها مستقبلاً، لكن إصدار الهاتف مؤجل.

### البناء

من مجلد `source` في PowerShell:

```powershell
flutter doctor -v
powershell -ExecutionPolicy Bypass -File .\tool\build_release.ps1
```

يقوم السكربت باستعادة الحزم، والتحليل الساكن، والاختبارات، وبناء نسخة Windows Release، ثم إنشاء مثبت EXE. لا يعتبر الإصدار جاهزاً حتى تنجح جميع هذه الخطوات.

### السحابي

احتفظنا بكود Firebase وFirestore وقواعد الأمان ومزامنة الفروع وصفحة تتبع العميل كقاعدة تطوير مستقبلية. بيانات الاتصال السحابية فارغة والمزامنة معطلة افتراضياً. لن يتصل النظام بمشروع Firebase القديم. عند بدء التطوير السحابي سننشئ مشروعاً مستقلاً ونراجع قواعد الأمان قبل تفعيله.

### مفاتيح التفعيل

- التطبيق يحتوي المفتاح العام فقط للتحقق من صحة التوقيع.
- المفتاح الخاص موجود في ملف مستقل يجب حفظه في مكانين آمنين وغير متصلين بالإنترنت.
- لا ترفع المفتاح الخاص إلى GitHub ولا تضعه داخل ملف EXE.
- أداة `issue_license.dart` تنشئ أكواد التفعيل محلياً دون خادم أو اشتراك مدفوع.
- كود التفعيل مرتبط ببصمة جهاز خادم المحل.

### حماية البيانات

إلغاء تثبيت البرنامج لا يحذف قاعدة بيانات المحل. مع ذلك يجب اختبار النسخ الاحتياطي والاستعادة على نسخة تجريبية قبل تشغيل النظام الفعلي.

### حقوق المصدر

تم الإبقاء على سجل Git وإشعارات حقوق المصدر الأصلي. تغيير هوية المنتج لا يعني انتقال ملكية تأليف الكود السابق. احتفظ بموافقة صاحب المشروع الأصلية ضمن مستندات المشروع.
