function b = addnoise2array(a)
% b = addnoise2array(a)
% Add random noise to an array
%
% Inputs:
% a (array)
%   Array to add noise to
%
% Outputs:
% b (array)
%   Array with added noise

b = a + rand(size(a));
