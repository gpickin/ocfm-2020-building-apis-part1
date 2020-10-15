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
            cfheader( statuscode="404" statustext="Not found" );
            return { "errorMessages": [
                "User not found",
                "You do not have permission to access that user"
            ] };
        }
    }

}