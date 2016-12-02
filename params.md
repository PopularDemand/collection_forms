<form action="/posts/1" method="post">
<input type="hidden" name='\_method' value="patch">
<input name="utf8" type="hidden" value="✓">
<input <input name="authenticity_token" type="hidden" value="<%=form_authenticity_token%>">
<input name="post[title]" type="text">
<input name="post[body]" type="text">
<input name="post[tag_ids][]" type="hidden" value="">
<input name="post[tag_ids][]" type="checkbox" value="2">
<input name="post[tag_ids][]" type="checkbox" value="3">
<input name="post[tag_ids][]" type="checkbox" value="5">
<input type="submit" value="Update Post">
</form>


we did this. we cannot comment it out. here.

<hr>
<h2>WOW - Check this out!</h2>
<%= form_tag(posts_path(@post.id), method: "post") do %>
<%= label_tag("post[title]", "Title:") %>
<%= text_field_tag("post[title]") %><br>
<%= label_tag("post[body]", "Body:") %>
  <%= text_field_tag("post[body]") %><br>
  <%= select_tag(
        "post[category_id]",
        options_for_select( @category_options, @post.category_id )
      ) %>
  <br>
  <%= submit_tag("Save Post") %>
<% end  %>
