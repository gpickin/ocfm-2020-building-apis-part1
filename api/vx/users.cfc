component extends="base" {

    function get( userID ) access="remote" returnFormat="json"{
        if( !structKeyExists( arguments, "userID" ) || !isNumeric( arguments.userID )){
            return throw418( message="UserID is required and must be numeric" );
        }
        var response = new response();
        var user = queryToArray( 
            queryExecute( 
                "SELECT * FROM `users` WHERE `id` = ?", 
                [ arguments.userID ], 
                {  } 
            )
        );
        if( arrayLen( user ) ){
            return response.addHeader( name="x-environment", value="development")
                .setData( user[1] )
                .get();
        } else {
            return throw404( message="User not Found" );
        }
    }

    function queryToArray( query ){
        return deserializeJSON( serializeJSON( arguments.query, 'struct' ) );
    }

}