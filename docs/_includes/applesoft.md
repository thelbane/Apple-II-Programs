{% capture bas_path %}http://apple2ts.com?{% if page.tags contains "1mhz-slow" %}speed=warp&{% endif %}{% if page.tags contains "monochrome" %}color=green&{% endif %}basic={{ include.src | replace: '
', '

' | url_encode }}{% endcapture %}{% capture code_section %}```
{{ include.src | replace: '
', '

' }}
```
<a href="{{ bas_path }}" target="_blank" rel="noopener noreferrer" class="tryme" title="Try me!">Try me in Apple2TS!</a>{% endcapture %}
{{ code_section | markdownify }}
