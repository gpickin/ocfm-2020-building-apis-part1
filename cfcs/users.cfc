component {

    function get( userID ){
        return queryExecute( 
            "SELECT * FROM `users` WHERE `id` = ?", 
            [ arguments.userID ], 
            { returntype = "array" } 
        )[1]
    }

    function getByUsername( username ){
        return queryExecute( 
            "SELECT * FROM `users` WHERE `username` = ?", 
            [ arguments.username ], 
            { returntype = "array" } 
        )[1]
    }

}