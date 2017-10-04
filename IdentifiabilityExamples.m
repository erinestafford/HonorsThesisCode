clear all; close all;
%% Example 1
% param_struct = ...
%     {'x', 1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example1(param_array,array_names);
% figure()
% fnEval(params, fn, array_names)
%% Example 2
% param_struct = ...
%     {'x', 1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example2(param_array,array_names);
% figure()
% fnEval(params, fn, array_names)

%% Example 3
% param_struct = ...
%     {'x', 1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example3(param_array,array_names);
% figure()
% fnEval(params, fn, array_names)

%% Example 4
% param_struct = ...
%     {'x', 1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example4(param_array,array_names);
% figure()
% fnEval(params, fn, array_names)
%% Example 5
param_struct = ...
    {'x', -1.0;
     'y', 1.0;
    }';
params = struct(param_struct{:});
array_names = param_struct(1,:);
fn= @(param_array)example5(param_array,array_names);
figure()
fnEval(params, fn, array_names)