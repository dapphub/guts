contract GUTS {
    address[] owners;

    function GUTS() {
        owners.push(address(this));
    }

    function claim() returns (uint gut) {
        return owners.push(msg.sender) - 1;
    }

    function transfer(address to, uint gut) returns (bool ok) {
        if( gut < owners.length ) {
            if( msg.sender == owners[gut] ) {
                owners[gut] = to;
                return true;
            }
        }
        return false;
    }

    function getOwner(uint gut) {
        return getOwner(gut);
    }

    function tryGetOwner(uint gut) returns (address owner, bool ok) {
        return (owners[gut], true);
    }
}
