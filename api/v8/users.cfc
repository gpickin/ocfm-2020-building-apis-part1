component {

    function get( userID ) access="remote" returnFormat="json"{
        var response = new response();
        var user = queryToArray( 
            queryExecute( 
                "SELECT * FROM `users` WHERE `id` = ?", 
                [ arguments.userID ], 
                {  } 
            )
        );
        if( arrayLen( user ) ){
            return response.setData( user[1] ).get();
        } else {
            cfheader( statuscode="404", statustext="Not found" );
            return response.setError( true )
                .setMessages( 
                    [
                        "User not found",
                        "You do not have permission to access that user"
                    ] 
                )
                .get();
        }
    }

    function queryToArray( query ){
        return deserializeJSON( serializeJSON( arguments.query, 'struct' ) );
    }

}