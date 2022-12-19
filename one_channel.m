function out = one_channel(feat,i)
% i - channel number from 1 to 12

idx_1 = i:12:469+i;
switch i
    case 1
        idx_2 = 481:484;  % for hist_feat
        idx_3 = 529:532; % for ar4_feat
        idx_4 = 577:581; % for ar5_feat
        idx_5 = 637:642; % for ar6_feat
    case 2
        idx_2 = 485:488;  % for hist_feat
        idx_3 = 533:536; % for ar4_feat
        idx_4 = 582:586; % for ar5_feat
        idx_5 = 643:648; % for ar6_feat 
    case 3
        idx_2 = 489:492;  % for hist_feat
        idx_3 = 537:540; % for ar4_feat
        idx_4 = 587:591; % for ar5_feat
        idx_5 = 649:654; % for ar6_feat   
    case 4
        idx_2 = 493:496;  % for hist_feat
        idx_3 = 541:544; % for ar4_feat
        idx_4 = 592:596; % for ar5_feat
        idx_5 = 655:660; % for ar6_feat 
    case 5
        idx_2 = 497:500;  % for hist_feat
        idx_3 = 545:548; % for ar4_feat
        idx_4 = 597:601; % for ar5_feat
        idx_5 = 661:666; % for ar6_feat 
    case 6
        idx_2 = 501:504;  % for hist_feat
        idx_3 = 549:552; % for ar4_feat
        idx_4 = 602:606; % for ar5_feat
        idx_5 = 667:672; % for ar6_feat 
    case 7 
        idx_2 = 505:508;  % for hist_feat
        idx_3 = 553:556; % for ar4_feat
        idx_4 = 607:611; % for ar5_feat
        idx_5 = 673:678; % for ar6_feat 
    case 8
        idx_2 = 509:512;  % for hist_feat
        idx_3 = 557:560; % for ar4_feat
        idx_4 = 612:616; % for ar5_feat
        idx_5 = 679:684; % for ar6_feat 
    case 9
        idx_2 = 513:516;  % for hist_feat
        idx_3 = 561:564; % for ar4_feat
        idx_4 = 617:621; % for ar5_feat
        idx_5 = 685:690; % for ar6_feat
    case 10
        idx_2 = 517:520;  % for hist_feat
        idx_3 = 565:568; % for ar4_feat
        idx_4 = 622:626; % for ar5_feat
        idx_5 = 691:696; % for ar6_feat      
    case 11
        idx_2 = 521:524;  % for hist_feat
        idx_3 = 569:572; % for ar4_feat
        idx_4 = 627:631; % for ar5_feat
        idx_5 = 697:702; % for ar6_feat   
    case 12
        idx_2 = 525:528;  % for hist_feat
        idx_3 = 573:576; % for ar4_feat
        idx_4 = 632:636; % for ar5_feat
        idx_5 = 703:708; % for ar6_feat         
end

out_1 = feat(:,idx_1);
out_2 = feat(:,idx_2);
out_3 = feat(:,idx_3);
out_4 = feat(:,idx_4);
out_5 = feat(:,idx_5);

out = [out_1 out_2 out_3 out_4 out_5];

% feature_names = {'RMS','MAV','AAC','AE','ASM','ABSS','CARD','COV','DAMV','DASDV'...
%     'DVARV','EMAV','EWL','IEMG','IQR','KURT','LCOV','LD','LDAMV','LDASDV',...
%     'MFL','MAD','MAVS','MSR','MMAV1','MMAV2','MYOP','NZC','SSI','SK','SSC','STD'...
%     'TKEO','TEMPM','VAR','VAREMG','VO','WL','WAMP','ZC','HIST1','HIST2','HIST3','HIST4','HIST5'...
%     'AR4_1','AR4_2','AR4_3','AR4_4','AR5_1','AR5_2','AR5_3','AR5_4','AR5_5'...
%     'AR6_1','AR6_2','AR6_3','AR6_4','AR6_5','AR6_6'};
% 
% t = array2table(out, 'VariableNames', feature_names);

end