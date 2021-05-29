import 'package:flutter/foundation.dart';

class License extends LicenseEntry {
  final packages;
  final paragraphs;

  License(this.packages,this.paragraphs);
}

Stream<LicenseEntry> licenses() async* {
  yield License([
    'Storyset'
  ], [
    LicenseParagraph(
        'All illustrations provided for free by Storyset.com',
        0
    )
  ]);
}

/*
void addLicensesToRegistry() {
  LicenseRegistry.addLicense(licenses);
}
*/
