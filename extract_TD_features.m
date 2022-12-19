function feat = extract_TD_features(y, x,winsize,wininc)
% y - labels
% x - data
addpath 'C:\Users\daniyar.zhakyp\Documents\MATLAB\Capstone'
addpath 'C:\Users\daniyar.zhakyp\Documents\MATLAB\Capstone\feature functions\Time-Domain features'


thres = threshold_calculation(y, x, 0.5);
torder = 3;  % Order for Temporal Moment feature
vorder = 4; % Order for Vorder feature

aac_feat = AverageAmplitudeChange(x,winsize,wininc);
avgen_feat = AverageEnergy(x, winsize, wininc);
asm_feat = AbsoluteValueOfTheSummationOfExpRoot(x, winsize, wininc);
abss_feat = AbsoluteValueOfTheSummationOfSquareRoot(x, winsize, wininc);
card_feat = Cardinality(x, thres, winsize, wininc);
cov_feat = CoefficientOfVariation(x, winsize, wininc);
damv_feat = DifferenceAbsoluteMeanValue(x, winsize, wininc);
dasdv_feat = DifferenceAbsoluteStandardDeviationValue(x, winsize, wininc);
dvarv_feat = DifferenceVarianceValue(x, winsize, wininc);
emav_feat = EnhancedMeanAbsoluteValue(x, winsize, wininc);
ewl_feat = EnhancedWaveformLength(x, winsize, wininc);
iemg_feat= IntegratedEMG(x, winsize, wininc);
iqr_feat = InterquartileRange(x, winsize, wininc);
kurt_feat = Kurtosis(x, winsize, wininc);
lcov_feat = LogCoefficientOfVariation(x, winsize, wininc);
ld_feat = LogDetector(x, winsize, wininc);
ldamv_feat = LogDifferenceAbsoluteMeanValue(x, winsize, wininc);
ldasdv_feat = LogDifferenceAbsoluteStandardDeviationValue(x, winsize, wininc);
mfl_feat = MaximumFractalLength(x, winsize, wininc);
mad_feat = MeanAbsoluteDeviation(x, winsize, wininc);
mav_feat = MeanAbsoluteValue(x, winsize, wininc);
mavs_feat = MeanAbsoluteValueSlope(x, winsize, wininc);
msr_feat = MeanValueOfTheSquareRoot(x, winsize, wininc);
mmav1_feat = ModifiedMeanAbsoluteValue1(x, winsize, wininc);
mmav2_feat = ModifiedMeanAbsoluteValue2(x, winsize, wininc);
myop_feat = MyopulsePercentageRate(x, thres, winsize, wininc);
nzc_feat = NewZeroCrossing(x, winsize, wininc);
rms_feat = RootMeanSquare(x, winsize, wininc);
ssi_feat = SimpleSqureIntegral(x, winsize, wininc);
skew_feat = Skewness(x, winsize, wininc);
ssc_feat = SlopeSignChange(x, thres, winsize, wininc);
std_feat = StandardDeviation(x, winsize, wininc);
tkeo_feat = TeagerKaiserEnergyOperator(x, winsize, wininc);
tempmom_feat = TemporalMoment(x, torder, winsize, wininc);
var_feat = Variance(x, winsize, wininc);
varemg_feat = VarianceofEMG(x, winsize, wininc);
vorder_feat = VOrder(x, vorder, winsize, wininc);
wl_feat = WaveformLength(x, winsize, wininc);
wamp_feat = WillisonAmplitude(x,thres, winsize, wininc);
zc_feat = ZeroCrossing(x, thres, winsize, wininc);


feat = [rms_feat; mav_feat; aac_feat; avgen_feat; asm_feat; abss_feat; card_feat; cov_feat; damv_feat;
    dasdv_feat; dvarv_feat; emav_feat; ewl_feat; iemg_feat; iqr_feat; kurt_feat; lcov_feat; 
    ld_feat; ldamv_feat; ldasdv_feat; mfl_feat; mad_feat; mavs_feat; msr_feat; mmav1_feat;
    mmav2_feat; myop_feat; nzc_feat; ssi_feat; skew_feat; ssc_feat; std_feat; tkeo_feat; tempmom_feat;
    var_feat; varemg_feat; vorder_feat; wl_feat; wamp_feat; zc_feat];


end
