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

%% Example 3 z =(1-(x+y))^2
param_struct = ...
    {'x', 1.0;
     'y', 1.0;
    }';
params = struct(param_struct{:});
array_names = param_struct(1,:);
fn= @(param_array)example3(param_array,array_names);
fnEval(params, fn, array_names)

%% Example 4 z=(x*y)^2 
% param_struct = ...
%     {'x', 1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example4(param_array,array_names);
% fnEval(params, fn, array_names)

%% Example 5: z =x^3+y^3
% param_struct = ...
%     {'x', -1.0;
%      'y', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example5(param_array,array_names);
% fnEval(params, fn, array_names)

%% Example 6 z^2 + (x- y)^3 
% param_struct = ...
%     {'x', -1.0;
%      'y', 1.0;
%      'z', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example6(param_array,array_names);
% fnEval(params, fn, array_names)

%% Example 7 f(x,y,z) = (2-x+2y)^2 + (x-3z)^2 
% param_struct = ...
%     {'x', -1.0;
%      'y', 1.0;
%      'z', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example8(param_array,array_names);
% fnEval(params, fn, array_names)

%% Example 8 f(x,y,z)=(1+ x + 2y + 3z)^2 
% param_struct = ...
%     {'x', -1.0;
%      'y', 1.0;
%      'z', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example9(param_array,array_names);
% fnEval(params, fn, array_names)

%% Example 9 f(x,y,z) = (xy-1)^2 + z^2
% param_struct = ...
%     {'x', -1.0;
%      'y', 1.0;
%      'z', 1.0;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% fn= @(param_array)example10(param_array,array_names);
% fnEval(params, fn, array_names)

%% Example 10 spring ODE
% param_struct = ...
%     {'m', 1.5;
%      'k', 3;
%      'mu', 1;
%     }';
% params = struct(param_struct{:});
% array_names = param_struct(1,:);
% init_cond = [10,20];
% fn= @(t,y,p)ODEexample2(t,y,p, array_names);
% obj_fn = @(base_val,fn, params)obj_fn_spring(base_val,fn, params);
% fnEvalODE(params, fn, array_names, init_cond, obj_fn)
%% Example 11 y' = (a+2b)y
param_struct = ...
    {'a', 0;
     'b', -1;
    }';
params = struct(param_struct{:});
array_names = param_struct(1,:);
y = [0:1:10];
data_to_fit = -2.*y;
fn= @(t,y,p)ODEexample3(t,y,p, array_names);
obj_fn = @(fn, params)obj_fn(data_to_fit,fn, params);
fnEvalODE(params, fn, array_names, y, obj_fn)

