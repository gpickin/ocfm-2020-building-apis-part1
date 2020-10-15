<cfinclude template="/inc_header.cfm">
<cfset aRants = new cfcs.rants().list()>
<cfoutput>
	<h2>All Rants</h2>

    <cfif aRants.isEmpty()>
        <h3>No rants yet</h3>
        <a href="/rants/new.cfm" class="btn btn-primary">Start one now!</a>
    <cfelse>
        <a href="/rants/new.cfm" class="btn btn-primary">Start a new rant!</a>

		<cfloop array="#aRants#" item="rant">
            <cfinclude template="/_rant.cfm">
        </cfloop>
	</cfif>
</cfoutput>

<cfinclude template="/inc_footer.cfm">