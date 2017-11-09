%%
%% arxiv.cls 2017/11/08 version V0.1
%%
%% This is a simple lecture LaTeX class for arXiv
%%
%% Support sites:
%% http://github.com/lgong30/Simple-LaTeX-Class-for-ArXiv
%%
%% Based on the lots of template available on Internet
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{arxiv}[2017/11/08 arXiv LaTeX class]

\LoadClass[onecolumn]{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%% commonly used packages
\RequirePackage{ifthen}
\RequirePackage{latexsym}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{graphicx}
\RequirePackage{subfig}
\RequirePackage{xcolor}
\RequirePackage[colorlinks,
    linkcolor={red!50!black},
    citecolor={blue!50!black},
    urlcolor={blue!80!black}]{hyperref}

\RequirePackage{cite}
% This package reimplements the LATEX verbatim and verbatim* environments.
% In addition it provides a comment environment that skips any
% commands or text between \begin{comment} and the next \end{comment}.
\RequirePackage{verbatim}

%% packages for multirow
\RequirePackage{multirow}


%% for tables
\RequirePackage{booktabs}

%% packages for url
\RequirePackage{url}

% The etoolbox package is a toolbox of programming tools geared primarily towards
% LaTeX class and package authors. It provides LaTeX frontends to some of the new
% primitives provided by e-TeX as well as some generic tools which are not related to
% e-TeX but match the profile of this package.
\RequirePackage{etoolbox}




%% use "autoref" the way I want
%   autoref is nice because the text or brackets of a ref are part of link
%   see http://tex.stackexchange.com/questions/36575/autorefs-inserted-text-has-not-the-correct-case
%       http://en.wikibooks.org/wiki/LaTeX/Labels_and_Cross-referencing
%       http://www.tug.org/applications/hyperref/manual.html#TBL-23

%% define autoref name for sections
% \ifx\sectionautorefname\defined
\def\sectionautorefname{\S\!\!}
\def\subsectionautorefname{\S\!\!}
\def\subsubsectionautorefname{\S\!\!}
% \fi
% from http://tex.stackexchange.com/questions/52410/how-to-use-the-command-autoref-to-implement-the-same-effect-when-use-the-comman
% \ifx\equationautorefname~#1\undefined
\def\equationautorefname~#1\null{%
  (#1)\null
}
% \fi%
\newcommand*{\subfigureautorefname}{Figure}

% begin appendix autoref patch [\autoref subsections in appendix](http://tex.stackexchange.com/questions/149807/autoref-subsections-in-appendix)
\RequirePackage{appendix}

\patchcmd{\hyper@makecurrent}{%
    \ifx\Hy@param\Hy@chapterstring
        \let\Hy@param\Hy@chapapp
    \fi
}{%
    \iftoggle{inappendix}{%true-branch
        % list the names of all sectioning counters here
        \@checkappendixparam{chapter}%
        \@checkappendixparam{section}%
        \@checkappendixparam{subsection}%
        \@checkappendixparam{subsubsection}%
        \@checkappendixparam{paragraph}%
        \@checkappendixparam{subparagraph}%
    }{}%
}{}{\errmessage{failed to patch 1}}

\newcommand*{\@checkappendixparam}[1]{%
    \def\@checkappendixparamtmp{#1}%
    \ifx\Hy@param\@checkappendixparamtmp
        \let\Hy@param\Hy@appendixstring
    \fi
}

\newtoggle{inappendix}
\togglefalse{inappendix}

\apptocmd{\appendix}{\toggletrue{inappendix}}{}{\errmessage{failed to patch}}
\apptocmd{\subappendices}{\toggletrue{inappendix}}{}{\errmessage{failed to patch}}
% end appendix autoref patch

%% Provide commands theorem & lemma & definition
\RequirePackage{aliascnt}
\newtheorem{theorem}{Theorem}

%% from https://tex.stackexchange.com/questions/187388/amsthm-with-shared-counters-messes-up-autoref-references
\newaliascnt{corollaryTh}{theorem}% alias counter "<newTh>"
\newtheorem{corollary}[corollaryTh]{Corollary}
\aliascntresetthe{corollaryTh}
\providecommand*{\corollaryThautorefname}{Corollary} % name for \autoref

\newaliascnt{lemmaTh}{theorem}% alias counter "<newTh>"
\newtheorem{lemma}[lemmaTh]{Lemma}
\aliascntresetthe{lemmaTh}
\providecommand*{\lemmaThauthorefname}{Corollary} % name for \autoref

\newaliascnt{propositionTh}{theorem}% alias counter "<newTh>"
\newtheorem{proposition}[propositionTh]{Proposition}
\aliascntresetthe{propositionTh}
\providecommand*{\propositionThauthorefname}{Proposition} % name for \autoref

\newtheorem{definition}{Definition}
\providecommand*{\definitionautorefname}{Definition}
\newtheorem{claim}{Claim}
\providecommand*{\claimautorefname}{Claim}
\newtheorem{fact}{Fact}
\providecommand*{\factautorefname}{Fact}
\newtheorem{assumption}{Assumption}
\providecommand*{\assumptionautorefname}{Assumption}

\newcommand{\code}{\ttfamily}



%% layout
\RequirePackage{fullpage}