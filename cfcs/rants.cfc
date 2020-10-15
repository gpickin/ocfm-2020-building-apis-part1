component {

    /**
	 * Returns an Array of Rants
	 */
	array function list(){
		return queryExecute(
            "SELECT * FROM `rants` ORDER BY `createdDate` DESC",
            [],
            { returntype = "array" }
        )
    }
    
    /**
	 * Returns an Array of Rantss
	 */
	array function listByUserID( required userID ){
		return queryExecute(
            "SELECT * FROM `rants` where userID = ? ORDER BY `createdDate` DESC",
            [ arguments.userID ],
            { returntype = "array" }
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