function o = spget(options,name,default,flag)
% SPGET   Get sparse interpolation OPTIONS parameters.
%   VAL = SPGET(OPTIONS,'NAME') extracts the value of the named property
%   from the sparse grid options structure OPTIONS, returning an
%   empty matrix if the property value is not specified in
%   OPTIONS. It is sufficient to type only the leading characters
%   that uniquely identify the property. Case is ignored for
%   property names. [] is a valid OPTIONS argument.
%   
%   VAL = SPGET(OPTIONS,'NAME',DEFAULT) extracts the named property as
%   above, but returns VAL = DEFAULT if the named property is not
%   specified in OPTIONS. For example
%   
%       val = spget(opts,'RelTol',1e-2);
%   
%   returns val = 1e-2 if the RelTol property is not specified in opts.
%   
%   See also SPSET, SPINTERP, SPVALS.

% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.1
% Date   : January 27, 2004

% Change log:
% V1.0    : September 23, 2003
%           Initial version
% V1.1    : January 27, 2004
%           Added "KeepGrid" and "KeepFunctionValues" options for
%           later use. 

% Note: SPGET is similar in syntax and code to the options
% handling with ODEGET and ODESET of the MATLAB ODE suite by Marc
% Reichelt and Lawrence Shampine.

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
  error('First argument must be an options structure created with SPSET.');
end

if isempty(options)
  o = default;
  return;
end

Names = {'GridType', 'RelTol', 'AbsTol', 'Vectorized', 'MinDepth', ...
				 'MaxDepth', 'VariablePositions', 'NumberOfOutputs', ...
				 'PrevResults', 'FunctionArgType', 'KeepFunctionValues', ...
				 'KeepGrid'};

m = length(Names);
for k = 1:m
	names{k} = lower(Names{k});
end

lowName = lower(name);
matched = strmatch(lowName,names);
if isempty(matched)               % if no matches
  error(sprintf(['Unrecognized property name ''%s''.  ' ...
                 'See SPSET for possibilities.'], name));
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

% --------------------------------------------------------------------------
function v = getknownfield(s, f, d)
% GETKNOWNFIELD   Get field f from struct s, or else yield default
% d. 

if isfield(s,f)   % s could be empty.
  v = subsref(s, struct('type','.','subs',f));
  if isempty(v)
    v = d;
  end
else
  v = d;
end
