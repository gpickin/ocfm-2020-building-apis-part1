component {

    void function login( userID ){
        session.loggedInUser = userID;
    }

    void function logout(){
        session.loggedInUser = "";
    }

    boolean function isLoggedIn(){
        return structKeyExists( session, "loggedInUser" ) && len( session.loggedInUser );
    }

    function getUserID() {
        param name="session.loggedInUser" default="";
        return session.loggedInUser;
    }
}