/* ========================================================================
 * Bootstrap: affix.js v3.0.3
 * http://getbootstrap.com/javascript/#affix
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
+function(t){"use strict";var e=function(n,i){this.options=t.extend({},e.DEFAULTS,i),this.$window=t(window).on("scroll.bs.affix.data-api",t.proxy(this.checkPosition,this)).on("click.bs.affix.data-api",t.proxy(this.checkPositionWithEventLoop,this)),this.$element=t(n),this.affixed=this.unpin=null,this.checkPosition()};e.RESET="affix affix-top affix-bottom",e.DEFAULTS={offset:0},e.prototype.checkPositionWithEventLoop=function(){setTimeout(t.proxy(this.checkPosition,this),1)},e.prototype.checkPosition=function(){if(this.$element.is(":visible")){var n=t(document).height(),i=this.$window.scrollTop(),o=this.$element.offset(),r=this.options.offset,s=r.top,a=r.bottom;"object"!=typeof r&&(a=s=r),"function"==typeof s&&(s=r.top()),"function"==typeof a&&(a=r.bottom());var l=null!=this.unpin&&i+this.unpin<=o.top?!1:null!=a&&o.top+this.$element.height()>=n-a?"bottom":null!=s&&s>=i?"top":!1;this.affixed!==l&&(this.unpin&&this.$element.css("top",""),this.affixed=l,this.unpin="bottom"==l?o.top-i:null,this.$element.removeClass(e.RESET).addClass("affix"+(l?"-"+l:"")),"bottom"==l&&this.$element.offset({top:document.body.offsetHeight-a-this.$element.height()}))}};var n=t.fn.affix;t.fn.affix=function(n){return this.each(function(){var i=t(this),o=i.data("bs.affix"),r="object"==typeof n&&n;o||i.data("bs.affix",o=new e(this,r)),"string"==typeof n&&o[n]()})},t.fn.affix.Constructor=e,t.fn.affix.noConflict=function(){return t.fn.affix=n,this},t(window).on("load",function(){t('[data-spy="affix"]').each(function(){var e=t(this),n=e.data();n.offset=n.offset||{},n.offsetBottom&&(n.offset.bottom=n.offsetBottom),n.offsetTop&&(n.offset.top=n.offsetTop),e.affix(n)})})}(jQuery);