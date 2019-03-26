%
% This file is copyright (C) 2003 Sam Noble. It may be modified so long
% as my name is not removed and the modifier adds his name to the file.
% Redistribution permitted.
%
% 27 Jan 2004	Sam Noble	Removed tocbibind dependency.
% 04 Dec 2001 	Sam Noble	Class file
% 03 Sep 1995	David Perkinson	Title Page
% Acknowledgements Page, David Perkinson & Sam Noble
% May 2005 Patrick Carlisle Table of contents chapter definition
% 2004-2005 Ben Salzberg (BTS) a variety of tweaks here and in the template
% 2015 Chester Ismay (CII) modified to create R Markdown template
%
% Oddities:
%
%   We *ASSUME* that any time \cleardoublepage is called
%  we actually want a blank back side with NO page number/heading
%
%   Minor bug -- seems to be a more general LaTeX thing:
%  If you use \frontmatter \mainmatter without any chapters inbetween
%  be prepared to have the page numbering messed up. Not a big deal,
%  but I'm not sure how to fix it.
%
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mitthesis2}[1999/10/20 The MIT Thesis Class]

\def\mystretch{1.5}		% Double spacing hack
\DeclareOption{doublespace}{}	% This is default
% So we do not read this style twice
\DeclareOption{singlespace}{		% If he explicitly wants single spacing
	\typeout{Single spaced}
	\def\mystretch{1}}	

%% `vi' and `upcase' document style options.  Krishna Sethuraman (1990)
\newcount\vithesis
\DeclareOption{vi}{\typeout{Course VI/VIII thesis style.}\advance\vithesis by1}
\vithesis=0

