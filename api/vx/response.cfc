component accessors="true" {

    property name="data" type="any" default="";
    property name="error" type="boolean" default="false";
    property name="messages" type="array";

    property name="statusCode" type="numeric" default="200";
    property name="statusText" type="string" default="OK";

    property name="headers" type="array";
    
    Response function init() {
        variables.data = {};
        variables.error = false;
        variables.messages = [];
        variables.statusCode = 200;
        variables.statusText = "OK";
        variables.headers = [];
        return this;
    }

    STATUS_TEXTS = {
		"100": "Continue",
		"101": "Switching Protocols",
		"102": "Processing",
		"200": "OK",
		"201": "Created",
		"202": "Accepted",
		"203": "Non-authoritative Information",
		"204": "No Content",
		"205": "Reset Content",
		"206": "Partial Content",
		"207": "Multi-Status",
		"208": "Already Reported",
		"226": "IM Used",
		"300": "Multiple Choices",
		"301": "Moved Permanently",
		"302": "Found",
		"303": "See Other",
		"304": "Not Modified",
		"305": "Use Proxy",
		"307": "Temporary Redirect",
		"308": "Permanent Redirect",
		"400": "Bad Request",
		"401": "Unauthorized",
		"402": "Payment Required",
		"403": "Forbidden",
		"404": "Not Found",
		"405": "Method Not Allowed",
		"406": "Not Acceptable",
		"407": "Proxy Authentication Required",
		"408": "Request Timeout",
		"409": "Conflict",
		"410": "Gone",
		"411": "Length Required",
		"412": "Precondition Failed",
		"413": "Payload Too Large",
		"414": "Request-URI Too Long",
		"415": "Unsupported Media Type",
		"416": "Requested Range Not Satisfiable",
		"417": "Expectation Failed",
		"418": "I'm a teapot",
		"421": "Misdirected Request",
		"422": "Unprocessable Entity",
		"423": "Locked",
		"424": "Failed Dependency",
		"426": "Upgrade Required",
		"428": "Precondition Required",
		"429": "Too Many Requests",
		"431": "Request Header Fields Too Large",
		"444": "Connection Closed Without Response",
		"451": "Unavailable For Legal Reasons",
		"499": "Client Closed Request",
		"500": "Internal Server Error",
		"501": "Not Implemented",
		"502": "Bad Gateway",
		"503": "Service Unavailable",
		"504": "Gateway Timeout",
		"505": "HTTP Version Not Supported",
		"506": "Variant Also Negotiates",
		"507": "Insufficient Storage",
		"508": "Loop Detected",
		"510": "Not Extended",
		"511": "Network Authentication Required",
		"599": "Network Connect Timeout Error"
	};

    function get( boolean reset = false ) {
        getPageContext().getResponse().setStatus( javaCast( "int", variables.statusCode ), javaCast( "string", variables.statusText ) );
        for ( var thisHeader in variables.headers ) {
            getPageContext().getResponse().addHeader( javaCast( "string", thisHeader.name ), javaCast( "string", thisHeader.value ) );
        }
        
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
    
    /**
	 * Add a header
	 * @name The header name ( e.g. "Content-Type" )
	 * @value The header value ( e.g. "application/json" )
	 */
	function addHeader( required string name, required string value ) {
		arrayAppend( variables.headers, { name: arguments.name, value: arguments.value } );
		return this;
    }
    
    /**
	 * Sets the error message with a code for the API response
	 * @errorMessage The errorMessage to be set
	 * @statusCode The status code to be set
	 * @statusText The status text to be set
	 *
	 * @return Returns the Response object for chaining

	 */
	function setErrorMessage( required errorMessage, statusCode, statusText ) {
		setError( true );
		addMessage( arguments.errorMessage );
		if ( !isNull( arguments.statusCode ) ) {
			setStatusCode( arguments.statusCode, !isNull( arguments.statusText ) ? arguments.statusText : "" );
		} else {
			if ( !isNull( arguments.statusText ) ) {
				setStatusText( arguments.statusText );
			}
		}
		return this;
    }
    
    /**
	 * Sets the status code with a statusText for the API response
	 * @statusCode The status code to be set
	 * @statusText The status text to be set
	 *
	 * @return Returns the Response object for chaining
	 */
	function setStatusCode( required statusCode, statusText ) {
		if ( isNull( arguments.statusText ) ) {
			if ( structKeyExists( variables.STATUS_TEXTS, arguments.statusCode ) ) {
				arguments.statusText = variables.STATUS_TEXTS[ arguments.statusCode ];
			} else {
				arguments.statusText = "";
			}
		}
		variables.statusCode = arguments.statusCode;
		variables.statusText = arguments.statusText;
		return this;
	}

}