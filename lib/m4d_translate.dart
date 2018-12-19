/// Support for doing something awesome.
///
/// More dartdocs go here.
library m4d_translate;

import 'dart:html' as dom;

import 'package:logging/logging.dart';

import 'package:l10n/l10n.dart';

import "package:m4d_core/m4d_core.dart";

export "package:m4d_core/m4d_core.dart";

import "package:m4d_core/m4d_ioc.dart" as ioc;

part 'translate/MaterialTranslate.dart';

void registerM4DTranslationComponents() {
    registerMaterialTranslate();
}

class TranslationModule extends ioc.Module {
    @override
    configure() {
        registerM4DTranslationComponents();
    }

//    @override
//    List<ioc.IOCModule> get dependsOn => [ FormatterModule() ];
}
