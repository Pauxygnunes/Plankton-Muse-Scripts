% The script "parttable" is designed to assist the composition of Jonas
% Hocherman's "Plankton Muse", for Big Band. This piece is based on the
% sonification of data representing the dynamical growth of phytoplankton
% in the Baltic Sea during the year 2024. The data was captured by the
% Finnish Environment Institute (SYKE) and shared with the author for
% artistic purposes. The resultant table is composed by nine columns, being
% the last eight the partitions to be applied in the composition,
% calculated from the data of plankton growth and converted in instrumental
% parts. The first column gives the number of ocurrences of the partition
% in the given range. This information can help the composer to choose more
% appropriate partitions for each section of the word.
% 
% Created in 2024 under MATLAB R2023a (Mac OS)
%
% Copyright ©2024, Pauxy Gentil-Nunes, Jonas Hocherman,PArtiMus Research
% Groups - PPGM-UFRJ. See License.txt
% .......... Initialization
clc
tab = []; 
start = 1;
target = 187;
width = target - start;
% .......... Convert to integers and mount temporary table
for f = start : target %size (partes, 2)
    tempcol = partes (:,f);
    partition = (round (tempcol))';
    tab = [tab;partition];
end 
[tab,~,b] = unique (tab, 'rows', 'stable');
% .......... Counts the ocurrences of each partition in section
inds = unique (b);
occur = [];
for f = 1 : numel (inds)
    quant = numel (find (b==inds (f)));
    occur = [occur; quant];
end
format short
tab = [occur, tab]