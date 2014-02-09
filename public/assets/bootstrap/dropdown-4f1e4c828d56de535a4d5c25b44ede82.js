/* ========================================================================
 * Bootstrap: dropdown.js v3.0.3
 * http://getbootstrap.com/javascript/#dropdowns
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
+function(t){"use strict";function e(){t(i).remove(),t(o).each(function(e){var i=n(t(this));i.hasClass("open")&&(i.trigger(e=t.Event("hide.bs.dropdown")),e.isDefaultPrevented()||i.removeClass("open").trigger("hidden.bs.dropdown"))})}function n(e){var n=e.attr("data-target");n||(n=e.attr("href"),n=n&&/#/.test(n)&&n.replace(/.*(?=#[^\s]*$)/,""));var i=n&&t(n);return i&&i.length?i:e.parent()}var i=".dropdown-backdrop",o="[data-toggle=dropdown]",r=function(e){t(e).on("click.bs.dropdown",this.toggle)};r.prototype.toggle=function(i){var o=t(this);if(!o.is(".disabled, :disabled")){var r=n(o),s=r.hasClass("open");if(e(),!s){if("ontouchstart"in document.documentElement&&!r.closest(".navbar-nav").length&&t('<div class="dropdown-backdrop"/>').insertAfter(t(this)).on("click",e),r.trigger(i=t.Event("show.bs.dropdown")),i.isDefaultPrevented())return;r.toggleClass("open").trigger("shown.bs.dropdown"),o.focus()}return!1}},r.prototype.keydown=function(e){if(/(38|40|27)/.test(e.keyCode)){var i=t(this);if(e.preventDefault(),e.stopPropagation(),!i.is(".disabled, :disabled")){var r=n(i),s=r.hasClass("open");if(!s||s&&27==e.keyCode)return 27==e.which&&r.find(o).focus(),i.click();var a=t("[role=menu] li:not(.divider):visible a",r);if(a.length){var l=a.index(a.filter(":focus"));38==e.keyCode&&l>0&&l--,40==e.keyCode&&l<a.length-1&&l++,~l||(l=0),a.eq(l).focus()}}}};var s=t.fn.dropdown;t.fn.dropdown=function(e){return this.each(function(){var n=t(this),i=n.data("bs.dropdown");i||n.data("bs.dropdown",i=new r(this)),"string"==typeof e&&i[e].call(n)})},t.fn.dropdown.Constructor=r,t.fn.dropdown.noConflict=function(){return t.fn.dropdown=s,this},t(document).on("click.bs.dropdown.data-api",e).on("click.bs.dropdown.data-api",".dropdown form",function(t){t.stopPropagation()}).on("click.bs.dropdown.data-api",o,r.prototype.toggle).on("keydown.bs.dropdown.data-api",o+", [role=menu]",r.prototype.keydown)}(jQuery);