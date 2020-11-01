// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'it';

  static m0(deckName) => "Mazzo ${deckName}";

  static m1(username, room) => "Il player ${username} esiste già nella stanza ${room}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "about" : MessageLookupByLibrary.simpleMessage("About"),
    "confirm" : MessageLookupByLibrary.simpleMessage("Conferma"),
    "customDeckRestoreMessage" : MessageLookupByLibrary.simpleMessage("La configurazione è stata ripristinata!"),
    "customDeckRestoreTooltip" : MessageLookupByLibrary.simpleMessage("Resetta la configurazione"),
    "customDeckSaveMessage" : MessageLookupByLibrary.simpleMessage("La configurazione è stata salvata!"),
    "customDeckSaveTooltip" : MessageLookupByLibrary.simpleMessage("Salva la configurazione"),
    "customDeckSetup" : MessageLookupByLibrary.simpleMessage("Configurazione personalizzata del mazzo"),
    "darkMode" : MessageLookupByLibrary.simpleMessage("Modalità scura"),
    "darkModeInfo" : MessageLookupByLibrary.simpleMessage("Abilita la modalità scura"),
    "deck" : MessageLookupByLibrary.simpleMessage("Mazzo"),
    "deckName" : m0,
    "enterPlayerName" : MessageLookupByLibrary.simpleMessage("Inserisci il tuo nome!"),
    "enterRoomName" : MessageLookupByLibrary.simpleMessage("Inserisci il nome della stanza!"),
    "error" : MessageLookupByLibrary.simpleMessage("Errore"),
    "followMe" : MessageLookupByLibrary.simpleMessage("Seguimi!"),
    "followMeInfo" : MessageLookupByLibrary.simpleMessage("Vai alla pagina del mio profilo, seguimi e supportami!"),
    "greeting" : MessageLookupByLibrary.simpleMessage("Ciao, mondo!"),
    "instructions" : MessageLookupByLibrary.simpleMessage("Istruzioni"),
    "joinARoom" : MessageLookupByLibrary.simpleMessage("Entra in una stanza"),
    "loading" : MessageLookupByLibrary.simpleMessage("Caricamento"),
    "logout" : MessageLookupByLibrary.simpleMessage("Disconnetti"),
    "openRoom" : MessageLookupByLibrary.simpleMessage("Apri stanza"),
    "ops" : MessageLookupByLibrary.simpleMessage("Ops!"),
    "pageNotFound" : MessageLookupByLibrary.simpleMessage("Pagina non trovata"),
    "pickACard" : MessageLookupByLibrary.simpleMessage("Seleziona una carta"),
    "playerAlreadyExistsInRoom" : m1,
    "playerName" : MessageLookupByLibrary.simpleMessage("Nome del giocatore"),
    "playerNameIsTooLong" : MessageLookupByLibrary.simpleMessage("Il nome del giocatore è troppo lungo!"),
    "rateThisApp" : MessageLookupByLibrary.simpleMessage("Valuta questa app!"),
    "rateThisAppInfo" : MessageLookupByLibrary.simpleMessage("Prenditi un momento per valutare questa app! Significa molto!"),
    "room" : MessageLookupByLibrary.simpleMessage("Stanza"),
    "roomName" : MessageLookupByLibrary.simpleMessage("Nome della stanza"),
    "roomNameIsTooLong" : MessageLookupByLibrary.simpleMessage("Il nome della stanza è troppo lungo!"),
    "selectDeck" : MessageLookupByLibrary.simpleMessage("Seleziona mazzo"),
    "selectDeckInfo" : MessageLookupByLibrary.simpleMessage("Scegli tra mazzi preconfigurati o personalizzane uno"),
    "shareThisApp" : MessageLookupByLibrary.simpleMessage("Condividi questa app!"),
    "shareThisAppInfo" : MessageLookupByLibrary.simpleMessage("Condividi questa app con i tuoi colleghi!"),
    "showTheIntro" : MessageLookupByLibrary.simpleMessage("Visualizza l\'intro"),
    "showTheIntroInfo" : MessageLookupByLibrary.simpleMessage("Mostra di nuovo l\'intro"),
    "tapToReveal" : MessageLookupByLibrary.simpleMessage("Tocca per rivelare"),
    "tapToRevealInfo" : MessageLookupByLibrary.simpleMessage("La carta scelta richiede un tocco extra per essere rivelata"),
    "thisIsYou" : MessageLookupByLibrary.simpleMessage("Questo sei tu!"),
    "title" : MessageLookupByLibrary.simpleMessage("Planning Poker Online"),
    "username" : MessageLookupByLibrary.simpleMessage("Nome"),
    "vibration" : MessageLookupByLibrary.simpleMessage("Vibrazione"),
    "vibrationInfo" : MessageLookupByLibrary.simpleMessage("Abilita la vibrazione"),
    "whatIsPlanningPoker" : MessageLookupByLibrary.simpleMessage("Che cos\'è Planning Poker ®?")
  };
}
