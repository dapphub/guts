contract Guts
{
    uint _next_id;
    mapping(uint => address) _guts;
    function Guts() {
        _guts[0] = this;
        _next_id = 1;
    }
    function lookup(uint gut) constant returns (address owner) {
        if( gut >= _next_id ) {
            throw;
        }
        return _guts[gut];
    }
    function tryLookup(uint gut) constant returns (address owner, bool ok) {
        if( gut >= _next_id ) {
            return (0x0, false);
        } else {
            return (_guts[gut], true);
        }
    }
    function claim() returns (uint gut) {
        _guts[_next_id] = msg.sender;
        return _next_id++; // increment "after" return
    }
    function transfer(uint gut, address to) {
        if( msg.sender == _guts[gut] ) {
            _guts[gut] = to;
        } else {
            throw;
        }
    }
}



