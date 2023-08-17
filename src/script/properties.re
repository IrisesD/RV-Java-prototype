VERIFICATIONCODE

//this is ignored

PRELUDE

package rv;

import re.structure.*;
import java.util.HashMap;

import fits.*;

import assertion.Assertion;


REGULAREXPRESSIONS

// P2
// The transaction system must be initialised before any user logs in.
// + The initialisation can only happen before shutdown.

property bad behaviour {
(![before BackEnd.initialise])*;([before BackEnd.initialise];(![before BackEnd.shutdown])*;[before BackEnd.shutdown])*;(![before BackEnd.initialise])*;[before UserInfo.openSession]
}
