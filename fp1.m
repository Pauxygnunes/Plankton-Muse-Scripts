% The script "fp1" is designed to assist the composition of Jonas
% Hocherman's "Ensaios", for ensemble. These pieces are based on specific
% concepts and techniques like weave-texture, linear texture, and
% carrossel.
% 
% Created in 2024 under MATLAB R2023a (Mac OS)
%
% Copyright ©2024, Pauxy Gentil-Nunes, Jonas Hocherman,PArtiMus Research
% Groups - PPGM-UFRJ. See License.txt
% .......... Initialization
clc
% .......... Reads the table with plankton data
P = readtable('fp3.xlsx');
% .......... Prepare data for Plankton Muse
time = table2array(P(:,3));
names = table2array(P(:,4));
namelist = unique(names)
vetores = [];
% .......... Calculating data
    % .......... Selection of plankton groups. The numbers refers to the 8
    % groups, as follows: 1) Crypto; 2) Cyano; 3) Micro; 4) NF_L; 5) NF_M;
    % 6) NF_S; 7) Pico_euk; 8) Pico_pro. The vector can be edit freely.
    for g = [8 7 6 5 4 1 3 2]
    type = namelist(g)
    % .......... List of timepoints
    listime = unique(time);
    dn = [];
    % Detect lines and blocks of each group and store in vetores.
        for f = 1:size(listime,1)
            indtemp = find(strcmpi (time, listime(f)));
            names = table2array(P(indtemp,4));
            quant = table2array(P(indtemp,5));
            quant = str2double(quant);
                if any(ismember(names, type))
                    dntemp = quant(ismember(names,type));
                else
                    dntemp = 0;
                end
            dn = [dn dntemp];
        end
    vetores = [vetores; dn];
    end
% Render graphic
legend(namelist(g))
title('Gráfico de Evolução da Quantidade Total (Segmentado em Linhas)')
xlabel('Tempo')
ylabel('Quantidade')
figure(1) 
grid on
hold on
    for f = 1:size(vetores,1)
        plot(vetores (f,:));
    end
