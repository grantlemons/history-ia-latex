\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}[Grant Lemons's Custom Paper Class]

% Preamble
\LoadClass[letterpaper, 12pt]{article}
\usepackage[includefoot, left=1in, right=1in, top=1in, bottom=0.5in]{geometry}

% Paragraph jump and intents
\setlength{\parskip}{1em}
\setlength{\parindent}{1em}

% Package mass import
\usepackage{microtype}
\usepackage[export]{adjustbox}

% Typefaces
\usepackage{fontspec}
\setmainfont[Ligatures=TeX]{Charter}

% Spacing
\usepackage{setspace}
\usepackage{titlesec}
\titlespacing{\chapter}{0pt}{0pt}{0pt}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titlespacing{\subsubsection}{0pt}{0pt}{0pt}

% Images
\usepackage{graphicx}
\graphicspath{ {./images/} }

% Subfiles
\usepackage{subfiles}

% Misc Setup
\titleformat{\subsection}{\singlespacing\normalfont\normalsize\bfseries}{\thesubsection}{1em}{\large}
\titleformat{\section}{\singlespacing\normalfont\large\bfseries}{\thesection}{1em}{}
\titleformat{\chapter}[display]{\singlespacing\vspace{-1.8cm}\normalfont\bfseries}{}{0pt}{\Large}
\newcommand{\insertTitlePage}{
	\centering
	\singlespacing
	\vspace*{6.3cm}
	\textbf{\huge\thetitle}\\
	\vspace*{0.5cm}
	\textit{\researchquestion}\\
	\vspace{2.5cm}
	\textit{Word count: \wordcount}\\
	\flushleft
	\newpage
}

% Link setup
\usepackage{hyperref}    
\hypersetup{
    hidelinks=true,
    colorlinks=false, %set true if you want colored links
    linktoc=all,     %set to all if you want both sections and subsections linked
    linkcolor=black,  %choose some color if you want links to stand out
    citecolor=black,
}

\endinput
