import 'guts.sol';

contract GutsUserLinkType is Guts {}

contract GutsUser {
    Guts _guts;
    function GutsUser( GutsUserLinkType link ) {
        if( address(link) == address(0x0) ) {
            // mainnet
            throw;
        } else if( address(link) == address(0x1) ) {
            // morden
            throw;
        } else {
            _guts = Guts(address(link));
        }
    }
    modifier guts_owner_only( uint gut ) {
        if( msg.sender == _guts.lookup(gut) ) {
            _
        } else {
            throw;
        }
    }
}
