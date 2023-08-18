
package rv;

import ltl.structure.*;

public class Verification {

public static Boolean initialised = false;
static public LTL currentLTL6d3586;
static public Boolean triggered6d3586;

static public void setupVerification() {

currentLTL6d3586 = new Until(new Not(new MatchEvent(new Event("before","UserInfo.openSession"))),new MatchEvent(new Event("after","BackEnd.initialise")));
triggered6d3586 = false;



Properties.setupVerification();
initialised = true;} }



