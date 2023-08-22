
package rv;

import java.util.HashMap;
import java.util.ArrayList;
import timers.*;
import assertion.Assertion;
import fits.BackEnd;
import fits.BankAccount;
import fits.FrontEnd;
import fits.UserInfo;
import fits.UserSession;




public aspect Properties {
static void setupVerification() {
initialiseisBlacklisted();initialisejustWhitelisted();initialisesinceWhitelisted();
initialiseaccountCreationTimes();
}

static HashMap<UserInfo, Boolean> isBlacklisted = new HashMap<UserInfo, Boolean>();
static void initialiseisBlacklisted(){isBlacklisted= new HashMap<UserInfo, Boolean>(); }


static HashMap<UserInfo, Boolean> justWhitelisted = new HashMap<UserInfo, Boolean>();
static void initialisejustWhitelisted(){justWhitelisted= new HashMap<UserInfo, Boolean>(); }


static HashMap<UserInfo, Long> sinceWhitelisted = new HashMap<UserInfo, Long>();
static void initialisesinceWhitelisted(){sinceWhitelisted= new HashMap<UserInfo, Long>(); }



static HashMap<UserInfo, ArrayList<Long>> accountCreationTimes = new HashMap<UserInfo, ArrayList<Long>>();
static void initialiseaccountCreationTimes(){accountCreationTimes= new HashMap<UserInfo, ArrayList<Long>>(); }



after (UserInfo u): call(* UserInfo.makeBlacklisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
isBlacklisted.put(u,true);justWhitelisted.put(u,false);}


after (UserInfo u): call(* UserInfo.makeWhitelisted(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (isBlacklisted.computeIfAbsent(u, (k) -> false)) {
justWhitelisted.put(u,true);isBlacklisted.put(u,false);sinceWhitelisted.put(u,TimerManager.currentTimeMillis());}
  }


after (UserInfo u, String account_number, double amount): call(* UserInfo.withdrawFrom(..)) &&
    args(account_number, amount) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (justWhitelisted.computeIfAbsent(u, (k) -> false) && TimerManager.currentTimeMillis() - sinceWhitelisted.computeIfAbsent(u, (k) -> 0l) < 12*60*60*1000 && amount > 100) {
Assertion.alert("P12 violated");}
  }


after (UserInfo u): call(* UserInfo.createAccount(..)) &&
    target(u) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
while (accountCreationTimes.computeIfAbsent(u, (k) -> new ArrayList<Long>()).size()>0) { if (accountCreationTimes.computeIfAbsent(u, (k) -> new ArrayList<Long>()).get(0) > TimerManager.currentTimeMillis() + 24*60*60*1000l) accountCreationTimes.computeIfAbsent(u, (k) -> new ArrayList<Long>()).remove(0); else break; } if (accountCreationTimes.computeIfAbsent(u, (k) -> new ArrayList<Long>()).size() > 2) Assertion.alert("P13 violated"); else accountCreationTimes.computeIfAbsent(u, (k) -> new ArrayList<Long>()).add(TimerManager.currentTimeMillis());}


before (): call(* BackEnd.initialise(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { Verification.initialisedTime = TimerManager.currentTimeMillis(); }
  }

before (): call(* UserInfo.openSession(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (TimerManager.currentTimeMillis() - Verification.initialisedTime < 10*1000) { Assertion.alert("P11 violated"); }
  }

}