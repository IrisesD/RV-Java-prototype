

package rv;

import assertion.Assertion;
import fits.UserInfo;
import fits.UserSession;
import java.util.HashMap;








public aspect Properties {
static void setupVerification() {
initialisehasTriggeredfbaa4();initialisestatefbaa4();
initialisehasTriggeredd50c0();initialisestated50c0();initialisecount();
initialisehasTriggered53b93();initialisestate53b93();
initialisehasTriggeredde80c();initialisestatede80c();
}

static HashMap<UserInfo, Boolean> hasTriggeredfbaa4 = new HashMap<UserInfo, Boolean>();
static void initialisehasTriggeredfbaa4(){hasTriggeredfbaa4= new HashMap<UserInfo, Boolean>(); }


static HashMap<UserInfo, String> statefbaa4 = new HashMap<UserInfo, String>();
static void initialisestatefbaa4(){statefbaa4= new HashMap<UserInfo, String>(); }



static HashMap<UserInfo, Boolean> hasTriggeredd50c0 = new HashMap<UserInfo, Boolean>();
static void initialisehasTriggeredd50c0(){hasTriggeredd50c0= new HashMap<UserInfo, Boolean>(); }


static HashMap<UserInfo, String> stated50c0 = new HashMap<UserInfo, String>();
static void initialisestated50c0(){stated50c0= new HashMap<UserInfo, String>(); }


static HashMap<UserInfo, Integer> count = new HashMap<UserInfo, Integer>();
static void initialisecount(){count= new HashMap<UserInfo, Integer>(); }



static HashMap<UserInfo, Boolean> hasTriggered53b93 = new HashMap<UserInfo, Boolean>();
static void initialisehasTriggered53b93(){hasTriggered53b93= new HashMap<UserInfo, Boolean>(); }


static HashMap<UserInfo, String> state53b93 = new HashMap<UserInfo, String>();
static void initialisestate53b93(){state53b93= new HashMap<UserInfo, String>(); }



static HashMap<UserSession, Boolean> hasTriggeredde80c = new HashMap<UserSession, Boolean>();
static void initialisehasTriggeredde80c(){hasTriggeredde80c= new HashMap<UserSession, Boolean>(); }


static HashMap<UserSession, String> statede80c = new HashMap<UserSession, String>();
static void initialisestatede80c(){statede80c= new HashMap<UserSession, String>(); }



before (UserInfo u): call(* UserInfo.makeDisabled(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredfbaa4.computeIfAbsent(u, (k) -> false) && statefbaa4.computeIfAbsent(u, (k) -> "Enabled").equals("Enabled") && (true)) {
{}statefbaa4.put(u,"Disabled");hasTriggeredfbaa4.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.makeEnabled(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredfbaa4.computeIfAbsent(u, (k) -> false) && statefbaa4.computeIfAbsent(u, (k) -> "Enabled").equals("Disabled") && (true)) {
{}statefbaa4.put(u,"Enabled");hasTriggeredfbaa4.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.withdrawFrom(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredfbaa4.computeIfAbsent(u, (k) -> false) && statefbaa4.computeIfAbsent(u, (k) -> "Enabled").equals("Disabled") && (true)) {
{}statefbaa4.put(u,"Bad");hasTriggeredfbaa4.put(u,true);System.out.println("P5 violated");}
  }


before (UserInfo u): call(* UserInfo.makeGreylisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredd50c0.computeIfAbsent(u, (k) -> false) && stated50c0.computeIfAbsent(u, (k) -> "NonGreylisted").equals("NonGreylisted") && (true)) {
{count.put(u,0);}stated50c0.put(u,"Greylisted");hasTriggeredd50c0.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.depositTo(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredd50c0.computeIfAbsent(u, (k) -> false) && stated50c0.computeIfAbsent(u, (k) -> "NonGreylisted").equals("Greylisted") && (true)) {
{count.put(u,count.computeIfAbsent(u, (k) -> 0) + 1);}stated50c0.put(u,"Greylisted");hasTriggeredd50c0.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.makeBlacklisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredd50c0.computeIfAbsent(u, (k) -> false) && stated50c0.computeIfAbsent(u, (k) -> "NonGreylisted").equals("Greylisted") && (true)) {
{count.put(u,0);}stated50c0.put(u,"NonGreylisted");hasTriggeredd50c0.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.makeWhitelisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredd50c0.computeIfAbsent(u, (k) -> false) && stated50c0.computeIfAbsent(u, (k) -> "NonGreylisted").equals("Greylisted") && (count.computeIfAbsent(u, (k) -> 0) >= 3)) {
{}stated50c0.put(u,"NonGreylisted");hasTriggeredd50c0.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.makeWhitelisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredd50c0.computeIfAbsent(u, (k) -> false) && stated50c0.computeIfAbsent(u, (k) -> "NonGreylisted").equals("Greylisted") && (count.computeIfAbsent(u, (k) -> 0) < 3)) {
{}stated50c0.put(u,"Bad");hasTriggeredd50c0.put(u,true);System.out.println("P6 violated");}
  }


before (UserInfo u): call(* UserInfo.openSession(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered53b93.computeIfAbsent(u, (k) -> false) && state53b93.computeIfAbsent(u, (k) -> "Start").equals("Start") && (true)) {
{ Verification.countSessions.put(u,Verification.countSessions.getOrDefault(u,0)+1); if (Verification.countSessions.getOrDefault(u,0) > 3) { Assertion.alert("P9 violated"); } }state53b93.put(u,"Start");hasTriggered53b93.put(u,true);}
  }


before (UserInfo u): call(* UserInfo.closeSession(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggered53b93.computeIfAbsent(u, (k) -> false) && state53b93.computeIfAbsent(u, (k) -> "Start").equals("Start") && (true)) {
{ Verification.countSessions.put(u,Verification.countSessions.get(u)-1); }state53b93.put(u,"Start");hasTriggered53b93.put(u,true);}
  }


before (UserSession s): call(* UserSession.openSession(..)) &&
    target(s) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredde80c.computeIfAbsent(s, (k) -> false) && statede80c.computeIfAbsent(s, (k) -> "LoggedOut").equals("LoggedOut") && (true)) {
{}statede80c.put(s,"LoggedIn");hasTriggeredde80c.put(s,true);}
  }


before (UserSession s): call(* UserSession.closeSession(..)) &&
    target(s) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredde80c.computeIfAbsent(s, (k) -> false) && statede80c.computeIfAbsent(s, (k) -> "LoggedOut").equals("LoggedIn") && (true)) {
{}statede80c.put(s,"LoggedOut");hasTriggeredde80c.put(s,true);}
  }


before (UserSession s): call(* UserSession.log(..)) &&
    target(s) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!hasTriggeredde80c.computeIfAbsent(s, (k) -> false) && statede80c.computeIfAbsent(s, (k) -> "LoggedOut").equals("LoggedOut") && (true)) {
{}statede80c.put(s,"Bad");hasTriggeredde80c.put(s,true);System.out.println("P10 violated");}
  }


before (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { hasTriggeredfbaa4 = new HashMap<UserInfo,Boolean> (); hasTriggeredd50c0 = new HashMap<UserInfo,Boolean> (); hasTriggered53b93 = new HashMap<UserInfo,Boolean> (); hasTriggeredde80c = new HashMap<UserSession,Boolean> ();}
  }

after (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { hasTriggeredfbaa4 = new HashMap<UserInfo,Boolean> (); hasTriggeredd50c0 = new HashMap<UserInfo,Boolean> (); hasTriggered53b93 = new HashMap<UserInfo,Boolean> (); hasTriggeredde80c = new HashMap<UserSession,Boolean> (); }
  }

}