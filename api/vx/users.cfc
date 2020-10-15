component extends="base" {

    function get( userID ) access="remote" returnFormat="json"{
        if( !structKeyExists( arguments, "userID" ) || !isNumeric( arguments.userID )){
            return throw418( message="UserID is required and must be numeric" );
        }
        var response = new response();
        var user = queryExecute( 
            "SELECT * FROM `users` WHERE `id` = ?", 
            [ arguments.userID ], 
            { returntype = "array" } 
        );
        if( arrayLen( user ) ){
            return response.addHeader( name="x-gavin", value="testing my header")
                .setData( user[1] )
                .get();
        } else {
            return throw404( message="User not Found" );
        }
    }

}