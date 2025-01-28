% The script "fp5" is designed to assist the composition of Jonas
% Hocherman's "Plankton Muse", for Big Band. This piece is based on the
% sonification of data representing the dynamical growth of phytoplankton
% in the Baltic Sea during the year 2024. The data was captured by the
% Finnish Environment Institute (SYKE) and shared with the author for
% artistic purposes.
% 
% Created in 2024 under MATLAB R2023a (Mac OS)
%
% Copyright ©2024, Pauxy Gentil-Nunes, Jonas Hocherman,PArtiMus Research
% Groups - PPGM-UFRJ. Thanks to Lumi Haraguchi for the assistance and
% help.See License.txt 
% .......... Initialization
clc
% .......... Reads the table with plankton data
P = readtable('fp5.xlsx'); % option for "Plankton Muse" 
% .......... Prepare data for Plankton Muse
time = P.Data_Hora;
names = P.Grupos;
namelist = unique(names)
vetores = [];
time = char(time);
format longG;
% .......... Calculating data
    % .......... Selection of plankton groups. The numbers refers to the 8
    % groups, as follows: 1) Crypto; 2) Cyano; 3) Micro; 4) NF_L; 5) NF_M;
    % 6) NF_S; 7) Pico_euk; 8) Pico_pro. The vector can be edit freely.
    for g = [8 7 6 5 4 1 3 2]
    type = namelist(g)
    % .......... List of timepoints
    listime = unique(time, 'rows', 'stable');
    dn = [];
    % Detect lines and blocks of each group and store in vetores.
        for f = 1:size(listime,1)
            indtemp = find(ismember (time, listime(f,:),'rows'));
            names = P.Grupos(indtemp);
            quant = P.zscore_biomassa(indtemp);
            % quant = str2double(quant)
                if any(ismember(names, type))
                    dntemp = quant(ismember(names,type));
                    dntemp = sum(str2num(char(dntemp)));
                    if dntemp > 8
                        retirar = indtemp;
                    end
                else
                    dntemp = 0;
                end
            dn = [dn dntemp];
        end
    vetores = [vetores; dn];
    end
% vetores = vetores';
% .......... Render the graph
fh = figure(1);
grid on
hold on
    for f = 1:size(vetores,1)
    plot(vetores (f,:));
    % area (vetores (f,:)); % Option for area graph
    % loglog(vetores (f,:)); % Option for logarithm rendering
    end
hold off
