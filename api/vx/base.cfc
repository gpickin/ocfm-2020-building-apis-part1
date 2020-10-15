component {

    function throw418( message="Validation Error"){
        var response = new response();
        return response.setStatusCode( 418 )
                .setErrorMessage( arguments.message )
                .get();
    }
    function throw404( message="Not Found"){
        var response = new response();
        return response.setStatusCode( 404 )
                .setErrorMessage( arguments.message )
                .get();
    }












    function handleException( exception ){
        var response = new response();
        return response.setStatusCode( 404 )
                .setErrorMessage( exception.message )
                .get();
    }

}