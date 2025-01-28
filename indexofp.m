% The script "indexofp" provides an indexogram from the dynamic of growth
% of groups of phytoplankton. This data was used in the composition of
% Jonas Hocherman's "Plankton Muse". The present script is an application
% of concepts and tools of the Partitional Musical Theory to an
% extramusical phenomenon, biological in this case.
% 
% Created in 2024 under MATLAB R2023a (Mac OS)
%
% Copyright ©2024, Pauxy Gentil-Nunes, Jonas Hocherman,PArtiMus Research
% Groups - PPGM-UFRJ. Thanks to Lumi Haraguchi for the assistance and
% help. See License.txt 
% .......... Initialization
clc
format longG
tab = [];
% .......... Selection of plankton groups and timepoints. The value 1.454
% is an offset given in the original data, corrected to ensure only
% positive results. Some lines are open to allow reading the data in the
% command window. There are distinct options for "Ensaios" and "Plankton
% Muse" – lines can be opened or closed accordingly.
% Options for "Plankton Muse"; for "Ensaios", these two lines are
% dismissable
selecao = vetores+1.454;
selecao(selecao==1.454)= 0;
% .......... Selection of the desired range (can be edit according to the
% range of the table)
start = 1;
stop = 4781;
% .......... Conversion to integers and montage of table
    for f = 1:(stop-start)
    part = round(selecao(:,f+start))';
    tab = [tab; f part];
    end
% .......... Render the indexogram
indexograma(tab)
