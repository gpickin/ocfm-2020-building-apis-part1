<cfoutput>
    <cfset user = new cfcs.users().get( rant.userID )>
    <div class="card mb-3">
        <div class="card-header">
            <strong><a href="/users/?userid=#rant.userID#">#user.username#</a></strong>
            said at #dateTimeFormat( rant.createdDate, "h:nn:ss tt" )#
            on #dateFormat( rant.createdDate, "mmm d, yyyy")#
        </div>
        <div class="panel card-body">
            #rant.body#
		</div>
		<cfprocessingdirective pageEncoding="utf-8">
		<div class="card-footer">
            <button class="btn btn-outline-dark">
                1 👊
            </button>
            <button class="btn btn-outline-dark">
                0 💩
            </button>
		</div>
	</div>
</cfoutput>