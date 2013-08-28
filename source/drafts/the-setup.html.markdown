---
title: 'The Setup: my own'
# date: TBD When publishing
tags: setup
---

Now that my basic blog is almost finished and before my geekiness wears off and also for everyone who I asked for assistance in choosing my stack, I'd like to tell you what is ticking in here.

READMORE

## Main Goals

I had 3 main goals: my blog should be looking nice without much work. I didn't want to work on the design first, as I usually don't have much intrinsic motivation in that department. The second was inclusion of the metrics system of my choice. I use gaug.es and would like to keep it that way. The third was: offline editing with simple publishing over flakey networks. I travel alot and usually write during those travels, so this was important.

I soon figured out that it came down to two options again: jekyll or middleman. Both are static site gemerators often used in the Ruby world and I know both of them rather well. I couldn't find a strong argument for any other system, so I decided between thos two and picked middleman for my stronger preference. Middleman handles tagging nicer and out of the box. Where Middleman failes hard are drafts: because posts have a date encoded in the file name and the file itself, you always have to change them and bring them in sync when you wrote a post yesterday and want to release it today. Luckily, there is a plugin for that.

For layout, I picked the frameless middleman blog generator found _here_. Ultimately, I am not that happy with it - far too many things are hardcoded into the views and the HTML part are a bit messy. I considered forking it and fixing a lot of those things, but ultimately, I would never use it again. The styles and everything else is fine.

Which brings me to offline and releasing. I chose to actually keep an open blog - the repository can be found [here](http://github.com/skade/skade.me) - if you want, fork it and send pull requests. The repos has 2 branches: _master_ and _staging_ (I am a software engineer after all). The magic happens when you push changes to any of those branches: In that case, [Travis](http://travis-ci.org) will build the website and then push it to Heroku automatically through their deploy support. _staging_ will be pushed to [skade-me-staging.herokuapp.com](skade-me-staging.herokuapp.com) while _master_ will be pushed to the main site. Through a magic environment variable, the staging instance will also hold all my [drafts](skade-me-staging.herokuapp.com), should you even care what I am currently working on. These are not present in the production instance. This allows me to write any post on any device that has an editor capable of handling GIT without having to wait for Heroku to do it's thing. Travis will even notify me if I just broke something.

I will try to keep the staging page open for as long as possible. Let's see how long it takes for someone to submit a draft link somewhere ;).

Next up: adding a content license and something very geeky I am currently hacking on.