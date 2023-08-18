
package rv;

import java.util.HashMap;
import java.util.HashSet;

import assertion.Assertion;
import fits.BackEnd;
import fits.BankAccount;
import fits.UserInfo;

import timers.*;


public class Verification {

//Property 11
public static Long initialisedTime;

//Property 14
public static Timer initialisationTimer;
public static Boolean fitsReconciled = false;
public static Boolean initialisationTimerSet = false;

//Property 15
public static HashSet<String> awaitingApproval;

static public void setupVerification()
{
TimerManager.reset();

//Property 11
initialisedTime = 0l;

//Property 14
initialisationTimer = new Timer("initialisationTimer",5*60*1000l);
fitsReconciled = false;
initialisationTimerSet = false;

//Property 15
awaitingApproval = new HashSet<String>();

Properties.setupVerification();
}


}

