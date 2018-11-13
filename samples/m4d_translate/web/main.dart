import 'dart:html' as dom;
import 'package:intl/intl_browser.dart';

import 'package:l10n/l10n.dart';
import 'package:m4d_core/m4d_ioc.dart' as ioc;
import 'package:m4d_core/services.dart' as coreService;
import "package:m4d_components/m4d_components.dart";
import 'package:m4d_translate/m4d_translate.dart';

import 'package:m4d_translate_sample/_l10n/messages_all.dart';

import 'package:console_log_handler/console_log_handler.dart';

class Application extends MaterialApplication {
    final Logger _logger = new Logger('main.Application');

    final String _locale;

    Application(this._locale);

    @override
    void run() => Future(() => _logger.info("Locale: $_locale"));

    //- private -----------------------------------------------------------------------------------

}

main() async {
    configLogging();

    // initLanguageSettings checks the browser url if it finds
    // a "lang" query param and sets the locale accordingly
    final String locale = await initLanguageSettings(
            () => findSystemLocale(),
            (final String locale) => initializeMessages(locale)
    );
    (dom.querySelector("head") as dom.HeadElement).lang = locale;

    ioc.IOCContainer.bindModules([
        CoreComponentsModule(), TranslationModule()
    ]).bind(coreService.Application).to(Application(locale));

    final Application app = await componentHandler().run();
    app.run();
}
