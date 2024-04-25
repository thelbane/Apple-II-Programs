| Project Link | Thumbnail |
| --- | --- |
{% for post in site.posts %}{% if post.tags contains "program" %}| [{{post.date | date: "%-d %B %Y"}} - {{post.title}}]({{post.url}})<br/>{{post.description}}<br/>{% include badges.md tags=post.tags %} | [![{{post.title}}]({{post.thumbnail}})]({{post.url}}) |
{% endif %}{% endfor %}