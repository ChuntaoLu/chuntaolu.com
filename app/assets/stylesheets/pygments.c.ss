.highlight {
    background-color: #fafafa;
    /*padding: 7px 7px 7px 10px;*/
    /*border: 1px solid #ddd;*/
    /*-moz-box-shadow: 3px 3px rgba(0,0,0,0.1);*/
    /*-webkit-box-shadow: 3px 3px rgba(0,0,0,0.1);*/
    /*box-shadow: 3px 3px rgba(0,0,0,0.1);*/
    /*margin: 20px 0 20px 0;*/
    /*overflow: hidden;*/
}

code {
    font-family:'Bitstream Vera Sans Mono','Courier', monospace;
}

/*pre {*/
/*border: solid 1px #ddd;*/
/*background: #fff;*/
/*padding: 0;*/
/*line-height: 23px;*/
/*margin: 20px 0;*/
/*white-space: pre;*/
/*overflow-x: auto;*/
/*word-break: inherit;*/
/*word-wrap: inherit;*/
/*}*/

/*.highlight span {*/
/*padding: 8px 15px;*/
/*}*/

/*.lineno {*/
/*background: #fafafa;*/
/*border-right: 1px solid #ddd;*/
/*color: #999;*/
/*padding: 1px 10px;*/

/* Stop line numbers being visually selected */
/*-webkit-touch-callout: none;*/
/*-webkit-user-select: none;*/
/*-khtml-user-select: none;*/
/*-moz-user-select: none;*/
/*-ms-user-select: none;*/
/*user-select: none;*/
/*}*/
pre {
    counter-reset: line-numbering;
    border: solid 1px #d9d9d9;
    border-radius: 0;
    background: #fff;
    padding: 0;
    line-height: 23px;
    margin: 20px 0;
    white-space: pre;
    overflow-x: auto;
    word-break: inherit;
    word-wrap: inherit;
}

pre a::before {
    content: counter(line-numbering);
    counter-increment: line-numbering;
    padding-right: 1em; /* space after numbers */
    width: 20px;
    text-align: center;
    opacity: 0.7;
    display: inline-block;
    color: #aaa;
    background: #eee;
    margin-right: 16px;
    padding: 2px 10px;
    font-size: 16px;
    border-right: 1px solid #dedede;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

pre a:first-of-type::before {
    padding-top: 10px;
@include box-shadow(rgba(255, 255, 255, 0.9) 0px 1px 1px inset);
}

pre a:last-of-type::before {
    padding-bottom: 10px;
}

pre a:only-of-type::before {
    padding: 10px;
}
.highlight .c { color: #586E75 } /* Comment */
.highlight .err { color: #93A1A1 } /* Error */
.highlight .g { color: #93A1A1 } /* Generic */
.highlight .k { color: #859900 } /* Keyword */
.highlight .l { color: #93A1A1 } /* Literal */
.highlight .n { color: #93A1A1 } /* Name */
.highlight .o { color: #859900 } /* Operator */
.highlight .x { color: #CB4B16 } /* Other */
.highlight .p { color: #93A1A1 } /* Punctuation */
.highlight .cm { color: #586E75 } /* Comment.Multiline */
.highlight .cp { color: #859900 } /* Comment.Preproc */
.highlight .c1 { color: #586E75 } /* Comment.Single */
.highlight .cs { color: #859900 } /* Comment.Special */
.highlight .gd { color: #2AA198 } /* Generic.Deleted */
.highlight .ge { color: #93A1A1; font-style: italic } /* Generic.Emph */
.highlight .gr { color: #DC322F } /* Generic.Error */
.highlight .gh { color: #CB4B16 } /* Generic.Heading */
.highlight .gi { color: #859900 } /* Generic.Inserted */
.highlight .go { color: #93A1A1 } /* Generic.Output */
.highlight .gp { color: #93A1A1 } /* Generic.Prompt */
.highlight .gs { color: #93A1A1; font-weight: bold } /* Generic.Strong */
.highlight .gu { color: #CB4B16 } /* Generic.Subheading */
.highlight .gt { color: #93A1A1 } /* Generic.Traceback */
.highlight .kc { color: #CB4B16 } /* Keyword.Constant */
.highlight .kd { color: #268BD2 } /* Keyword.Declaration */
.highlight .kn { color: #859900 } /* Keyword.Namespace */
.highlight .kp { color: #859900 } /* Keyword.Pseudo */
.highlight .kr { color: #268BD2 } /* Keyword.Reserved */
.highlight .kt { color: #DC322F } /* Keyword.Type */
.highlight .ld { color: #93A1A1 } /* Literal.Date */
.highlight .m { color: #2AA198 } /* Literal.Number */
.highlight .s { color: #2AA198 } /* Literal.String */
.highlight .na { color: #93A1A1 } /* Name.Attribute */
.highlight .nb { color: #B58900 } /* Name.Builtin */
.highlight .nc { color: #268BD2 } /* Name.Class */
.highlight .no { color: #CB4B16 } /* Name.Constant */
.highlight .nd { color: #268BD2 } /* Name.Decorator */
.highlight .ni { color: #CB4B16 } /* Name.Entity */
.highlight .ne { color: #CB4B16 } /* Name.Exception */
.highlight .nf { color: #268BD2 } /* Name.Function */
.highlight .nl { color: #93A1A1 } /* Name.Label */
.highlight .nn { color: #93A1A1 } /* Name.Namespace */
.highlight .nx { color: #555 } /* Name.Other */
.highlight .py { color: #93A1A1 } /* Name.Property */
.highlight .nt { color: #268BD2 } /* Name.Tag */
.highlight .nv { color: #268BD2 } /* Name.Variable */
.highlight .ow { color: #859900 } /* Operator.Word */
.highlight .w { color: #93A1A1 } /* Text.Whitespace */
.highlight .mf { color: #2AA198 } /* Literal.Number.Float */
.highlight .mh { color: #2AA198 } /* Literal.Number.Hex */
.highlight .mi { color: #2AA198 } /* Literal.Number.Integer */
.highlight .mo { color: #2AA198 } /* Literal.Number.Oct */
.highlight .sb { color: #586E75 } /* Literal.String.Backtick */
.highlight .sc { color: #2AA198 } /* Literal.String.Char */
.highlight .sd { color: #93A1A1 } /* Literal.String.Doc */
.highlight .s2 { color: #2AA198 } /* Literal.String.Double */
.highlight .se { color: #CB4B16 } /* Literal.String.Escape */
.highlight .sh { color: #93A1A1 } /* Literal.String.Heredoc */
.highlight .si { color: #2AA198 } /* Literal.String.Interpol */
.highlight .sx { color: #2AA198 } /* Literal.String.Other */
.highlight .sr { color: #DC322F } /* Literal.String.Regex */
.highlight .s1 { color: #2AA198 } /* Literal.String.Single */
.highlight .ss { color: #2AA198 } /* Literal.String.Symbol */
.highlight .bp { color: #268BD2 } /* Name.Builtin.Pseudo */
.highlight .vc { color: #268BD2 } /* Name.Variable.Class */
.highlight .vg { color: #268BD2 } /* Name.Variable.Global */
.highlight .vi { color: #268BD2 } /* Name.Variable.Instance */
.highlight .il { color: #2AA198 } /* Literal.Number.Integer.Long */