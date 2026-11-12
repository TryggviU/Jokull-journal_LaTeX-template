% This is a LaTeX class class file for the journal Jökull of the Icelandic Glaciological and Geological Societies.
% The Jökull class is largely based on the IGS Journal of Glaciology class: https://www.cambridge.org/core/journals/journal-of-glaciology and has been edited and improved to allow for Icelandic typesetting and to follow the style guidelines of Jökull.
% Author: Tryggvi Unnsteinsson
% Version date: 2026-11-12
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{jokull}

\newif\if@reviewmode\@reviewmodefalse
\DeclareOption{review}{\@reviewmodetrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\if@reviewmode
  \LoadClass[11pt,oneside,onecolumn]{article}
\else
  \LoadClass[10pt,twoside,twocolumn]{article}
\fi

\RequirePackage[T1]{fontenc}
\RequirePackage{setspace}
\RequirePackage{amsmath}
\RequirePackage{xpatch}
\RequirePackage[
    letterpaper,  % Default 8.5 x 11 inches (215.9 x 279.4 mm)
    % papersize={18cm,25cm},
    textwidth=155mm,
    columnsep=5mm,
    bindingoffset=10mm,
    inner=25.5mm, 
    top=45mm, 
    bottom=45mm, 
    heightrounded,
    ]{geometry}
\RequirePackage{footmisc}
\RequirePackage[table]{xcolor}
\RequirePackage{caption}
\DeclareCaptionJustification{double}{\doublespacing}
\DeclareCaptionLabelSeparator{dotquad}{.\quad}
\RequirePackage[explicit,noindentafter]{titlesec}
\RequirePackage[style]{abstract}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage[hidelinks]{hyperref} % Links and citations are black but still clickable.
\RequirePackage{doi}
\renewcommand{\doitext}{https://doi.org/}

\if@reviewmode
  \RequirePackage{lmodern}
  \RequirePackage{amssymb,amsbsy}
  \RequirePackage{lineno}
  \linenumbers
  \doublespacing
  \let\oldmarginpar\marginpar
  \renewcommand{\marginpar}[1]{\oldmarginpar{\itshape\footnotesize #1}}
  \renewcommand{\footnotelayout}{\footnotesize\doublespacing}
  \patchcmd{\thanks}{#1}{\protect\doublespacing\footnotesize#1}{}{}
  \xapptocmd{\table}{\doublespacing\small}{}{}
  \xapptocmd{\figure}{\doublespacing}{}{}
  \AtBeginEnvironment{tabular}{\small\doublespacing}{}{}
\else
  \RequirePackage{libertine}
  \renewcommand*\familydefault{\sfdefault}
  \renewcommand{\ttdefault}{lmtt}
  \RequirePackage{newtxtext,newtxmath}
  \renewcommand{\marginpar}[1]{}
\fi

\RequirePackage{upgreek}

\RequirePackage{environ}
\NewEnviron{frontmatter}{%
  \if@reviewmode\BODY
  \else\twocolumn[\BODY]\saythanks\fi
}

\renewcommand{\title}[2][]{%
  \def\@shorttitle{#1}
  \def\@title{#2}
}

\renewcommand{\author}[2][]{%
  \def\@shortauthor{#1}
  \def\@author{#2}
}

\newcommand{\jourvolume}[1]{\def\@volume{#1}}
\newcommand{\jourpubyear}[1]{\def\@pubyear{#1}}
\newcommand{\jourdoi}[1]{\def\@jourdoi{\doi{#1}}}

\def\@shortauthor{}
\def\@shorttitle{}
\def\@journal{}
\def\@volume{00}
\def\@pubyear{0000}

\newcommand{\affiliation}[1]{\def\@affil{#1}}
\newcommand{\email}[1]{\def\@email{#1}}


\renewcommand{\@maketitle}{%
  \null\vspace*{-8pt}%
  \if@reviewmode\else
  \begingroup\raggedright
  {\fcolorbox{lightgray}{lightgray}{Reviewed research article}\par}
  \endgroup\fi
  \vspace{4em} 
  \begingroup\centering
  {\LARGE\@title\par}
  \vskip12pt plus 2pt minus 1pt
  {\large\@author\par}
  \vskip8pt plus 1pt
  {\itshape\@affil\par}
  \vskip5pt plus 1pt
  {Corresponding author \@email;\quad \@jourdoi\par}
  \vspace{5pt plus 2pt minus 1pt}
  \par
  \endgroup%
}

\renewcommand{\abstitlestyle}[1]{}
\setlength{\absleftindent}{0mm}  %14mm default
\setlength{\absrightindent}{0mm}  %14mm default
\setlength{\absparindent}{0pt}
\renewcommand{\abstracttextfont}{\noindent\textbf{Abstract}\space---\space\normalfont\itshape}
\apptocmd{\abstract}{\ignorespaces}{}{}
\apptocmd{\endabstract}{\vskip20pt plus 10pt minus 2pt}{}{}

\def\@journal{J\"{O}KULL No.\ \@volume, \@pubyear}

\titleformat{\section}
  {\Large\center}
  {} % \thesection if section numbers wanted.
  {0pt} % Space between section number and title
  {\MakeUppercase{#1}}
  
\titleformat{\subsection}
  {\large\bfseries\raggedright}
  {} % \thesubsection
  {0pt}
  {#1}
  
\titleformat{\subsubsection}
  {\itshape\raggedright}
  {} % \thesubsubsection
  {0pt}
  {#1}

\titlespacing\section{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{12pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}

\newcommand{\acknowledgements}[1]{\subsection*{Acknowledgements} #1}
\newcommand{\dataavailability}[1]{\subsubsection*{Data availability} #1}
\newcommand{\codeavailability}[1]{\subsubsection*{Code availability} #1}
\newcommand{\authorcontribution}[1]{\subsubsection*{Author contributions} #1}
\newcommand{\icelandicsummary}[2]{\subsection*{#1} #2}

\if@reviewmode
  \captionsetup*{font={small,doublespacing},labelfont=bf,labelsep=dotquad,justification=justified,singlelinecheck=false}
\else
  \captionsetup*{font=small,labelsep=dotquad,justification=justified,singlelinecheck=false}
\fi
\renewcommand{\figurename}{Figure}

\RequirePackage{natbib}
\renewcommand{\bibfont}{\small}
\setlength{\bibsep}{0pt plus 0.3ex}

\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\if@reviewmode
  \lhead{\footnotesize\itshape\@shortauthor: \@shorttitle}
  \rhead{\footnotesize\thepage}
\else
  \fancyhead[LE]{\itshape\@shortauthor}
  \fancyhead[RO]{\itshape\@shorttitle}
  \fancyfoot[LE,RO]{\large\thepage}
  \fancyfoot[RE,LO]{\@journal}
\fi

\pagestyle{fancy}

% No headers on first page of article.
\fancypagestyle{plain}{
 \lhead{}
 \rhead{}
}
