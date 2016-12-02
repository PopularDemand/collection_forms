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
