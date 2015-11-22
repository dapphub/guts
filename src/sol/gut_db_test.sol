import 'dapple/test.sol';
contract GUT_Test {
    GUT g;
    Tester t;
    function setUp() {
        g = new GUT();
    }
    function testClaimGas() logs_gas() {
        g.claim();
    }
    function testGetGas() logs_gas() {
        g.get(0);
    }
    function testGutStuff() {
        var (owner, ok) = g.get(0);
        assertTrue( ok );
        assertEq( owner, address(g) );

        t = new Tester();
        t._target(address(g));

        GUT(t).claim();
        (owner, ok) = g.get(1);
        assertTrue( ok );
        assertEq( owner, address(g) );

        GUT(t).claim();
        (owner, ok) = g.get(2);
        assertTrue( ok );
        assertEq( owner, address(g) );

        t = new Tester();
        t._target(address(g));

        GUT(t).claim();
        (owner, ok) = g.get(3);
        assertTrue( ok );
        assertEq( owner, address(g) );

        (owner, ok) = g.get(4);
        assertFalse( ok );
        assertEq( owner, address(0x0) );
        GUT(t).claim();
        (owner, ok) = g.get(4);
        assertTrue( ok );
        assertEq( owner, address(g) );
    }
}
