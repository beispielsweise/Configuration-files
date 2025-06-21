## How to consistantly add opacity on different websites
To add exceptions of oppacity do different websites, do the following:

1. Install [Tampermonkey](https://www.tampermonkey.net/index.php)
2. Create a new script, which contains:
```
// ==UserScript==
// @name         Universal Tab Title Prefixer
// @namespace    https://yourdomain.com
// @version      1.0
// @description  Add domain prefix to tab titles dynamically
// @include      *://*/*
// @grant        none
// ==/UserScript==

(function () {
    const hostname = window.location.hostname.replace(/^www\./, '');
    const mainDomain = hostname.split('.').slice(-2, -1)[0]; // e.g. "youtube" from youtube.com
    const prefix = mainDomain.charAt(0).toUpperCase() + mainDomain.slice(1);

    const applyPrefix = () => {
        const title = document.title;
        if (!title.startsWith(prefix)) {
            document.title = `${prefix} - ${title}`;
        }
    };

    applyPrefix();

    const titleEl = document.querySelector("title");
    if (titleEl) {
        new MutationObserver(applyPrefix).observe(titleEl, { childList: true });
    }
})();
```
The script ensures that the title of the window will always content a Website adress at the start for future use

3. Now you can set a rule for the name flag. The format is _Name_

__Example picom:__
```
opacity-rule = [
  "100:class_g = 'Brave-browser' && name *= 'Youtube'", 
]
```
__Example hyprland:__ 
```
windowrule = float,class:^(brave)$,title:^(Youtube)$
```  
                          
Youtube is used as an example, any name can be added
