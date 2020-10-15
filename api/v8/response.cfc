component accessors="true" {

    property name="data" type="any" default="";
    property name="error" type="boolean" default="false";
    property name="messages" type="array";
    
    Response function init() {
        variables.data = {};
        variables.error = false;
        variables.messages = [];
        return this;
    }

    function get( boolean reset = false ) {
		return {
			"error": variables.error ? true : false,
			"messages": variables.messages,
      "data": variables.data,
		};
    }

}