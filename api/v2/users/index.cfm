<cfif isdefined( "url.userID" )>
    <cfcontent type="application/json">
    <cfoutput>#serializeJSON( new cfcs.users().get( url.userID ) )#</cfoutput>
</cfif>