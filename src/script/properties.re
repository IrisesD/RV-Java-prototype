VERIFICATIONCODE

//this is ignored

PRELUDE

package rv;

import re.structure.*;
import java.util.HashMap;

import fits.*;

import assertion.Assertion;


REGULAREXPRESSIONS

// P5
// Once a user is disabled, he or she may not withdraw from an account until 
// being made enable again.

property foreach target (UserInfo u) bad behaviour {
(?)* ; [before makeDisabled] ; (![before makeEnabled])* ; [before withdrawFrom]
}
