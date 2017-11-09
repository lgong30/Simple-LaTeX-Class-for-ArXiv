# Simple-LaTeX-Class-for-ArXiv

This repository provides a simple LaTeX class for submissions to arXiv. 


## Features Considered

+ autoref for "all cross-reference"
+ theorem-like environment
+ ... [**to be added in future version**]

## Usage

```TeX
\documentclass{arxiv}

\begin{document}
  
\author{%
  \begin{tabular}{*{3}{c}}
  Saber \authormark[1] \authormark[2] & Lancer\authormark[2]& Rider\authormark[1]  \tabularnewline
  \email{saber@fate.org} & \email{lancer@fate.org} & \email{rider@fate.org} \tabularnewline
  Archer\authormark[2] & Gilgamesh\authormark[1] & Berserker\authormark[2]\tabularnewline
  \email{caster@fate.org} & \email{gilgamesh@fate.org} & \email{berserker@fate.org}\tabularnewline
  \authormark[1] Fate/Zero && \authormark[2] Fate/Stay Night \tabularnewline
  \end{tabular}      
}
\maketitle

\begin{abstract}
Abstract goes here.
\end{abstract}

\section{Introduction}
Introduction goes here ...


\section{Conclusion}
Conclusion goes here ...


\appendix
\section{Appendix Section}
Appendix goes here ...
\end{document}
```

An more details example is available [here](./example.tex), the PDF result is [here](./example.pdf).
  
  
