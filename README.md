guts
---

**G**lobally **U**nique **T**ransferrables

### install

dapple install --save guts 0.1.0

### use

// Extend the base 
import 'guts/user.sol';

// 0x0 will be magically compiled as mainnet address
// 0x1 as morden address
// all others unchanged
// if you do not statically initialize the argument, the compiler
// will NOT optimize out the other addresses
contract OwnedObjectManagerGeneric() is GUTSUser {
    
    function OwnedObjectManager( GUTS guts )
             GUTSUser( guts )
    {
    }
    function () {
        
    }
}

contract OwnedObjectManager is OwnedObjectManagerGeneric(GUTS(0x0)) {}
