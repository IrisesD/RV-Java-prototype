

package rv;

import java.util.HashMap;

import fits.UserInfo;
import fits.UserSession;

public class Verification {

static public HashMap<UserInfo,Integer> countSessions;

static public void setupVerification() {
// required to reset the automata to their initial state
Properties.setupVerification();


hasTriggeredfbaa4 = new HashMap<UserInfo,Boolean> ();
statefbaa4 = new HashMap<UserInfo,String> ();

hasTriggeredd50c0 = new HashMap<UserInfo,Boolean> ();
stated50c0 = new HashMap<UserInfo,String> ();

hasTriggered53b93 = new HashMap<UserInfo,Boolean> ();
state53b93 = new HashMap<UserInfo,String> ();

hasTriggeredde80c = new HashMap<UserSession,Boolean> ();
statede80c = new HashMap<UserSession,String> ();
countSessions = new HashMap<UserInfo,Integer>();

}



static public HashMap<UserInfo,String> statefbaa4;
static public HashMap<UserInfo,Boolean> hasTriggeredfbaa4;

static public HashMap<UserInfo,String> stated50c0;
static public HashMap<UserInfo,Boolean> hasTriggeredd50c0;

static public HashMap<UserInfo,String> state53b93;
static public HashMap<UserInfo,Boolean> hasTriggered53b93;

static public HashMap<UserSession,String> statede80c;
static public HashMap<UserSession,Boolean> hasTriggeredde80c;
}

