<div class="container">
	<div class="row">
		<div class="col s12 m4">
			<div class="card">
				<div class="card user-info">
					<% unless current_user.profile.url.nil? %>
					<div class="card-image">
						<img src="<%= current_user.profile.url %>" />
					</div>
					<% end %>
				</div>
				<div class="card-content">
					<div class="card-title"><%= current_user.name %></div>
					<p>이메일 : <%= current_user.email %></p>
					<p>올린 글 개수 : <%= @posts_count %></p>
					<p>팔로워 : <%= current_user.followers.length %></p>
					<p>팔로잉 : <%= current_user.followings.length %></p>
					<%= link_to new_post_path do %>
						<button class="btn purple purple">글쓰기</button>
					<% end %>
				</div>
			</div>
		</div>
		<div class="col s12 m8">
    			<% @posts.each do |i| %>
        			<% if i.content == contents  %>
        				<%= render partial: "post", object: post %>
        			<% end %>
				<% end %>
		</div>
	</div>
</div>