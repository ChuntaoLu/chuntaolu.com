/* ========================================================================
 * Bootstrap: tab.js v3.0.3
 * http://getbootstrap.com/javascript/#tabs
 * ========================================================================
 * Copyright 2013 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ======================================================================== */
+function(t){"use strict";var e=function(e){this.element=t(e)};e.prototype.show=function(){var e=this.element,n=e.closest("ul:not(.dropdown-menu)"),i=e.data("target");if(i||(i=e.attr("href"),i=i&&i.replace(/.*(?=#[^\s]*$)/,"")),!e.parent("li").hasClass("active")){var o=n.find(".active:last a")[0],s=t.Event("show.bs.tab",{relatedTarget:o});if(e.trigger(s),!s.isDefaultPrevented()){var r=t(i);this.activate(e.parent("li"),n),this.activate(r,r.parent(),function(){e.trigger({type:"shown.bs.tab",relatedTarget:o})})}}},e.prototype.activate=function(e,n,i){function o(){s.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),e.addClass("active"),r?(e[0].offsetWidth,e.addClass("in")):e.removeClass("fade"),e.parent(".dropdown-menu")&&e.closest("li.dropdown").addClass("active"),i&&i()}var s=n.find("> .active"),r=i&&t.support.transition&&s.hasClass("fade");r?s.one(t.support.transition.end,o).emulateTransitionEnd(150):o(),s.removeClass("in")};var n=t.fn.tab;t.fn.tab=function(n){return this.each(function(){var i=t(this),o=i.data("bs.tab");o||i.data("bs.tab",o=new e(this)),"string"==typeof n&&o[n]()})},t.fn.tab.Constructor=e,t.fn.tab.noConflict=function(){return t.fn.tab=n,this},t(document).on("click.bs.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(e){e.preventDefault(),t(this).tab("show")})}(jQuery);