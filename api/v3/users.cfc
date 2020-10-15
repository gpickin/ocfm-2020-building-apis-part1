component {

    function get( userID ) access="remote"{
        return queryExecute( 
            "SELECT * FROM `users` WHERE `id` = ?", 
            [ arguments.userID ], 
            { returntype = "array" } 
        )[1]
    }

}