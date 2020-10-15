component {

    function get( userID ) access="remote" returnFormat="json"{
        var user = queryToArray( 
            queryExecute( 
                "SELECT * FROM `users` WHERE `id` = ?", 
                [ arguments.userID ], 
                {  } 
            )
        );
        if( arrayLen( user ) ){
            return user[1]
        } else {
            return { "errorMessage": "User not found" };
        }
    }

    function queryToArray( query ){
        return deserializeJSON( serializeJSON( arguments.query, 'struct' ) );
    }

}