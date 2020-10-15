<cfif isdefined( "url.userID" )>
    <cfoutput>#serializeJSON( new cfcs.users().get( url.userID ) )#</cfoutput>
</cfif>