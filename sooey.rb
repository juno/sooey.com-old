# -*- coding: utf-8 -*-
require 'sinatra'
require 'slim'
require 'sass'

# Workaround to fix an issue between Sinatra 1.0 and ruby 1.9.2
# Skipped when app is not launched directly
enable :run if $0.eql?(__FILE__)

module Sinatra::Templates
  def slim(template, options={}, locals={}); render :slim, template, options, locals; end
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
  def page
    request.path_info.gsub('/', '')
  end
end
set :scss, :style => :compact
get('/') { slim :index }
get('/style.css') { scss :style }
get('/journals') { slim :journals }
get('/projects') { slim :projects }
get('/talks') { slim :talks }
get('/publications') { slim :publications }

__END__

@@ layout
html
  head
    title junya ogura: the official
    link(rel="stylesheet" href="/style.css" type="text/css")
    link(rel="stylesheet" href="/facebox/facebox.css" type="text/css")
    link(rel="stylesheet" href="http://fonts.googleapis.com/css?family=Merriweather" type="text/css")
  body(class=page)== yield

@@ index
h1 Junya Ogura
h2 Web service developer.
section.contacts
  ul.clearfix
    li
      a(href="mailto:junyaogura@gmail.com") junyaogura@gmail.com
    li
      a(href="http://twitter.com/junya") Twitter
    li
      a(href="http://www.facebook.com/junya.ogura") Facebook
section.bio
  h1 Bio
  p
    | I was born in Niigata, Japan on March 5, 1980. In 1985, My family moved to Tokyo and I currently reside there.
    | I’m a web service developer since 1997 and freelancing from 2005 through 2011.
    | I co-founded
    a(href="http://about.qnyp.com/") qnyp
    | in Jan 2012.
section.favorites
  h1 Favorites
  p
    | Simplicity,
    |  Dvorak keyboard layout and Emacs,
    a(href="http://en.wikipedia.org/wiki/Lostprophets") Lostprophets
    | , 
    a(href="http://en.wikipedia.org/wiki/Underoath") Underoath
    | , 
    a(href="http://en.wikipedia.org/wiki/Radiohead") Radiohead
    | , 
    a(href="http://en.wikipedia.org/wiki/Thursday_(band)") Thursday
    | , 
    a(href="http://en.wikipedia.org/wiki/Athlete_(band)") Athlete
    | , 
    a(href="http://en.wikipedia.org/wiki/Hard-Fi") Hard-fi
    | , 
    a(href="http://en.wikipedia.org/wiki/Nineteen_Eighty-Four") 1984
    | , 
    a(href="http://en.wikipedia.org/wiki/Ubik") Ubik
    | , 
    |  Japanimation and manga.
section.pages
  ul.clearfix
    li.journals
      a(href="/journals") Journals
    li.projects
      a(href="/projects") Projects
    li.talks
      a(href="/talks") Talks
    li.publications
      a(href="/publications") Publications

@@ journals
h1 Journals
section
  ul
    li
      a(href="http://journal.sooey.com/") Journal (2010-)
    li
      a(href="http://old-journal.sooey.com/") Old journal (2003-2009)
nav
  a(href="/") <<

@@ projects
h1 Projects
section
  ul
    li
      a(href="https://github.com/juno") My projects on GitHub
    li
      a(href="http://whovar.com/") Whovar (stealth)
    li
      a(href="https://groups.google.com/group/heroku-ja") heroku-ja
    li
      a(href="http://classic.guesswork.jp/") guesswork (on hold)
nav
  a(href="/") <<

@@ talks
h1 Talks
section
  h2 2010
  ul
    li
      a(href="http://www.slideshare.net/juno/heroku-the-ruby-cloud") Heroku the Ruby Cloud
      = " Cloudmix at Dec 11, 2010"
    li
      a(href="http://www.slideshare.net/juno/iam-5590955") IAMのはじめかた
      = " 第5回AWS User Group-Japan勉強会 at Oct 28, 2010"
    li
      a(href="http://www.slideshare.net/serverworks/webamazon-ec2") Webデベロッパに必要なスキルとしてのAmazon EC2
      = " at Apr 14, 2010"
  h2 2009
  ul
    li
      a(href="http://www.slideshare.net/juno/there-are-no-perfect-redmine") 完璧なRedmineなど存在しない
      = " Redmine勉強会 at Jun 12, 2009"
nav
  a(href="/") <<

@@ publications
h1 Publications
section
  ul.clearfix
    li
      a(href="http://www.gihyo.co.jp/books/syoseki.php/4-7741-1998-9") Mar, 2004: 技術評論社 オープンソースJavaプロダクツ 軽量コンテナSpring Framework入門
    li
      | Oct, 2003: 技術評論社 SoftwareDesign 2003年10月号 特集「未来形OS探検隊出動！」
nav
  a(href="/") <<

@@ style
body {
  color: #333;
  font-family: 'Merriweather', arial, serif;
  margin: 0 auto;
  width: 90%;
}
a, a:visited, a:link, a:active {
  color: #c00;
  text-decoration: none;
}
a:hover {
  text-decoration: underline;
}
h1 {
  font-size: 6em;
  font-weight: normal;
  margin: 0 0 .3em;
}
h2 {
  font-size: 2em;
  font-weight: normal;
  margin: 0 0 .3em;
}
section {
  margin: 0;
  padding: 0 0 3em 0;
  h1 {
    font-size: 3em;
    margin: 0;
  }
  h2 {
    font-size: 2em;
    margin: 1em 0 .5em;
  }
  p {
    font-size: 2em;
    margin: 0;
  }
  ul {
    font-size: 3em;
    list-style: none;
    margin: 0;
    padding: 0;
  }
  ul.clearfix {
    display: inline-table;
    font-size: 1.6em;
    li {
      float: left;
      margin: 0 1em 0 0;
      padding: 0;
    }
  }
  ul.clearfix:after {
    content: ".";
    display: block;
    height: 0;
    clear: both;
    visibility: hidden;
  }
}
body.journals {
  background-color: #c00;
  color: #fff;
  a { color: #fff; }
}
body.projects {
  background-color: #0c0;
  color: #fff;
  a { color: #fff; }
}
body.talks {
  background-color: #00c;
  color: #fff;
  a { color: #fff; }
  ul { font-size: 1.6em; }
}
body.publications {
  background-color: #333;
  color: #fff;
  a { color: #fff; }
  ul { font-size: 1.6em; }
}
section.pages {
  li a {
    color: #fff;
    padding: .5em;
  }
  li a:hover { text-decoration: none; }
  .journals a { background-color: #c00; }
  .journals a:hover { background-color: #f00; }
  .projects a { background-color: #0c0; }
  .projects a:hover { background-color: #0f0; }
  .talks a { background-color: #00c; }
  .talks a:hover { background-color: #00f; }
  .publications a { background-color: #333; }
  .publications a:hover { background-color: #000; }
}
