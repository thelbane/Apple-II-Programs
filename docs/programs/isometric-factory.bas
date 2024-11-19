---
---
{% capture src_name %}src/{{ page.name | split: "." | first }}.txt{% endcapture %}
{% include {{ src_name }} %}