function main()
% get start time
dateTime = datestr(now)
fprintf('Starting %s: %s\n', mfilename, dateTime);
% add src 2 path
currentDir = pwd;
addpath( genpath( [currentDir '/src'] ) );
% make Output Directories
if ~exist('output', 'dir'); 
  mkdir('./output'); 
end
% get job's run params
if exist('initParams.m','file') == 0
  cpParams();
end
myParams = initParams();
fprintf('Initial params: \n')
disp(myParams)
% add var1 and var2 
myOutput.o1 = add2numbers(myParams.var1, myParams.var2);
% concatentae to strs
myOutput.o2 = concat2strs(myParams.cell1{1}, myParams.cell1{2});
% add noise to an array
myOutput.o3 = addnoise2array(myParams.cell1{3});
fprintf('Built output\n')
disp(myOutput)
% Save it to a file
outStr = [dateTime '_output.mat']
save(outStr, 'myOutput')
fprintf('Saved file as: %s', outStr)
% move file
movefile(outStr, 'src')
