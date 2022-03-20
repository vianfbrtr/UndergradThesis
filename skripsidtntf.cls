%--------------------------------------------------------
%  Original class
%  By Dr. Pekik Nurwantoro
%  Computational Physics Group, FMIPA UGM
%
%  Version 1.0
%  Adapted to JTF format by
%  Dr. Alexander Agung
%  Nuclear Engineering Program
%  Department of Engineering Physics, FT-UGM
%  May 24, 2009
%
% Version 2.0
%  Modified to DTNTF format by
%  Dr. Alexander Agung
%  Nuclear Engineering Program
%  Department of Nuclear Engineering and Engineering Physics, FT-UGM
%  October 10, 2017
%
% Version 2.1
%  Non-plagiarism page is modified
%  
%  November 20, 2018
%--------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{skripsidtntf}[2018/11/20 v2.1 The Department of Nuclear Engineering and Engineering Physics UGM Skripsi Class]

%\RequirePackage[bahasa]{packages/babel}
\RequirePackage[bahasa]{babel}
\RequirePackage{indentfirst}

\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}
\RequirePackage{supertabular}
\usepackage{multirow}
%\usepackage{multicolumn}
\usepackage{rotating}
%\usepackage[none]{hyphenat}
 %\hyphenpenalty=10000
%\justify



\newif\if@sarskripsi
\newif\if@sarproposal
\DeclareOption{tugasakhir}{\@sarskripsitrue\@sarproposalfalse}
\DeclareOption{proposal}{\@sarskripsifalse\@sarproposaltrue}

\newif\if@singlesp
\newif\if@doublesp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue}
\newif\if@onehalfsp
\@onehalfspfalse
\DeclareOption{satusetengahspasi}{\@onehalfsptrue}

