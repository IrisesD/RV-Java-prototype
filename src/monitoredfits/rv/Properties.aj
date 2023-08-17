package rv;

import java.util.HashMap;

import ltl.structure.*;
import fits.*;
import assertion.Assertion;






public aspect Properties {
static void setupVerification() {
}

before (): call(* UserInfo.openSession(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!Verification.triggered6d3586) { Verification.currentLTL6d3586 = Verification.currentLTL6d3586.derivative(new Event("before","UserInfo.openSession")); Verification.triggered6d3586 = true;}
  }

after (): call(* BackEnd.initialise(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (!Verification.triggered6d3586) { Verification.currentLTL6d3586 = Verification.currentLTL6d3586.derivative(new Event("after","BackEnd.initialise")); Verification.triggered6d3586 = true;}
  }

before (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (Verification.initialised) { if (!Verification.triggered6d3586) {Verification.currentLTL6d3586 = Verification.currentLTL6d3586.derivative(new Event("before", "#")); Verification.triggered6d3586 = true; } if (Verification.currentLTL6d3586.cannotMatch()) { Assertion.alert("Violation detected on property { GOOD (not [before UserInfo.openSession] until [after BackEnd.initialise])}"); } Verification.triggered6d3586 = false; }
  }

after (): call(* *.*(..)) &&
   !(adviceexecution())  &&
   !cflow(adviceexecution())  &&
   !cflowbelow(adviceexecution())  {
    if (Verification.initialised) { if (!Verification.triggered6d3586) {Verification.currentLTL6d3586 = Verification.currentLTL6d3586.derivative(new Event("after", "#")); Verification.triggered6d3586 = true; } if (Verification.currentLTL6d3586.cannotMatch()) { Assertion.alert("Violation detected on property { GOOD (not [before UserInfo.openSession] until [after BackEnd.initialise])}"); } Verification.triggered6d3586 = false; }
  }

}