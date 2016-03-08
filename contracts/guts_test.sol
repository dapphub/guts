import 'dapple/test.sol';
import 'guts.sol';
import 'user.sol';

contract GutsTest is Test, GutsUser(GutsUserLinkType(0x2)) {
    Tester t;
    function setUp() {
        _guts = new Guts();
        t = new Tester();
        t._target(_guts);
    }
    function testClaimGas() logs_gas() {
        _guts.claim();
    }
    function testTryLookupGas() logs_gas() {
        _guts.tryLookup(0);
    }
    function testLookupGas() logs_gas() {
        _guts.lookup(0);
    }
    function testClaimAndTransferGas() logs_gas() {
        _guts.claim();
        _guts.transfer(1, address(0x1));
    }
    function testFailLookupTooBig() {
        _guts.lookup(1);
    }
    function testGutStuff() {
        var (owner, ok) = _guts.tryLookup(0);
        assertTrue( ok );
        assertEq( owner, address(_guts), "wrong owner for 0" );


        Guts(t).claim();
        (owner, ok) = _guts.tryLookup(1);
        assertTrue( ok );
        assertEq( owner, address(t), "wrong owner for first claimer" );

        Guts(t).claim();
        (owner, ok) = _guts.tryLookup(2);
        assertTrue( ok );
        assertEq( owner, address(t) );

        Guts(t).claim();
        (owner, ok) = _guts.tryLookup(3);
        assertTrue( ok );
        assertEq( owner, address(t) );

        (owner, ok) = _guts.tryLookup(4);
        assertFalse( ok );
        assertEq( owner, address(0x0) );
        Guts(t).claim();
        (owner, ok) = _guts.tryLookup(4);
        assertTrue( ok );
        assertEq( owner, address(t) );
    }
}
