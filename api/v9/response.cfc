component accessors="true" {

    property name="data" type="any" default="";
    property name="error" type="boolean" default="false";
    property name="messages" type="array";

    property name="statusCode" type="numeric" default="200";
    property name="statusText" type="string" default="OK";
    
    Response function init() {
        variables.data = {};
        variables.error = false;
        variables.messages = [];
        variables.statusCode = 200;
        variables.statusText = "OK";
        return this;
    }

    function get( boolean reset = false ) {
        cfheader( statuscode=variables.statusCode, statustext=variables.statusText );
        return {
			"error": variables.error ? true : false,
			"messages": variables.messages,
			"data": variables.data
		};
    }

    /**
	 * Add some messages
	 * @message Array or string of message to incorporate
	 */
	function addMessage( required any message ) {
		if ( isSimpleValue( arguments.message ) ) {
			arguments.message = [ arguments.message ];
		}
		variables.messages.addAll( arguments.message );
		return this;
	}

}