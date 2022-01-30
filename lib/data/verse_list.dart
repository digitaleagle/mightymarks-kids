import 'package:mighty_marks_kids/data/verse.dart';
import 'package:mighty_marks_kids/data/globals.dart' as globals;

class VerseList {
  List<Verse> list = [];

  VerseList() {
    switch (globals.settings.verseList) {
      case 'Glimmers Verses':
        list.add(Verse(
            "The light of the body is the eye: (Luke 11:34a)"));
        list.add(Verse(
            "Moreover it is required in stewards, that a man be found faithful. (I Corinthians 4:2)"));
        list.add(Verse(
            "Let your light so shine before men, (Matthew 5:16a)"));
        list.add(Verse(
            "Set a watch, O LORD, before my mouth; (Psalms 141:3a)"));
        list.add(Verse(
            "have no fellowship with darkness, (Ephesians 5:11)"));
        list.add(Verse(
            "Beware lest any man spoil you  (Colossians 2:8a)"));
        list.add(Verse(
            "Beloved, believe not every spirit (I John 4:1a)"));
        list.add(Verse(
            "Redeeming the time (Ephesians 5:16a)"));
        list.add(Verse(
            "Bear ye one another’s burdens (Galatians 6:2)"));
        list.add(Verse(
            "follow after the things which make for peace (Romans 14:19)"));
        list.add(Verse(
            "Obey them that have the rule over you (Hebrews 13:17)"));
        list.add(Verse(
            "Thou shalt love thy neighbour as thyself. (Galatians 5:14)"));
        break;
      case 'Demo Verses':
        list.add(Verse(
          "For God so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life. (John 3:16)"
        ));
        list.add(Verse(
          "Jesus wept. (John 11:35)"
        ));
        break;
      case 'MightyMarks TechTitans Verses':
      default:
        list.add(Verse(
            "The light of the body is the eye: therefore when thine eye is single, thy whole body also is full of light; but when thine eye is evil, thy body also is full of darkness. (Luke 11:34)"));
        list.add(Verse(
            "Moreover it is required in stewards, that a man be found faithful. (I Corinthians 4:2)"));
        list.add(Verse(
            "Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven. (Matthew 5:16)"));
        list.add(Verse(
            "Set a watch, O LORD, before my mouth; keep the door of my lips. (Psalms 141:3)"));
        list.add(Verse(
            "And have no fellowship with the unfruitful works of darkness, but rather reprove them. (Ephesians 5:11)"));
        list.add(Verse(
            "Beware lest any man spoil you through philosophy and vain deceit, after the tradition of men, after the rudiments of the world, and not after Christ. (Colossians 2:8)"));
        list.add(Verse(
            "Beloved, believe not every spirit, but try the spirits whether they are of God: because many false prophets are gone out into the world. (I John 4:1)"));
        list.add(Verse(
            "See then that ye walk circumspectly, not as fools, but as wise, Redeeming the time, because the days are evil. (Ephesians 5:15-16)"));
        list.add(Verse(
            "Bear ye one another’s burdens, and so fulfil the law of Christ. (Galatians 6:2)"));
        list.add(Verse(
            "Let us therefore follow after the things which make for peace, and things wherewith one may edify another. (Romans 14:19)"));
        list.add(Verse(
            "Obey them that have the rule over you, and submit yourselves: for they watch for your souls, as they that must give account, that they may do it with joy, and not with grief: for that is unprofitable for you. (Hebrews 13:17)"));
        list.add(Verse(
            "For all the law is fulfilled in one word, even in this; Thou shalt love thy neighbour as thyself. (Galatians 5:14)"));
        break;
    }
  }
}
