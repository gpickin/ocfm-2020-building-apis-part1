component {

    function queryToArray( query ){
        return deserializeJSON( serializeJSON( arguments.query, 'struct' ) );
    }
    
    function get( userID ){
        return queryToArray( 
            queryExecute( 
                "SELECT * FROM `users` WHERE `id` = ?", 
                [ arguments.userID ], 
                {  } 
            )
        )[1]
    }

    function getByUsername( username ){
        return queryToArray( 
            queryExecute( 
                "SELECT * FROM `users` WHERE `username` = ?", 
                [ arguments.username ], 
                {  } 
            )
        )[1]
    }

}