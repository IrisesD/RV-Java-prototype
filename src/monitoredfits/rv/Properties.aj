package rv;

import re.structure.*;
import java.util.HashMap;

import fits.*;

import assertion.Assertion;







public aspect Properties {
static void setupVerification() {
}

after (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (Verification.initialised) { if (!Verification.triggered677327b6) {Verification.currentRegExp677327b6 = Verification.currentRegExp677327b6.derivative(new Event("after", "#")); Verification.triggered677327b6 = true; } if (Verification.currentRegExp677327b6.hasEmpty()) { Assertion.alert("Violation detected on  property { BAD ((((!(before BackEnd.initialise))* ; (((before BackEnd.initialise ; (!(before BackEnd.shutdown))*) ; before BackEnd.shutdown))*) ; (!(before BackEnd.initialise))*) ; before UserInfo.openSession)}"); } Verification.triggered677327b6 = false; }
  }

before (): call(* BackEnd.shutdown(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { Verification.currentRegExp677327b6 = Verification.currentRegExp677327b6.derivative(new Event("before","BackEnd.shutdown")); Verification.triggered677327b6 = true;}
  }

before (): call(* UserInfo.openSession(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { Verification.currentRegExp677327b6 = Verification.currentRegExp677327b6.derivative(new Event("before","UserInfo.openSession")); Verification.triggered677327b6 = true;}
  }

before (): call(* BackEnd.initialise(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (true) { Verification.currentRegExp677327b6 = Verification.currentRegExp677327b6.derivative(new Event("before","BackEnd.initialise")); Verification.triggered677327b6 = true;}
  }

before (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (Verification.initialised) { if (!Verification.triggered677327b6) {Verification.currentRegExp677327b6 = Verification.currentRegExp677327b6.derivative(new Event("before", "#")); Verification.triggered677327b6 = true; } if (Verification.currentRegExp677327b6.hasEmpty()) { Assertion.alert("Violation detected on  property { BAD ((((!(before BackEnd.initialise))* ; (((before BackEnd.initialise ; (!(before BackEnd.shutdown))*) ; before BackEnd.shutdown))*) ; (!(before BackEnd.initialise))*) ; before UserInfo.openSession)}"); } Verification.triggered677327b6 = false; }
  }

}