cleanUp

load('psiData2.mat');

f10 = figProperties('PSI evolution combined', 'normalized', [0, .005, .97, .90], 'w', 'on');
hold on


%% Data bars for PSI within areas
gap = 1;

colour = cellColour('Cx4');
barGroupCount = 1;
barCount = 1;
bar1 = mean(psi2RasterCx4MeanSecond,'omitnan')-mean(psi2RasterCx4MeanFirst,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar1, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar2 = mean(psi2RasterCx4MeanThird10,'omitnan')-mean(psi2RasterCx4MeanSecond,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar2, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar3 = mean(psi2RasterCx4Mean_SWDs,'omitnan')-mean(psi2RasterCx4MeanThird10,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar3, 'FaceColor',colour, 'EdgeColor',colour);

colour = cellColour('Cx5');
barGroupCount = barGroupCount + 1;
barCount = barCount + 1;
bar4 = mean(psi2RasterCx5MeanSecond,'omitnan')-mean(psi2RasterCx5MeanFirst,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar4, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar5 = mean(psi2RasterCx5MeanThird10,'omitnan')-mean(psi2RasterCx5MeanSecond,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar5, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar6 = mean(psi2RasterCx5Mean_SWDs,'omitnan')-mean(psi2RasterCx5MeanThird10,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar6, 'FaceColor',colour, 'EdgeColor',colour);

colour = cellColour('NRT');
barGroupCount = barGroupCount + 1;
barCount = barCount + 1;
bar7 = mean(psi2RasterNRTMeanSecond,'omitnan')-mean(psi2RasterNRTMeanFirst,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar7, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar8 = mean(psi2RasterNRTMeanThird10,'omitnan')-mean(psi2RasterNRTMeanSecond,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar8, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar9 = mean(psi2RasterNRTMean_SWDs,'omitnan')-mean(psi2RasterNRTMeanThird10,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar9, 'FaceColor',colour, 'EdgeColor',colour);

colour = cellColour('NRT2');
barGroupCount = barGroupCount + 1;
barCount = barCount + 1;
bar10 = mean(psi2RasterNRT2MeanSecond,'omitnan')-mean(psi2RasterNRT2MeanFirst,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar10, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar11 = mean(psi2RasterNRT2MeanThird10,'omitnan')-mean(psi2RasterNRT2MeanSecond,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar11, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar12 = mean(psi2RasterNRT2Mean_SWDs,'omitnan')-mean(psi2RasterNRT2MeanThird10,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar12, 'FaceColor',colour, 'EdgeColor',colour);


%% Data bars for PSi between areas
load('psiData3.mat');

colour = cellColour('Cx4');
barGroupCount = barGroupCount + 1;
barCount = barCount + 1;
bar13 = mean(psi2RasterCx4toNRT2MeanSecond,'omitnan')-mean(psi2RasterCx4toNRT2MeanThird10,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar13, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar14 = mean(psi2RasterCx4toNRT2MeanFirst,'omitnan')-mean(psi2RasterCx4toNRT2MeanSecond,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar14, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar15 = mean(psi2RasterCx4toNRT2Mean_SWDs,'omitnan')-mean(psi2RasterCx4toNRT2MeanFirst,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar15, 'FaceColor',colour, 'EdgeColor',colour);

colour = cellColour('Cx5');
barGroupCount = barGroupCount + 1;
barCount = barCount + 1;
bar16 = mean(psi2RasterCx5toNRT2MeanSecond,'omitnan')-mean(psi2RasterCx5toNRT2MeanThird10,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar16, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar17 = mean(psi2RasterCx5toNRT2MeanFirst,'omitnan')-mean(psi2RasterCx5toNRT2MeanSecond,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar17, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar18 = mean(psi2RasterCx5toNRT2Mean_SWDs,'omitnan')-mean(psi2RasterCx5toNRT2MeanFirst,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar18, 'FaceColor',colour, 'EdgeColor',colour);

colour = cellColour('NRT');
barGroupCount = barGroupCount + 1;
barCount = barCount + 1;
bar19 = mean(psi2RasterNRTtoTCMeanSecond,'omitnan')-mean(psi2RasterNRTtoTCMeanThird10,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar19, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar20 = mean(psi2RasterNRTtoTCMeanFirst,'omitnan')-mean(psi2RasterNRTtoTCMeanSecond,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar20, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar21 = mean(psi2RasterNRTtoTCMean_SWDs,'omitnan')-mean(psi2RasterNRTtoTCMeanFirst,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar21, 'FaceColor',colour, 'EdgeColor',colour);

colour = cellColour('NRT2');
barGroupCount = barGroupCount + 1;
barCount = barCount + 1;
bar22 = mean(psi2RasterNRT2toTC2MeanSecond,'omitnan')-mean(psi2RasterNRT2toTC2MeanThird10,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar22, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar23 = mean(psi2RasterNRT2toTC2MeanFirst,'omitnan')-mean(psi2RasterNRT2toTC2MeanSecond,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar23, 'FaceColor',colour, 'EdgeColor',colour);
barCount = barCount + 1;
bar24 = mean(psi2RasterNRT2toTC2Mean_SWDs,'omitnan')-mean(psi2RasterNRT2toTC2MeanFirst,'omitnan');
bar(barCount+(barGroupCount-1)*gap, bar24, 'FaceColor',colour, 'EdgeColor',colour);


%% Error bars
gaps1 = 4:4:(barGroupCount-1)*4;
bars = sort([1 1+gaps1 2 2+gaps1 3 3+gaps1]);
data = [bar1 bar2 bar3 bar4 bar5 bar6 bar7 bar8 bar9 bar10 bar11 bar12 bar13 bar14 bar15 bar16 bar17 bar18 bar19 bar20 bar21 bar22 bar23 bar24];
err = [psi2RasterCx4CI95Second psi2RasterCx4CI95Third10 psi2RasterCx4CI95_SWDs psi2RasterCx5CI95Second psi2RasterCx5CI95Third10 psi2RasterCx5CI95_SWDs...
       psi2RasterNRTCI95Second psi2RasterNRTCI95Third10 psi2RasterNRTCI95_SWDs psi2RasterNRT2CI95Second psi2RasterNRT2CI95Third10 psi2RasterNRT2CI95_SWDs...
       psi2RasterCx4toNRT2CI95Second psi2RasterCx4toNRT2CI95Third10 psi2RasterCx4toNRT2CI95_SWDs...
       psi2RasterCx5toNRT2CI95Second psi2RasterCx5toNRT2CI95Third10 psi2RasterCx5toNRT2CI95_SWDs...
       psi2RasterNRTtoTCCI95Second psi2RasterNRTtoTCCI95Third10 psi2RasterNRTtoTCCI95_SWDs...
       psi2RasterNRT2toTC2CI95Second psi2RasterNRT2toTC2CI95Third10 psi2RasterNRT2toTC2CI95_SWDs];

er = errorbar(bars,data,err(2,:),err(1,:));
er.Color = [0 0 0];
er.LineStyle = 'none';
hold off


%% Graph adjustments
ax1 = axesProperties({}, 1, 'normal', 'off', 'w', 'Arial', 50, 4/3, 2, [0.003 0.003], 'out', 'on', 'k', {}, [],...
    [gaps1 gaps1(end)+4], 'on', 'k', {''}, [-0.013 0.023], [-0.01 0 0.01 0.02]);
ax1.XTickLabel = {'Cx4','Cx5','NRT_{FO}','NRT_{HO}','Cx4-NRT_{HO}','Cx5-NRT_{HO}','TC_{FO}-NRT_{FO}','TC_{HO}-NRT_{HO}'};

label = [5 0.7];
%label = [5 7];
margin = [0.01 0.7];
width = 45-label(1)-margin(1);
height = (25.625/77.296)*45-label(2)-margin(2);
paperSize = resizeFig(gcf, ax1, width, height, label, margin, 0);
savefig(gcf, 'psiEvoCombined.fig', 'compact');
%exportFig(gcf, 'psiEvoCombined.png','-dpng','-r300', paperSize);
%exportFig(gcf, 'psiEvoCombined'.tif','-dtiffnocompression','-r300', paperSize);
exportFig(gcf, 'psiEvoCombined.eps','-depsc','-r1200', paperSize);