component {

    function queryToArray( query ){
        return deserializeJSON( serializeJSON( arguments.query, 'struct' ) );
    }

    /**
	 * Returns an Array of Rants
	 */
	array function list(){
		return queryToArray( 
            queryExecute(
                "SELECT * FROM `rants` ORDER BY `createdDate` DESC",
                [],
                { }
            )
        )
    }
    
    /**
	 * Returns an Array of Rantss
	 */
	array function listByUserID( required userID ){
		return queryToArray( 
            queryExecute(
                "SELECT * FROM `rants` where userID = ? ORDER BY `createdDate` DESC",
                [ arguments.userID ],
                {  }
            )
        )
    }
    
    /**
	 * create
	 */
	function create( required body, required userID ){
		queryExecute(
            "
                INSERT INTO `rants` (`body`, `createdDate`, `modifiedDate`, `userId`)
                VALUES (?, ?, ?, ?)
            ",
            [
                arguments.body,
                { value = now(), cfsqltype = "TIMESTAMP" },
                { value = now(), cfsqltype = "TIMESTAMP" },
                arguments.userID
            ],
            { result = "local.result" }
		);
		return result.GENERATED_KEY;
	}

}