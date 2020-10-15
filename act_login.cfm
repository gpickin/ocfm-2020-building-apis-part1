<cfset user = new cfcs.users().getByUsername( form.username )>
<cfset new cfcs.security().login( user.id )>
<cflocation url="/" addtoken="false">