<cfinclude template="/inc_header.cfm">
<cfoutput>
    <cfset user = new cfcs.users().get( url.userID )>
    <cfset aRants = new cfcs.rants().listByUserID( userid=url.userID )>
    <h1>#user.username#</h1>
    <h4>Rants</h4>
    <ul>
        <cfloop array="#aRants#" item="rant">
             <cfinclude template="/_rant.cfm">
        </cfloop>
    </ul>
</cfoutput>
<cfinclude template="/inc_footer.cfm">