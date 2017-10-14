clear all; close all;
set(0,'DefaultFigureWindowStyle','docked')
%% Example 1: z= x^2 + y^2
% param_struct = ...
%     {'x', 1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example1(param_array,array_names);
% fnEval(params, fn, array_names)
%% Example 2: z= (x+y)^3
% param_struct = ...
%     {'x', 1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example2(param_array,array_names);
% fnEval(params, fn, array_names)

%% Example 3 z =(x+y)^2
% param_struct = ...
%     {'x', 1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example3(param_array,array_names);
% fnEval(params, fn, array_names)

%% Example 4 z=(x*y)^2 
param_struct = ...
    {'x', 1.0;
     'y', 1.0;
    }';
params = struct(param_struct{:});
array_names = param_struct(1,:);
fn= @(param_array)example4(param_array,array_names);
fnEval(params, fn, array_names)

%% Example 5: z =x^3+y^3
% param_struct = ...
%     {'x', -1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example5(param_array,array_names);
% fnEval(params, fn, array_names)

%% Example 6 z^2 + (x- y).^3 
% param_struct = ...
%     {'x', -1.0;
%      'y', 1.0;
%      'z', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example6(param_array,array_names);
% fnEval(params, fn, array_names)