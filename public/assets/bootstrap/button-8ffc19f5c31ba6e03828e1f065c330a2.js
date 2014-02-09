/* ========================================================================
 * Bootstrap: button.js v3.0.3
 * http://getbootstrap.com/javascript/#buttons
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
+function(t){"use strict";var e=function(n,i){this.$element=t(n),this.options=t.extend({},e.DEFAULTS,i)};e.DEFAULTS={loadingText:"loading..."},e.prototype.setState=function(t){var e="disabled",n=this.$element,i=n.is("input")?"val":"html",o=n.data();t+="Text",o.resetText||n.data("resetText",n[i]()),n[i](o[t]||this.options[t]),setTimeout(function(){"loadingText"==t?n.addClass(e).attr(e,e):n.removeClass(e).removeAttr(e)},0)},e.prototype.toggle=function(){var t=this.$element.closest('[data-toggle="buttons"]'),e=!0;if(t.length){var n=this.$element.find("input");"radio"===n.prop("type")&&(n.prop("checked")&&this.$element.hasClass("active")?e=!1:t.find(".active").removeClass("active")),e&&n.prop("checked",!this.$element.hasClass("active")).trigger("change")}e&&this.$element.toggleClass("active")};var n=t.fn.button;t.fn.button=function(n){return this.each(function(){var i=t(this),o=i.data("bs.button"),r="object"==typeof n&&n;o||i.data("bs.button",o=new e(this,r)),"toggle"==n?o.toggle():n&&o.setState(n)})},t.fn.button.Constructor=e,t.fn.button.noConflict=function(){return t.fn.button=n,this},t(document).on("click.bs.button.data-api","[data-toggle^=button]",function(e){var n=t(e.target);n.hasClass("btn")||(n=n.closest(".btn")),n.button("toggle"),e.preventDefault()})}(jQuery);