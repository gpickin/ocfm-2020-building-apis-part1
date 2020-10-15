<cfset securityService = new cfcs.security()>
<cfif !securityService.isLoggedIn()>
    <cflocation url="/login.cfm" addtoken="false">
</cfif>
<cfset rantID = new cfcs.rants().create( form.body, securityService.getUserID() )>
<cflocation url="/" addtoken="false">