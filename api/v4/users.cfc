component {

    function get( userID ) access="remote" returnFormat="json"{
        var user = queryExecute( 
            "SELECT * FROM `users` WHERE `id` = ?", 
            [ arguments.userID ], 
            { returntype = "array" } 
        );
        if( arrayLen( user ) ){
            return user[1]
        } else {
            return { "errorMessage": "User not found" };
        }
    }

}