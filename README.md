guts
---

**G**lobally **U**nique **T**ransferrables

They're Just Numbers

### Overview

Giving a truly globally unique ID space a sliver of utility has hilarious consequences

### 

### install

`dapple install --save guts 0.1.0`

### usage

    // Extend the base 
    import 'guts/user.sol';

    // 0x0 will be magically compiled as mainnet address
    // 0x1 as morden address
    // all others unchanged
    // if you do not statically initialize the argument, the compiler
    // will NOT optimize out the other addresses

    contract OwnedObjectManager is GutsUser {
        struct Object { bytes32 field }
        mapping( uint => Object ) _objects;
        function OwnedObjectManager( Guts guts )
                 GutsUser( guts )
        {}
        function modifyObject( uint object_id, bytes32 mutation )
                 guts_owner_only( object_id )
        {
            _objects[object_id].field = mutation;
        }
        function exportObject( uint object_id, MigrationDestination destination )
                 guts_owner_only( object_id )
        {
            _guts.transfer( object_id, who );
            destination.import( object_id );
        }
        ...
    }

    contract OwnedObjectManagerMainnet is OwnedObjectManager(GutsUserLinkType(0x0)) {}
