import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Markdown(
          data: INFOTEXT,
          onTapLink: (_, String href, __) async {
            if (await canLaunch(href)) {
              await launch(href);
            } else {
              throw 'Could not launch $href';
            }
          },
        ),
      ),
    );
  }
}

const String INFOTEXT = """

# Planning Poker ®

Planning Poker ®, also called Scrum poker, is a consensus-based, gamified technique for estimating, mostly used to estimate effort or relative size of development goals in software development. In Planning oker ®, members of the group make estimates by playing numbered cards face-down to the table, instead of speaking them aloud. The cards are revealed, and the estimates are then discussed. By hiding the figures in this way, the group can avoid the cognitive bias of anchoring, where the first number spoken aloud sets a precedent for subsequent estimates.

## Rationale

The reason to use Planning Poker ® is to avoid the influence of the other participants. If a number is spoken, it can sound like a suggestion and influence the other participants' sizing. Planning oker ® should force people to think independently and propose their numbers simultaneously. This is accomplished by requiring that all participants show their card at the same time.

## Equipment

Planning Poker ® is based on a list of features to be delivered, several copies of a deck of cards and optionally, an egg timer that can be used to limit time spent in discussion of each item. _**You can use this app as well!**_.

The feature list, often a list of user stories, describes some software that needs to be developed.
The cards in the deck have numbers on them. _**You can choose between four different decks with this app!**_.

## Procedure

At the estimation meeting, each estimator is given one deck of the cards. All decks have identical sets of cards in them.

The meeting proceeds as follows:

- A Moderator, who will not play, chairs the meeting.
- The Product Owner provides a short overview of one user story to be estimated. The team is given an opportunity to ask questions and discuss to clarify assumptions and risks. A summary of the discussion is recorded, e.g. by the Moderator.
- Each individual lays a card face down representing their estimate for the story. Units used vary - they can be days duration, ideal days or story points. During discussion, numbers must not be mentioned at all in relation to feature size to avoid anchoring.
- Everyone calls their cards simultaneously by turning them over.
- People with high estimates and low estimates are given a soap box to offer their justification for their estimate and then discussion continues.
- Repeat the estimation process until a consensus is reached. The developer who was likely to own the deliverable has a large portion of the "consensus vote", although the Moderator can negotiate the consensus.
- To ensure that discussion is structured; the Moderator or the Product Owner may at any point turn over the egg timer and when it runs out all discussion must cease and another round of poker is played. The structure in the conversation is re-introduced by the soap boxes.

The cards are numbered as they are to account for the fact that the longer an estimate is, the more uncertainty it contains. Thus, if a developer wants to play a 6 he is forced to reconsider and either work through that some of the perceived uncertainty does not exist and play a 5, or accept a conservative estimate accounting for the uncertainty and play an 8.

PLANNING POKER ® is a registered trademark of Mountain Goat Software, LLC

Source: [https://wikipedia.org/wiki/Planning_poker](https://wikipedia.org/wiki/Planning_poker)

""";