\DeclareOption{upcase}{\typeout{Uppercase cover page.}
	\gdef\choosecase#1{\uppercase\expandafter{#1}}}
\def\choosecase#1{#1}

%% leftblank option by Kevin Fu
\newif\if@leftblank \@leftblankfalse

\DeclareOption{leftblank}{\typeout{Intentionally Leaving Pages Blank}
	\@leftblanktrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

% If the user wants single spacing, set baselinestretch=1.

\usepackage{setspace}

% Note - doublespace.sty has some float-related troubles in
% combination with graphics or color, and is not officially compliant
% with 2e.  setspace is a replacement which is 2e-compliant.

% Read the doublespace style that we got from Rochester:
%\input setdoublespace.sty 		

\def\baselinestretch{\mystretch}	% Double spacing hack


\RequirePackage{fancyhdr}
% Added by CII to produce nice looking code in BeginVerbatimEnvironment
\RequirePackage{fancyvrb}

% Added by CII
\usepackage{ifxetex,ifluatex}
\usepackage{fixltx2e} % provides \textsubscript
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \usepackage[T1]{fontenc}
  \usepackage[utf8]{inputenc}
\else % if luatex or xelatex
  \ifxetex
    \usepackage{mathspec}
    \usepackage{xltxtra,xunicode}
  \else
    \usepackage{fontspec}
  \fi
  \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
  \newcommand{\euro}{€}
\fi
% use upquote if available, for straight quotes in verbatim environments
\IfFileExists{upquote.sty}{\usepackage{upquote}}{}
% use microtype if available
\IfFileExists{microtype.sty}{%
\usepackage{microtype}
\UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
}{}
\usepackage{color}
%\newcommand{\VerbBar}{|}
%\newcommand{\VERB}{\Verb[commandchars=\\\{\}]}
\DefineVerbatimEnvironment{verbatim}{Verbatim}{xleftmargin=-1em}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\}}
% Add ',fontsize=\small' for more characters per line
\usepackage{framed}
\definecolor{shadecolor}{RGB}{248,248,248}
% \newenvironment{Shaded}{\begin{snugshade}}{\end{snugshade}}
% \newcommand{\KeywordTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{{#1}}}}
% \newcommand{\DataTypeTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{{#1}}}
% \newcommand{\DecValTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{{#1}}}
% \newcommand{\BaseNTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{{#1}}}
% \newcommand{\FloatTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{{#1}}}
% \newcommand{\ConstantTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{{#1}}}
% \newcommand{\CharTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{{#1}}}
% \newcommand{\SpecialCharTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{{#1}}}
% \newcommand{\StringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{{#1}}}
% \newcommand{\VerbatimStringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{{#1}}}
% \newcommand{\SpecialStringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{{#1}}}
% \newcommand{\ImportTok}[1]{{#1}}
% \newcommand{\CommentTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textit{{#1}}}}
% \newcommand{\DocumentationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
% \newcommand{\AnnotationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
% \newcommand{\CommentVarTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
% \newcommand{\OtherTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{{#1}}}
% \newcommand{\FunctionTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{{#1}}}
% \newcommand{\VariableTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{{#1}}}
% \newcommand{\ControlFlowTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{{#1}}}}
% \newcommand{\OperatorTok}[1]{\textcolor[rgb]{0.81,0.36,0.00}{\textbf{{#1}}}}
% \newcommand{\BuiltInTok}[1]{{#1}}
% \newcommand{\ExtensionTok}[1]{{#1}}
% \newcommand{\PreprocessorTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textit{{#1}}}}
% \newcommand{\AttributeTok}[1]{\textcolor[rgb]{0.77,0.63,0.00}{{#1}}}
% \newcommand{\RegionMarkerTok}[1]{{#1}}
% \newcommand{\InformationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
% \newcommand{\WarningTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{{#1}}}}}
% \newcommand{\AlertTok}[1]{\textcolor[rgb]{0.94,0.16,0.16}{{#1}}}
% \newcommand{\ErrorTok}[1]{\textcolor[rgb]{0.64,0.00,0.00}{\textbf{{#1}}}}
% \newcommand{\NormalTok}[1]{{#1}}

\setlength{\emergencystretch}{3em}  % prevent overfull lines
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
% End of CII add

% This gives us rules below the headers
\AtBeginDocument{%
  \fancyhf{}
  \fancyhead[LE,RO]{\thepage}
%  \fancyhead[RE]{\slshape \leftmark}
%  \fancyhead[LO]{\slshape \rightmark}
%	The above makes your headers in all caps. If you would like different headers, choose one of the following options (be sure to remove the % symbol from both the right and left headers):
	 \fancyhead[RE]{\slshape \nouppercase \leftmark} % This makes the headers on the RIGHT side pages be italic and use lowercase With Capitals When Specified.
	\fancyhead[LO]{\slshape \nouppercase \rightmark} % This does the same thing to the LEFT side pages
%	or
%	\fancyhead[RE]{\scshape \leftmark} % The RIGHT headers will be in small caps.
%	\fancyhead[LO]{\scshape \rightmark} %  And so will the LEFT headers
  \pagestyle{fancy}

% Psych majors: You do not need the following six lines, as it conflicts with apacite, so comment them out.
  \let\oldthebibliography=\thebibliography
  \let\endoldthebibliography=\endthebibliography
  \renewenvironment{thebibliography}[1]{
  	\singlespacing
    \oldthebibliography{#1}
    \addcontentsline{toc}{chapter}{\bibname}
  }{\endoldthebibliography}
 %%%%%% end of things for psych majors to comment out

  \let\oldtheindex=\theindex
  \let\endoldtheindex=\endtheindex
  \renewenvironment{theindex}{
    \oldtheindex
    \addcontentsline{toc}{chapter}{\indexname}
  }{\endoldtheindex}
}

% Stolen from book.cls and modified
\let\RToldchapter\chapter
\renewcommand{\chapter}{\if@openright\RTcleardoublepage
		    \else\clearpage\fi
		    \thispagestyle{empty}%
		    \global\@topnum\z@
		    \@afterindentfalse
		    \secdef\@chapter\@schapter}

% Stolen from book.cls PBC 5/12/05
% Using this to actually show "Chapter 1" in TOC instead of "1"
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                         {\@chapapp\space\thechapter:\space#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}

%\newcommand{\RTcleardoublepage}{
%	\clearpage\if@twoside \ifodd\c@page\else
%	\thispagestyle{empty}\hbox{}\newpage
%	\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%
%\let\RToldcleardoublepage\cleardoublepage
%\renewcommand{\cleardoublepage}{\RTcleardoublepage}

% adjust margins for binding  (changed 2007-04-24 tgp)
\setlength{\oddsidemargin}{0.25in}	% 1.25in left margin 
\setlength{\evensidemargin}{0.25in}	% 1.25in left margin (even pages)
\setlength{\topmargin}{0.0in}		% 1in top margin
\setlength{\textwidth}{6.0in}		% 6.0in text - 1.25in rt margin
\setlength{\textheight}{9in}		% Body ht for 1in margins
\addtolength{\topmargin}{-\headheight}	% No header, so compensate
\addtolength{\topmargin}{-\headsep}	% for header height and separation


% The next two macros compensate page style for headers and footers
% We only need them in page styles that USE headers and footers.
% If we have a header, it must be 1in from top of page.
\def\pulldownheader{			% Shift header down 1in from top
	\addtolength{\topmargin}{\headheight}	
	\addtolength{\topmargin}{\headsep}	
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
}
% If we have a footer, put it 1in up from bottom
\def\pullupfooter{				% Shift footer up
	\addtolength{\textheight}{-\footskip}
	%    \addtolength{\textheight}{-\footheight}  %footheight doesn't
	%    						exist in 2e
}

%%%%%%%  End of margins and formatting params %%%

%%%%%%%  Fix various header and footer problems %%%

% Draft mark on the right side of left pages (outside)
% this mark is also the only one visible on single sided.
\newcommand{\draftrmark}{**DRAFT**} 
% Draft mark on the left side of right pages (outside)
\newcommand{\draftlmark}{**DRAFT**} % 

% Macros to make changing the Draft easier
\newcommand{\drmark}[1]{\renewcommand{\draftrmark}{#1}}
\newcommand{\dlmark}[1]{\renewcommand{\draftlmark}{#1}}
\newcommand{\dmark}[1]{\drmark{#1}\dlmark{#1}}

% Format for draft of thesis.  Define our own PageStyle -
% Just like headings, but has foot lines with the date and warning

\if@twoside         % If two-sided printing.
\def\ps@drafthead{
	\let\@mkboth\markboth
	\def\@oddfoot{\rm \today \hfil \sc \draftrmark}
	\def\@evenfoot{\sc \draftlmark \hfil \rm \today }
	\def\@evenhead{\rm \thepage\hfil \sl \leftmark}
	\def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}
	\def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
				\@chapapp\ \thechapter. \ \fi ##1}}{}}
	\def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
				\thesection. \ \fi ##1}}}
	\pulldownheader				% Bring header down from edge
	\pullupfooter				% Bring footer up
}
\else               % If one-sided printing.
\def\ps@drafthead{
	\let\@mkboth\markboth
	\def\@oddfoot{\rm \today \hfil \sc \draftrmark}
	\def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}
	\def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
				\@chapapp\ \thechapter. \ \fi ##1}}}
	\pulldownheader				% Bring header down from edge
	\pullupfooter				% Bring footer up
}
\fi

% I redefine these formats that were defined in report.sty
% Definition of 'headings' page style 
%  Note the use of ##1 for parameter of \def\chaptermark inside the
%  \def\ps@headings.
%

\if@twoside					% If two-sided printing.
\def\ps@headings{\let\@mkboth\markboth
	\def\@oddfoot{}
	\def\@evenfoot{}		% No feet.
	\def\@evenhead{\rm \thepage\hfil \sl \leftmark}	% Left heading.
	\def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}	% Right heading.
	\def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
				\@chapapp\ \thechapter. \ \fi ##1}}{}}	
	\def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
				\thesection. \ \fi ##1}}}
	\pulldownheader				% Bring header down from edge
}
\else						% If one-sided printing.
\def\ps@headings{\let\@mkboth\markboth
	\def\@oddfoot{}
	\def\@evenfoot{}		%     No feet.
	\def\@oddhead{\hbox {}\sl \rightmark \hfil \rm\thepage}	% Heading.
	\def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
				\@chapapp\ \thechapter. \ \fi ##1}}}
	\pulldownheader				% Bring header down from edge
}
\fi

% Redefinition of 'myheadings' page style.  
%
\def\ps@myheadings{\let\@mkboth\@gobbletwo
	\def\@oddfoot{}
	\def\@evenfoot{}
	\def\sectionmark##1{}
	\def\subsectionmark##1{}
	\def\@evenhead{\rm \thepage\hfil\sl\leftmark\hbox {}}	%
	\def\@oddhead{\hbox{}\sl\rightmark \hfil \rm\thepage}	%
	\pulldownheader				% Bring header down from edge
}						

% Redefine '/chapter' to always start on an odd page.
% Should make no difference in singleside mode.
%
\if@leftblank
% Prints "THIS PAGE INTENTIONALLY LEFT BLANK" on blank pages.
\def\chapter{\clearpage\ifodd\c@page\else
	\hbox{}\par\vfill\centerline%
	{THIS PAGE INTENTIONALLY LEFT BLANK}%
	\vfill\newpage\fi
	\thispagestyle{plain}	% Page style of chapter page is 'plain'
	\global\@topnum\z@		% Prevents figures from going at top of page.
	\@afterindentfalse		% Suppresses indent in first paragraph.  Change
	\secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.
\else
\def\chapter{\cleardoublepage	% Starts new page.
	\thispagestyle{plain}	% Page style of chapter page is 'plain'
	\global\@topnum\z@		% Prevents figures from going at top of page.
	\@afterindentfalse		% Suppresses indent in first paragraph.  Change
	\secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.
\fi
% If using the report style, use - instead of . in the figure number.
\@ifundefined{thechapter}{}{\def\thefigure{\thechapter-\arabic{figure}}}


\def\degree#1{\gdef \@degree{#1}}
\def\@degree{\@latex@warning@no@line{No \noexpand\degree given}}
\def\degreeyear#1{\gdef \@degreeyear{#1}}
\def\@degreeyear{\@latex@warning@no@line{No \noexpand\degreeyear given}}
\def\degreemonth#1{\gdef \@degreemonth{#1}}
\def\@degreemonth{\@latex@warning@no@line{No \noexpand\degreemonth given}}
\def\prevdegrees#1{\gdef \@prevdegrees{#1}}
\def\@prevdegrees{\@latex@warning@no@line{No \noexpand\prevdegrees given}}
\def\thesisdate#1{\gdef \@thesisdate{#1}}
\def\@thesisdate{\@latex@warning@no@line{No \noexpand\thesisdate given}}
\def\institution#1{\gdef \@institution{#1}}
\def\@institution{\@latex@warning@no@line{No \noexpand\institution given}}
\def\chairman#1#2{\gdef\@chairmanname{#1}\gdef\@chairmantitle{#2}}
\def\@chairman{\@latex@warning@no@line{No \noexpand\chairman given}}
\def\committeeone#1#2#3{\gdef\@committeeonename{#1}\gdef\@committeeonerole{#2}\gdef\@committeeonetitle{#3}}
\def\@committeeone{\@latex@warning@no@line{No \noexpandcommitteeone given}}
\def\committeetwo#1#2#3{\gdef\@committeetwoname{#1}\gdef\@committeetworole{#2}\gdef\@committeetwotitle{#3}}
\def\@committeetwo{\@latex@warning@no@line{No \noexpandcommitteetwo given}}
\def\committeethree#1#2#3{\gdef\@committeethreename{#1}\gdef\@committeethreerole{#2}\gdef\@committeethreetitle{#3}}
\def\@committeethree{\@latex@warning@no@line{No \noexpandcommitteethree given}}
\def\department#1{\gdef \@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\thedivisionof#1{\gdef \@thedivisionof{#1}}
\def\@thedivisionof{The Division of}
\def\approvedforthe#1{\gdef \@approvedforthe{#1}}
\def\@approvedforthe{Division}
\def\supervisor#1#2{\gdef \@supervisorname{#1}\gdef \@supervisortitle{#2}}
\def\@supervisor{\@latex@warning@no@line{No \noexpand\supervisor given}}
\def\altadvisor#1{\gdef \@altadvisor{#1} \@altadvisortrue}
\global\let\@altadvisor\@empty
\newif\if@altadvisor
\@altadvisorfalse

% The copyright notice stuff is a tremendous mess.
%
% \@copyrightnotice is used by \maketitle to actually put text on the
% page; it defaults to ``Copyright MIT 19xx.  All rights reserved.''
% \copyrightnoticetext takes an argument and defined \@copyrightnotice
% to that argument.  \copyrightnotice takes an argument, and calls
% \copyrightnoticetext with that argument, preceeded by a copyright
% symbol and followed by ``All rights reserved.'' and the standard
% permission notice.
% 
% If you use the 'vi' option, \copyrightnoticetext is used to set the
% copyright to ``(C) Your Name, Current Year in Roman Numerals.''
% followed by the permission notice.

% If there is no \copyrightnotice command, it is asssumed that MIT
% holds the copyright.  This commands adds the copyright symbol to the
% beginning, and puts the standard permission notice below.
%% ``All rights reserved'' added.  Krishna Sethuraman (1990)
\def\copyrightnotice#1{\copyrightnoticetext{\copyright\ #1.  All rights
		reserved.\par\permission}}

% Occacionally you will need to exactly specify the text of the 
% copyright notice.  The \copyrightnoticetext command is then useful.
\long\def\copyrightnoticetext#1{\gdef\@copyrightnotice{#1}}
\def\@copyrightnotice{\copyright\ \Mit\ \@degreeyear.  All rights reserved.}

%% `vi' documentclass option: Specifying this option automatically
%% copyrights the thesis to the author and gives MIT permission to copy and
%% distribute the document.  If you want, you can still specify
%% \copyrightnotice{stuff} to copyright to someone else, or
%% \copyrightnoticetext{stuff} to specify the exact text of the copyright
%% notice.
\ifodd\vithesis \copyrightnoticetext{\copyright\ \@author,
	\uppercase\expandafter{\romannumeral\@degreeyear}.  All rights reserved.\par\permission}
%% or just
%%\@degreeyear}}
\typeout{Copyright given to author,
	permission to copy/distribute given to MIT.}
\else \typeout{Thesis document copyright MIT unless otherwise (manually) specified}
\fi

\renewcommand\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\normalfont
      \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\bfseries \hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

%%% Added by CII
\newenvironment{acknowledgements}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{Acknowledgements}
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%

\newenvironment{preface}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{Preface}
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%
% End of CII add

\newenvironment{abstract}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \cleardoublepage
  \begin{center}{\large{\bf \@title} \\
  		by \\
  		\@author \\[\baselineskip]}
  	\par
  	\def\baselinestretch{1}\@normalsize
  	Submitted to the \@department \\
  	on \@thesisdate, in partial fulfillment of the \\
  	requirements for the degree of \\
  	\@degree
  \end{center}
  \par
  % \chapter*{Abstract}
  {\noindent \def\baselinestretch{1.2}\Large\bf \choosecase{Abstract} \par}
  \small\def\baselinestretch{1}\@normalsize
  \vspace{1em}
  \noindent
}{\vspace{1em} \\ Thesis Supervisor: \@supervisorname \\ Title: \@supervisortitle \clearpage \if@restonecol\twocolumn\fi}%


\newenvironment{dedication}{%
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{Dedication}
  \fontsize{12}{14}\selectfont
}{\clearpage \if@restonecol\twocolumn\fi}%


\renewcommand{\maketitle}{%
  {\pagestyle{empty}
  \fontsize{12}{14}\selectfont
  \begin{titlepage}
  \large
  {\def\baselinestretch{1.2}\Large\bf \choosecase{\@title} \par}
  by\par
  {\Large  \choosecase{\@author}}
  \par
  \@prevdegrees
  \par
  \choosecase{Submitted to the} \choosecase{\@department} \\
  \choosecase{in partial fulfillment of the requirements for the degree of}
  \par
  \choosecase{\@degree}
  \par
  at the
  \par\MIT\par
  \@degreemonth\ \@degreeyear
  \par
  \@copyrightnotice
  \par
  \vskip 3\baselineskip
  \signature{Author}{\@department \\ \@thesisdate}
  \par
  \vfill
  \signature{Certified by}{\@supervisorname \\ \@supervisortitle \\ Thesis Supervisor}
  \par
  \vfill
  \signature{Accepted by}{\@chairmanname \\ \@chairmantitle}
  \vfill
  \end{titlepage}
%  \begin{titlepage}
%  	\begin{large}
%  		This doctoral thesis has been examined by a Committee of the \@department as follows:
%  		
%  		\signature{\@committeeonename}{\@committeeonerole \\ \@committeeonetitle}
%  		
%  		\signature{\@committeetwoname}{\@committeetworole \\ \@committeetwotitle}
%  		
%  		\signature{\@committeethreename}{\@committeethreerole \\ \@committeethreetitle}
%  	\end{large}
%  \end{titlepage}
  }
}

% From JSS
% Added by CII
\renewcommand{\title}[1]{\def\@title{#1}}
%\newcommand{\Shorttitle}[1]{\def\@Shorttitle{#1}}
\newcommand{\Plainauthor}[1]{\def\@Plainauthor{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
%\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
%\newcommand{\Plainkeywords}[1]{\def\@Plainkeywords{#1}}
\newcommand{\Acknowledgements}[1]{\def\@Acknowledgements{#1}}
\newcommand{\Dedication}[1]{\def\@Dedication{#1}}
\newcommand{\Preface}[1]{\def\@Preface{#1}}
% End of CII add

% You can use the titlepage environment to do it all yourself if you
% don't want to use \maketitle.  If the titlepage environment, the
% paragraph skip is infinitely stretchable, so if you leave a blank line
% between lines that you want space between, the space will stretch so
% that the title page fills up the entire page.
\def\titlepage{\cleardoublepage\centering
	\thispagestyle{empty}
	\parindent 0pt \parskip 10pt plus 1fil minus 1fil
	\def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
% The \kern0pt pushes any depth into the height.  Thanks to Richard Stone.
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}

\def\MIT{MASSACHUSETTS INSTITUTE OF TECHNOLOGY}
\def\Mit{Massachusetts Institute of Technology}

\def\permission{\par\noindent{\centering
		The author hereby grants to MIT permission to reproduce and to
		distribute publicly paper and electronic copies of this thesis
		document in whole or in part in any medium now known or hereafter
		created.}\par}

\def\signature#1#2{\par\noindent#1\dotfill\null\\*
	{\raggedleft #2\par}}