function myParams = initParams()
% This a parameter config file called by main(). 
% The initParams.m is not git tracked, but 
% src/initParamsTemplate.m is. It's nice to
% have a template for your parameter inputs, but
% it's annoying to git track the parameter file you are 
% constantly changing

% put the parameters in structure
% var 1 (float/integer)
myParams.runID = 'an_example';
% var 1 (float/integer)
myParams.var1 = 1;
% var 2 (float/integer)
myParams.var2 = 2;
% cell 2 (cell = {str, str, array})
myParams.cell1 = {'hello', 'world', [1, 2, 3]};
