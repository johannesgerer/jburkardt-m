function o = spoptimget(options,name,default,flag)
% SPOPTIMGET   Get sparse grid optimization OPTIONS parameters.
%   VAL = SPOPTIMGET(OPTIONS,'NAME') extracts the value of the
%   named property from the sparse grid options structure OPTIONS,
%   returning an empty matrix if the property value is not
%   specified in OPTIONS. It is sufficient to type only the leading
%   characters that uniquely identify the property. Case is ignored
%   for property names. [] is a valid OPTIONS argument.
%   
%   VAL = SPOPTIMGET(OPTIONS,'NAME',DEFAULT) extracts the named
%   property as above, but returns VAL = DEFAULT if the named
%   property is not specified in OPTIONS. For example
%   
%       val = spoptimget(opts, 'Maximize', 'off');
%   
%   returns val = 'off' if the Maximize property is not specified in opts.
%   
%   See also SPOPTIMSET, SPCOMPSEARCH, SPFMINSEARCH, SPCGSEARCH,
%            SPMULTISTART

% Author : Andreas Klimke
% Version: 1.2
% Date   : November 13, 2006

% Change log:
% V1.2   : November 13, 2006
%          Cleaned up options.
% V1.1   : August 8, 2005
%          Added BisectGap and funTol parameters
% V1.0   : June 9, 2005
%          Initial version

% Note: SPOPTIMGET is similar in syntax and code to the options
% handling with ODEGET and ODESET of the MATLAB ODE suite by Marc
% Reichelt and Lawrence Shampine.

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

% undocumented usage for fast access with no error checking
if (nargin == 4) & isequal(flag,'fast')
   o = getknownfield(options,name,default);
   return
end

if nargin < 2
  error('Not enough input arguments.');
end
if nargin < 3
  default = [];
end

if ~isempty(options) & ~isa(options,'struct')
  error(['First argument must be an options structure created with' ...
	 ' SPOPTIMSET.']); 
end

if isempty(options)
  o = default;
  return;
end

Names = {'Minimize', 'Maximize', 'TolFun', 'TolX', ...
	 'MaxIter', 'StartPoint', 'TestCorners', 'PrevResult', ...
	 'Method', 'NumStarts', 'OptimsetOptions', 'Display'};

m = length(Names);
for k = 1:m
  names{k} = lower(Names{k});
end

lowName = lower(name);
matched = strmatch(lowName,names);
if isempty(matched)               % if no matches
  error(sprintf(['Unrecognized property name ''%s''.  ' ...
                 'See SPOPTIMSET for possibilities.'], name));
elseif length(matched) > 1
  msg = sprintf('Ambiguous property name ''%s'' ', name);
  msg = [msg '(' Names{matched}];
  for k = j(2:length(matched))'
    msg = [msg ', ' Names{matched}];
  end
  msg = sprintf('%s).', msg);
  error(msg);
end

if any(strcmp(fieldnames(options),Names{matched}))
  o = options.(Names{matched});
  if isempty(o)
    o = default;
  end
else
  o = default;
end

%-----------------------------------------------------------------------
function v = getknownfield(s, f, d)
% GETKNOWNFIELD   Get field f from struct s, or else yield default d. 

if isfield(s,f)   % s could be empty.
  v = subsref(s, struct('type','.','subs',f));
  if isempty(v)
    v = d;
  end
else
  v = d;
end
