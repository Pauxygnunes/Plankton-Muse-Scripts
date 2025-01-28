% The script "ensaios" is designed to assist the composition of Jonas
% Hocherman's "Plankton Muse", for Big Band, and "Ensaios", for ensembles.
% "Plakton Muse" is based on the sonification of data representing the
% dynamical growth of phytoplankton in the Baltic Sea during the year 2024.
% The data was captured by the Finnish Environment Institute (SYKE) and
% shared with the author for artistic purposes. "Ensaios" are preparatory
% studies of application of some concepts and techniques, like
% weave-texture, linear texture and carrossel.
%
% Created in 2024 under MATLAB R2023a (Mac OS)
%
% Copyright ©2024, Pauxy Gentil-Nunes, Jonas Hocherman,PArtiMus Research
% Groups - PPGM-UFRJ. See License.txt
% ..........Initialization
clc
format longg
% .......... Selection of plankton groups and timepoints. The value 1.05 is
% an offset given in the original data, corrected to ensure only positive
% results. Some lines are open to allow reading the data in the command
% window. There are distinct options for "Ensaios" and "Plankton Muse" –
% lines can be opened or closed accordingly.
% 
% % Values for "Ensaios"
% selecao = vetores(1:8,1:200)+1.05;
% selecao(selecao==1.05)= 0;
% 
% % Values for "Plankton Muse"
selecao = vetores(1:8,801:1332)+1.454;
selecao(selecao==1.454)= 0;
% 
% ......... Proportion of the sum of the mass of phitoplankton related to
% the maximum of voices of the instrumental ensemble, calculated for each
% timepoint.
somas = sum(selecao,1);
% 
% % Values for "Ensaios"
% instrumentacao = 46;
% partes = (selecao(1:8,:)*instrumentacao)/30.40 
% proporcao = (somas(1,:)*instrumentacao)/30.40
% 
% % Values for "Plankton Muse"
instrumentacao = 45;
partes = (selecao(1:8,:)*instrumentacao)/42.75727
proporcao = (somas(1,:)*instrumentacao)/42.75727;