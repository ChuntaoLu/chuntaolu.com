/* ========================================================================
 * Bootstrap: scrollspy.js v3.0.3
 * http://getbootstrap.com/javascript/#scrollspy
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
+function(t){"use strict";function e(n,i){var o,r=t.proxy(this.process,this);this.$element=t(n).is("body")?t(window):t(n),this.$body=t("body"),this.$scrollElement=this.$element.on("scroll.bs.scroll-spy.data-api",r),this.options=t.extend({},e.DEFAULTS,i),this.selector=(this.options.target||(o=t(n).attr("href"))&&o.replace(/.*(?=#[^\s]+$)/,"")||"")+" .nav li > a",this.offsets=t([]),this.targets=t([]),this.activeTarget=null,this.refresh(),this.process()}e.DEFAULTS={offset:10},e.prototype.refresh=function(){var e=this.$element[0]==window?"offset":"position";this.offsets=t([]),this.targets=t([]);{var n=this;this.$body.find(this.selector).map(function(){var i=t(this),o=i.data("target")||i.attr("href"),r=/^#\w/.test(o)&&t(o);return r&&r.length&&[[r[e]().top+(!t.isWindow(n.$scrollElement.get(0))&&n.$scrollElement.scrollTop()),o]]||null}).sort(function(t,e){return t[0]-e[0]}).each(function(){n.offsets.push(this[0]),n.targets.push(this[1])})}},e.prototype.process=function(){var t,e=this.$scrollElement.scrollTop()+this.options.offset,n=this.$scrollElement[0].scrollHeight||this.$body[0].scrollHeight,i=n-this.$scrollElement.height(),o=this.offsets,r=this.targets,s=this.activeTarget;if(e>=i)return s!=(t=r.last()[0])&&this.activate(t);for(t=o.length;t--;)s!=r[t]&&e>=o[t]&&(!o[t+1]||e<=o[t+1])&&this.activate(r[t])},e.prototype.activate=function(e){this.activeTarget=e,t(this.selector).parents(".active").removeClass("active");var n=this.selector+'[data-target="'+e+'"],'+this.selector+'[href="'+e+'"]',i=t(n).parents("li").addClass("active");i.parent(".dropdown-menu").length&&(i=i.closest("li.dropdown").addClass("active")),i.trigger("activate.bs.scrollspy")};var n=t.fn.scrollspy;t.fn.scrollspy=function(n){return this.each(function(){var i=t(this),o=i.data("bs.scrollspy"),r="object"==typeof n&&n;o||i.data("bs.scrollspy",o=new e(this,r)),"string"==typeof n&&o[n]()})},t.fn.scrollspy.Constructor=e,t.fn.scrollspy.noConflict=function(){return t.fn.scrollspy=n,this},t(window).on("load",function(){t('[data-spy="scroll"]').each(function(){var e=t(this);e.scrollspy(e.data())})})}(jQuery);