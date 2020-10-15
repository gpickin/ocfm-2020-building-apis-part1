component {

    function get( userID ) access="remote" returnFormat="json"{
        var response = new response();
        var user = queryExecute( 
            "SELECT * FROM `users` WHERE `id` = ?", 
            [ arguments.userID ], 
            { returntype = "array" } 
        );
        if( arrayLen( user ) ){
            return response.setData( user[1] ).get();
        } else {
            return response.setStatusCode( 404 )
                .setStatusText( "Not Found" )
                .setError( true )
                .addMessage( "User not found" )
                .addMessage( "You do not have permission to access that user" )
                .get();
        }
    }

}