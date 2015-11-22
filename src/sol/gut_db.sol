contract GUT {
    address[] controllers;
    function GUT() {
        controllers.push(address(this));
    }
    // No error check because this can never return 0.
    function claim() returns (uint gut) {
        return controllers.push(msg.sender) - 1;
    }
    function transfer(address to, uint gut) returns (bool ok) {
        if( gut < controllers.length ) {
            if( msg.sender == controllers[gut] ) {
                controllers[gut] = to;
                return true;
            }
        }
        // implicit return false;
    }
    // lookup? resolve?
    function get(uint gut) returns (address owner, bool ok) {
        return (controllers[gut], true);
    }
}
