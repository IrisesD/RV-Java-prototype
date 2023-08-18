
package rv;

import re.structure.*;

public class Verification {

public static Boolean initialised = false;
static public RegExp currentRegExp677327b6;
static public Boolean triggered677327b6;

static public void setupVerification() {

currentRegExp677327b6 = new SequentialComposition(new SequentialComposition(new SequentialComposition(new Repetition(new MatchEventComplement(new Event("before","BackEnd.initialise"))),new Repetition(new SequentialComposition(new SequentialComposition(new MatchEvent(new Event("before","BackEnd.initialise")),new Repetition(new MatchEventComplement(new Event("before","BackEnd.shutdown")))),new MatchEvent(new Event("before","BackEnd.shutdown"))))),new Repetition(new MatchEventComplement(new Event("before","BackEnd.initialise")))),new MatchEvent(new Event("before","UserInfo.openSession")));
triggered677327b6 = false;



Properties.setupVerification();
initialised = true;} }