%\newif\if@langindo
%\newif\if@langeng
%\DeclareOption{indonesia}{\@langindotrue\@langengfalse}
%\DeclareOption{inggris}{\@langindofalse\@langengtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{tugasakhir,duaspasi}
\ProcessOptions
\LoadClass[a4paper,12pt]{report}
%\RequirePackage{national}
%\bibliographystyle{plainnat}
\RequirePackage[chapter]{tocbibind}
\RequirePackage[toc,page,title,titletoc,header]{appendix}
\renewcommand{\appendixpagename}{LAMPIRAN}
\renewcommand{\appendixtocname}{LAMPIRAN}
\noappendicestocpagenum
%\renewcommand{\setthesection}{\thechapter.\@arabic\c@section.}
%\renewcommand{\setthesection}{\Alph{\section}}
\appendixtocoff
\appendixpageoff

\RequirePackage{ifthen}
\RequirePackage{nomencl}%
\setlength{\nomitemsep}{-\parsep}
\renewcommand{\nomname}{\nomenclaturename}%
%\makeglossary%
\makenomenclature

%\begin{enumerate}
%\item 
\renewcommand{\nomgroup}[1]{
   \vspace{1.25cm}
   \ifthenelse{\equal{#1}{A}} {\item[\large{\textbf{Lambang Romawi}}]} 
       {
       \ifthenelse{\equal{#1}{B}}{ \item[\large{\textbf{Lambang Yunani}}]}
           {
           \ifthenelse{\equal{#1}{C}}{\item[\large{\textbf{Subskrip}}]}
               {
               \ifthenelse{\equal{#1}{D}}{\item[\large{\textbf{Superskrip}}]}
                    {
                    \ifthenelse{\equal{#1}{E}}{\item[\large{\textbf{Singkatan}}]}}{}
               }
            }
       }
   }
   
\renewcommand{\nompreamble}{\vspace{-1.75cm}}
\newcommand{\nomunit}[1]{%
   \renewcommand{\nomentryend}{\hspace*{\fill}#1}}
%\end{enumerate}


% -----------
% Setting Table of Contents
%-------------
   

%\renewcommand{\simplechapterdelim}{.}
%\simplechapter[Lampiran]

\RequirePackage[titles,subfigure]{tocloft}
\renewcommand{\cftchapaftersnum}{.   }
\renewcommand{\cftchappresnum}{ }
\renewcommand{\cfttabaftersnum}{.}
\renewcommand{\cftfigaftersnum}{.}
%gpratama - menambahkan kata Gambar dan Tabel
\renewcommand\cftfigpresnum{Gambar }
\renewcommand\cfttabpresnum{Tabel }
%
\newlength{\lebar}
%\settowidth{\lebar}{\cftchappresnum\cftchapaftersnum \@plus 25em}
\settowidth{\lebar}{\cftchappresnum\cftchapaftersnum}
\addtolength{\cftchapnumwidth}{\lebar}
\addtolength{\cftsecnumwidth}{\lebar}
\setlength{\cftfignumwidth}{5.8em}
\setlength{\cfttabnumwidth}{5em}

\RequirePackage{enumitem}
\RequirePackage[labelsep=period,labelfont=bf, format=hang]{caption}
\RequirePackage{color}
\RequirePackage{listings}
\RequirePackage{url}
\urlstyle{rm}

%------------------------------------------------------------
%Layout
%------------------------------------------------------------
\setlength{\topmargin}{-1cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{2.3cm}
\setlength{\topskip}{1ex}
\setlength{\oddsidemargin}{1.46cm}
\setlength{\evensidemargin}{1.46cm}
\setlength{\textwidth}{14.3cm}
\setlength{\textheight}{22cm}
\setlength{\footskip}{1.5cm}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

\setlength{\parindent}{3em} %Indent approx 6 character

%------------------------------------------------------------
%The form of page numbering
%------------------------------------------------------------
\pagestyle{myheadings}
\markright{}
%\pagestyle{plain}

%------------------------------------------------------------
%Define page numbering in the first chapter
%------------------------------------------------------------
\def\ps@chapterheading{%
  \let\@evenhead\@empty\let\@oddhead\@empty
  \def\@oddfoot{\hfil\thepage\hfil}%
  \def\@evenfoot{\hfil\thepage\hfil}
  }

%------------------------------------------------------------
%Redefine chapter and sections
%------------------------------------------------------------
\setcounter{secnumdepth}{3}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
\renewcommand \thesection {\@Roman\c@chapter.\@arabic\c@section.}
\renewcommand\thesubsection   {\thesection\@arabic\c@subsection.}
%\renewcommand\thesubsubsection   {\thesubsection\@arabic\c@subsection.}
\renewcommand\thesubsubsection   {\thesubsection\@arabic\c@subsubsection.} %editusi

\newcommand{\Lampiran}[2][?]{
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
\refstepcounter{chapter}
\addcontentsline{toc}{appendix}{\protect\numberline{\appendixname~\thechapter}#1}
{\raggedleft\large\bfseries\appendixname\
\thesection\par \centering#2\par}
\sectionmark{#1}
\@afterheading
\addvspace{\baselineskip}
}
\newcommand{\sLampiran}[1]{
\raggedleft\large\bfseries\appendixname
\@afterheading\addvspace{\baselineskip}
}

\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
 % \gdef\cftchappresnum{LAMPIRAN }
  %\addcontentsline{toc}{appendix}{\protect\numberline{\appendixname~\thechapter}}
  \gdef\thechapter{\@Alph\c@chapter}
  \gdef\thesection{\thechapter.\@arabic\c@section.}
  \gdef\thefigure{\thechapter.\arabic{figure}}
  \gdef\theequation{\thechapter.\arabic{equation}}
  \gdef\thetable{\thechapter.\arabic{table}}
}

\renewcommand{\chapter}{\clearpage\thispagestyle{chapterheading}%
  \global\@topnum\z@ %Prevents figures from going at top of page
  \@afterindenttrue %Indent the 1st paragraph
  \secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 5\p@
    \fi
    \interlinepenalty\@M
    \large \bfseries \MakeUppercase{ #1} \par\nobreak
    \vskip 20\p@
    }}
\renewcommand{\@makeschapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@ }}
\renewcommand{\section}{\@startsection{section}{1}{\z@}%{\parindent}%
                                     {-3.5ex\@plus -1ex \@minus -.2ex}%
                                     {2.3ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    %{-1em}%
                                    {2.3ex \@plus .2ex}
                                    {\normalfont\normalsize\bfseries}}
%tambahan usi karena subsubsection bermasalah
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
									{3.00ex \@plus1ex \@minus.2ex}%
									{2.3ex \@plus .2ex}
									{\normalfont\normalsize\bfseries}}

\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
%\renewcommand{\thesubfigure}{\arabic{chapter}.\arabic{subfigure}}

%------------------------------------------------------------
%Redefine caption names
%------------------------------------------------------------
\def\captionsbahasa{%
\def\prefacename{KATA PENGANTAR}%
\def\contentsname{DAFTAR ISI}%
\def\listfigurename{DAFTAR GAMBAR}%
\def\listtablename{DAFTAR TABEL}%
\def\listappendixname{DAFTAR LAMPIRAN}%
\def\nomenclaturename{DAFTAR LAMBANG DAN SINGKATAN}%
\def\intisariname{INTISARI}%
\def\abstractname{\textit{ABSTRACT}}
\def\partname{BAGIAN}%
\def\chaptername{BAB}%
\def\appendixname{LAMPIRAN}%
\def\refname{DAFTAR PUSTAKA}%
\def\bibname{DAFTAR PUSTAKA}%
\def\indexname{Indeks}%
\def\figurename{Gambar}%
\def\tablename{Tabel}%
\def\pagename{Halaman}%
\def\mottoname{HALAMAN MOTO}
\def\approvalname{HALAMAN PENGESAHAN}
\def\persembahanname{HALAMAN PERSEMBAHAN}
\def\judulname{HALAMAN JUDUL}
\def\plagiarismname{PERNYATAAN BEBAS PLAGIASI}
\def\halamantugasname{HALAMAN TUGAS}
}


%------------------------------------------------------------]
%Define thesis's inputs
%------------------------------------------------------------
\gdef\@universityind{Universitas Gadjah Mada}
\gdef\@programind{Sarjana S1}
\gdef\@cityind{Yogyakarta}
%\gdef\@gelar{Sarjana S1}
\newcommand{\judul}[1]{\gdef\@judul{#1}}
\newcommand{\@judul}{}
\newcommand{\juduleng}[1]{\gdef\@juduleng{#1}}
\newcommand{\@juduleng}{}
\newcommand{\gelar}[1]{\gdef\@gelar{#1}}
\newcommand{\@gelar}{}
\newcommand{\jenisTA}[1]{\gdef\@jenisTA{#1}}
\newcommand{\@jenisTA}{}
\newcommand{\nama}[1]{\gdef\@nama{#1}}
\newcommand{\@nama}{}
\newcommand{\nim}[1]{\gdef\@nim{#1}}
\newcommand{\@nim}{}
\newcommand{\angkatan}[1]{\gdef\@angkatan{#1}}
\newcommand{\@angkatan}{}
\newcommand{\prodi}[1]{\gdef\@prodi{#1}}
\newcommand{\@prodi}{}
\newcommand{\prodieng}[1]{\gdef\@prodieng{#1}}
\newcommand{\@prodieng}{}
\newcommand{\jurusan}[1]{\gdef\@jurusan{#1}}
\newcommand{\@jurusan}{}
\newcommand{\thselesai}[1]{\gdef\@thselesai{#1}}
\newcommand{\@thselesai}{}
\newcommand{\tglujian}[1]{\gdef\@tglujian{#1}}
\newcommand{\@tglujian}{\number\day~\ifcase\month\or
    Januari\or Pebruari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or Nopember\or Desember\fi
    \space \number\year}
\newcommand{\tglujianeng}[1]{\gdef\@tglujianeng{#1}}
\newcommand{\@tglujianeng}{\number\day~\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space \number\year}
\newcommand{\tglpenulisan}[1]{\gdef\@tglpenulisan{#1}}
\newcommand{\@tglpenulisan}{\number\day~\ifcase\month\or
    Januari\or Pebruari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or Nopember\or Desember\fi
    \space \number\year}
\newcommand{\pembimbingutama}[1]{\gdef\@pembimbingutama{#1}}
\newcommand{\@pembimbingutama}{}
\newcommand{\pembimbingpendamping}[1]{\gdef\@pembimbingpendamping{#1}}
\newcommand{\@pembimbingpendamping}{}
\newcommand{\ketuasidang}[1]{\gdef\@ketuasidang{#1}}%
\newcommand{\@ketuasidang}{}
\newcommand{\sekretarissidang}[1]{\gdef\@sekretarissidang{#1}}%
\newcommand{\@sekretarissidang}{}
\newcommand{\pengujiutama}[1]{\gdef\@pengujiutama{#1}}%
\newcommand{\@pengujiutama}{}
\newcommand{\anggotapenguji}[1]{\gdef\@anggotapenguji{#1}}%
\newcommand{\@anggotapenguji}{}

\newcommand{\nipanggotapenguji}[1]{\gdef\@nipanggotapenguji{#1}}%
\newcommand{\@nipanggotapenguji}{}
\newcommand{\nippengujiutama}[1]{
\gdef\@nippengujiutama{#1}}%
\newcommand{\@nippengujiutama}{}
\newcommand{\nipsekretarissidang}[1]{\gdef\@nipsekretarissidang{#1}}%
\newcommand{\@nipsekretarissidang}{}
\newcommand{\nipketuasidang}[1]{\gdef\@nipketuasidang{#1}}%
\newcommand{\@nipketuasidang}{}
\newcommand{\nippembimbingutama}[1]{\gdef\@nippembimbingutama{#1}}%
\newcommand{\@nippembimbingutama}{}
\newcommand{\nippembimbingpendamping}[1]{\gdef\@nippembimbingpendamping{#1}}%
\newcommand{\@nippembimbingpendamping}{}
\newcommand{\permasalahan}[1]{\gdef\@permasalahan{#1}}
\newcommand{\@permasalahan}{}
%\newcommand{\lamaskripsi}[1]{\gdef\@lamaskripsi{#1}}%
%\newcommand{\@lamaskripsi}{}
\newcommand{\kadep}[1]{\gdef\@kadep{#1}}
\newcommand{\@kadep}{}
\newcommand{\nipkadep}[1]{\gdef\@nipkadep{#1}}%
\newcommand{\@nipkadep}{}

%------------------------------------------------------------
%Define cover in Indonesian
%------------------------------------------------------------
\def\halamansampul{%
  \thispagestyle{empty}%
    \begin{center}
      {\normalfont\bfseries \@jenisTA}\par\nobreak
      \vspace{1.0cm}
      {\normalfont\large\bfseries\MakeUppercase{\@judul}}\par\nobreak
      \vspace{1.5cm}
    \vfill
    %\includegraphics[width=180pt]{logoUGM}
\includegraphics[width=5.5cm]{logoUGM}
    \vfill
      \vspace{1.5cm}
      {\normalfont 
        Disusun oleh: \\
        \@nama\\
        \@nim}\\
     \vspace{1.5cm}
      \begin{onehalfspace}
      {\normalfont\bfseries 
         DEPARTEMEN TEKNIK NUKLIR DAN TEKNIK FISIKA\\
         FAKULTAS TEKNIK\\
         {UNIVERSITAS GADJAH MADA}\\
         YOGYAKARTA\\
         \@thselesai}\\
      \end{onehalfspace}
      \end{center}
}  
%------------------------------------------------------------
%Define titlepage in Indonesian
%------------------------------------------------------------
\def\halamanjudul{%
  \newpage\thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
    \begin{center}
      {\normalfont\large\bfseries\MakeUppercase{\@judul} }\par\nobreak
      \vspace{1.0cm}
      {\normalfont\bfseries\@jenisTA}\par\nobreak
      \vspace{1cm}
      \begin{onehalfspace}
      {\normalfont 
        untuk memenuhi sebagian persyaratan\\
        untuk memperoleh derajat Sarjana\\%\space\@gelar \space \\%edited by usi
        %\vspace{0.5cm}
        Program Studi\space\@prodi \space} \\
        %Jurusan \space\@jurusan}\\
  \vspace{1.3cm}
    \vfill
%    \includegraphics[width=180pt]{logoUGM}
        \includegraphics[width=5.5cm]{logoUGM}
       \vfill
      \vspace{1.2cm}
      {\normalfont 
        diajukan oleh \\
        \MakeUppercase{\@nama}\\
        \@nim}\\
      \vspace{1.2cm}

       {\normalfont kepada \\}
      {\normalfont\bfseries 
         DEPARTEMEN TEKNIK NUKLIR DAN TEKNIK FISIKA\\
         FAKULTAS TEKNIK\\
         {UNIVERSITAS GADJAH MADA}\\
         YOGYAKARTA\\
         \@thselesai}\\
      \end{onehalfspace}
      \end{center}
\addcontentsline{toc}{chapter}{\judulname}
}  

%------------------------------------------------------------
%Free from Plagiarism Page
%------------------------------------------------------------
\def\scanhalamanpernyataan{%
	\newpage\thispagestyle{empty}%
	\vspace*{-1.8in}
	\hspace*{-2.1in}
	\includegraphics[width=21cm]{pernyataan-bebas-plagiasi.jpg}

	\addcontentsline{toc}{chapter}{\plagiarismname}
}

\def\halamanpernyataan{%
  \newpage\thispagestyle{chapterheading}%
 
  \begin{onehalfspace}
 \begin{center}
  {\normalfont\large\bfseries PERNYATAAN BEBAS PLAGIASI}\par\nobreak
\end{center}
  \vspace{1cm}
 Saya yang bertanda tangan di bawah ini:
\par\nobreak
  \vspace{0.5cm}
\begin{singlespace}
\begin{tabular}{p{3cm}p{0.1cm}p{9cm}}
Nama  & : &\@nama\\
NIM   & : & \@nim\\
Tahun terdaftar & : & \@angkatan\\
Program Studi & : & \@prodi\\
Fakultas & : & Teknik
\end{tabular}
\end{singlespace}

\vspace{0.6cm}
\noindent menyatakan bahwa dokumen ilmiah Skripsi ini tidak terdapat bagian dari karya ilmiah lain yang telah diajukan untuk memperoleh gelar akademik di suatu lembaga Pendidikan Tinggi, dan juga tidak terdapat karya atau pendapat yang pernah ditulis atau diterbitkan oleh orang/lembaga lain, kecuali yang secara tertulis disitasi dalam dokumen ini dan disebutkan sumbernya secara lengkap dalam daftar pustaka.

Dengan demikian saya menyatakan bahwa dokumen ilmiah ini bebas dari unsur-unsur plagiasi dan apabila dokumen ilmiah Skripsi ini di kemudian hari terbukti merupakan plagiasi dari hasil karya penulis lain dan/atau dengan sengaja mengajukan karya atau pendapat yang merupakan hasil karya penulis lain, maka penulis bersedia menerima sanksi akademik dan/atau sanksi hukum yang berlaku.

\vspace{1.5cm}
%\begin{flushright}
 



\begin{singlespace}

 {\raggedleft\begin{tabular}{l@{}}\ignorespaces
     Yogyakarta, \@tglpenulisan\\
Yang menyatakan,\\ \\ \\ \fbox{\textit{(Materai Rp10.000,-)}}\\ \\ \\
      \@nama \\*[2\parskip]%
      NIM. \@nim \end{tabular}\par}
\end{singlespace}

%\end{flushright}



    \end{onehalfspace}
%    \end{center}
\addcontentsline{toc}{chapter}{\plagiarismname}
}


%------------------------------------------------------------
%Approval Page
%------------------------------------------------------------
%Edited by Usi, mengikuti format terbaru
\def\halamanpengesahan{%
  \newpage\thispagestyle{chapterheading}%
  \begin{center}
  {\normalfont\large\bfseries HALAMAN PENGESAHAN}\par\nobreak
  \vspace{0.5cm}
  {\normalfont \@jenisTA}\par\nobreak
  \vspace{0.5cm}
  {\normalfont\bfseries\MakeUppercase{\@judul}}\par\nobreak
  \vspace{0.5cm}
%oleh \\
\end{center}
\vspace{0.5cm}
\begin{tabular}{p{5cm}l}
	Nama Mahasiswa &: {\normalfont \@nama}\\
	Nomor Mahasiswa &: {\normalfont \@nim} \vspace{0.5cm}\\
	Pembimbing Utama &: {\@pembimbingutama}\\
	Pembimbing Pendamping &: {\@pembimbingpendamping}
	
\end{tabular}
\vspace{0.5cm}

\begin{center}
	\begin{singlespace}
		Skripsi ini telah dipertahankan di depan Tim Penguji\\
		pada tanggal \expandafter{\@tglujian}\\
	\end{singlespace}
\end{center}
\vspace{0.3cm}

\hspace*{-1.3cm}\begin{tabular}{p{5cm}l}
	Ketua Sidang &: {\@ketuasidang}\\
	Penguji Utama &: {\@pengujiutama}\\
	Anggota Penguji &: {\@anggotapenguji}\\
\end{tabular}

\vspace{0.5cm}
	\begin{center}
	
	\begin{singlespace}
	Skripsi ini telah diterima dan dinyatakan memenuhi \\syarat kelulusan pada tanggal $\dots\dots$\\
	\end{singlespace}

	\begin{onehalfspace}
\vspace{0.3cm}
Ketua Departemen Teknik Nuklir dan Teknik Fisika \\
Fakultas Teknik UGM \\

\vspace{2cm}
\begin{singlespace}\underline{\@kadep} \\
NIP. \@nipkadep
\end{singlespace}

    \end{onehalfspace}
    \end{center}
\addcontentsline{toc}{chapter}{\approvalname}
}

%------------------------------------------------------------
%HALAMAN TUGAS
%------------------------------------------------------------



%------------------------------------------------------------
%Acknowledgment
%------------------------------------------------------------
\def\persembahan{%
  \clearpage\thispagestyle{chapterheading}%
\null%\vfill%Force the content of acknowledment to bottom page 
\addcontentsline{toc}{chapter}{\persembahanname}
}

%------------------------------------------------------------
%Motto
%------------------------------------------------------------
\def\motto{%
  \clearpage\thispagestyle{chapterheading}%
\null\vfill%Force the content of acknowledment to bottom page 
\addcontentsline{toc}{chapter}{\mottoname}
}

%------------------------------------------------------------
%Preface
%------------------------------------------------------------
\def\pengantar{%
  \chapter*{\prefacename}%
\addcontentsline{toc}{chapter}{\prefacename}
}

%------------------------------------------------------------
%Nomenclature
%------------------------------------------------------------
\def\lambang{%
  \clearpage\thispagestyle{chapterheading}%
%  \printglossary%
%\addcontentsline{toc}{chapter}{\nomenclaturename}
\nomenclature[aa]{\emph{Lambang }}{\emph{Kuantitas } \nomunit{\emph{Satuan }}}%
\nomenclature[ba]{\emph{Lambang }}{\emph{Kuantitas } \nomunit{\emph{Satuan }}}%
%\nomenclature[ca]{\emph{Lambang }}{\emph{Deskripsi }}%
%\nomenclature[da]{\emph{Lambang }}{\emph{Deskripsi }}%
%\nomenclature[eaa]{\emph{Singkatan }}{\emph{ }}%
%\markboth{\nomname}{\nomname}
\addcontentsline{toc}{chapter}{\nomenclaturename}%
%\printglossary[2.5cm]%
\printnomenclature[2.5cm]
}

%------------------------------------------------------------
%Redefine Abstract in Indonesian
%------------------------------------------------------------
\def\intisari{%
  \clearpage\thispagestyle{chapterheading}%
  {\parindent \z@ \centering \normalfont
 %  {\normalsize\bfseries \intisariname}\par\nobreak
 %  \vskip 10\p@
   {\large\bfseries\MakeUppercase{\@judul}}
        \par\nobreak
        %\vskip 6\p@ usi
    \interlinepenalty\@M
    {\normalsize oleh}\par\nobreak
    %\vskip 6\p@ usi
    \begin{singlespace}
    {\normalsize \@nama \\ \@nim}
        %\vskip 10\p@ edited below by usi
        \vskip 4\p@
      Diajukan kepada Departemen Teknik Nuklir dan Teknik Fisika Fakultas Teknik \\
      Universitas Gadjah Mada pada tanggal \@tglujian \\
      untuk memenuhi sebagian persyaratan untuk memperoleh derajat \\
      Sarjana Program Studi \@prodi
    \end{singlespace}
     \par\nobreak
    } 
  %\vspace{1cm} usi was here
{\parindent \z@ \centering \normalfont
{\normalsize\bfseries \intisariname}\par\nobreak }
  \begin{singlespace}%
  \addcontentsline{toc}{chapter}{\intisariname}
}
\def\endintisari{
%\vspace{1cm} edited by usi
\vspace{0.3cm}
\hspace{-1.5cm}
\begin{tabular}{ll}
Pembimbing Utama: & \@pembimbingutama \\
Pembimbing Pendamping: & \@pembimbingpendamping    
\end{tabular}

\par\vfil\null\end{singlespace}}


%------------------------------------------------------------
%Redefine Abstract in English
%------------------------------------------------------------
\def\abstracteng{%
  \clearpage\thispagestyle{chapterheading}%
  {\parindent \z@ \centering \normalfont
%   {\normalsize\bfseries \abstractname}\par\nobreak
%   \vskip 10\p@
 %  {\large\bfseries\@juduleng}
   {\large\bfseries\MakeUppercase{\@juduleng}}
        \par\nobreak
        %\vskip 6\p@ edited by usi
    \interlinepenalty\@M
    {\normalsize by}\par\nobreak
    	%\vskip 6\p@ edited by usi
    \begin{singlespace}
    {\normalsize \@nama \\ \@nim}
        %\vskip 10\p@ edited below by usi
        \vskip 3\p@
      Submitted to the Department of Nuclear Engineering and Engineering Physics \\
      Faculty of Engineering Universitas Gadjah Mada on \@tglujianeng \\
      in partial fulfillment of the requirement for the Degree of \\ Bachelor of Engineering in 
       \@prodieng
      

 \end{singlespace}
    \par\nobreak
    } 
  %\vspace{1cm} edited by usi

{\parindent \z@ \centering \normalfont
{\normalsize\bfseries ABSTRACT}\par\nobreak }
  \begin{singlespace}%
  \addcontentsline{toc}{chapter}{\abstractname}
}
\def\endabstracteng{
%\vspace{1cm} edited below by usi
\vspace{0.25cm}
\hspace{-1.5cm}
\begin{tabular}{ll}
Supervisor: & \@pembimbingutama \\
Co-supervisor: & \@pembimbingpendamping    
\end{tabular}


\par\vfil\null\end{singlespace}
\selectlanguage{bahasa}\clearpage\pagenumbering{arabic}\setcounter{page}{1}}



\AtBeginDocument{%
\if@doublesp%
\doublespacing%
\else\if@singlesp%
\singlespacing%
\else
\onehalfspacing%
\fi%
\fi
}

\endinput
