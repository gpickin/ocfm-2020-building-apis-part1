component {

    function get( userID ) access="remote"{
        return queryToArray( 
            queryExecute( 
                "SELECT * FROM `users` WHERE `id` = ?", 
                [ arguments.userID ], 
                {  } 
            )
        )[1]
    }

    function queryToArray( query ){
        return deserializeJSON( serializeJSON( arguments.query, 'struct' ) );
    }

}