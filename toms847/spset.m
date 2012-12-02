function options = spset(varargin)
% SPSET   Create/alter sparse interpolation OPTIONS structure.
%   OPTIONS = SPSET('NAME1',VALUE1,'NAME2',VALUE2,...) creates an
%   options structure OPTIONS in which the named properties have
%   the specified values. Any unspecified properties have default
%   values. It is sufficient to type only the leading characters
%   that uniquely identify the property. Case is ignored for
%   property names.  
%   
%   OPTIONS = SPSET(OLDOPTS,'NAME1',VALUE1,...) alters an existing
%   options structure OLDOPTS.
%   
%   OPTIONS = SPSET(OLDOPTS,NEWOPTS) combines an existing options
%   structure OLDOPTS with a new options structure NEWOPTS. Any new
%   properties overwrite corresponding old properties. 
%   
%   SPSET with no input arguments displays all property names and
%   their possible values. 
%   
%   See also SPGET, SPINTERP, SPVALS.
%
%
% SPSET PROPERTIES
%
% GridType - String [ {Clenshaw-Curtis} | Maximum | NoBoundary ]
%   Type of grid to be used. Run CMPGRIDS to see the different
%   distributions of the nodes.
%
% RelTol - Relative error tolerance [ positive scalar {1e-2} ]
%   A relative error tolerance that applies to all hierarchical
%   surpluses of the sparse grid representation. The grid is
%   further refined until all hierarchical surpluses are less than
%   max(RelTol*(max(fevalRange)-min(fevalRange)),AbsTol), with
%   fevalRange containing all results evaluating FUN up to
%   that point. 
% 
% AbsTol - Absolute error tolerance [ positive scalar {1e-6} ]
%   Used by the error control stated under RelTol.
%
% Vectorized - Vectorized function FUN [ on | {off} ]
%   Indicates if FUN is available for vectorized evaluation.  
%   Vectorized coding of FUN can significantly reduce the
%   computation time used by SPVALS. For an example using a
%   vectorized function, please see SPDEMO.
%
% MinDepth - Minimum interpolation depth [ integer {2} ]
%   Minimum number of hierarchical interpolation levels n to
%   compute. 
%
% MaxDepth - Maximum interpolation depth [ integer {8} ]
%   Maximum number of hierarchical interpolation levels n to
%   compute. 
%
% VariablePositions - Position of the ranges to interpolate in the
%    argument list when FUN is evaluated. [ 1xD vector {[]} ] 
%    By setting VariablePositions, SPVALS will evaluate FUN with respect
%    to some of its input parameters, but not necessarily the first
%    D ones. With VARPOS, the actual position of each variable may
%    be set. VARPOS must be a 1xD array.
% 
% NumberOfOutputs - Number of outputs [ integer {1} ]
%   If FUN produces multiple outputs (all must be scalar), indicate
%   this here to perform the sparse grid computation for many
%   output variables at once. Also see the example SPDEMOVAROUT.
%
% PrevResults - Previous sparse grid representation [ struct {[]} ]
%   An existing result structure obtained from SPVALS may be
%   provided to further refine an existing sparse grid.
%
% FunctionArgType - Function argument type [ {list} | vector ]
%   Indicates whether the objective function takes the input
%   parameters as a comma-separated list (default) or as a vector.
%
% KeepFunctionValues - Keep the function evaluations [ {off} | on ]
%	  If this parameter is set, a structure field 'fvals' is
%	  returned, containing a cell array with the function values at
%	  the sparse grid points.
%
% KeepGrid - Keep the sparse grid points [ {off} | on ]
%	  If this parameter is set, a structure field 'grid' is
%	  returned, containing a cell array with the the sparse grid
%	  points. 
		
% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.3
% Date   : Jan 08, 2004
	
% Change log:
% V1.0   : Sep 23, 2003
%          Initial release
% V1.1   : Dec 23, 2003
%          Added FunctionArgType handling for more flexibility in
%          defining the objective function.
% V1.2   : Jan 07, 2004
%          Added KeepFunctionValues property to allow the user to
%          access the function values at the sparse grid points.
% V1.3   : Jan 08, 2004
%          Added KeepGrid property to allow the user to access the
%          sparse grid points.
	
% Note: SPSET is similar in syntax and code the the options
% handling with ODEGET and ODESET of the MATLAB ODE suite by Marc
% Reichelt and Lawrence Shampine.

% Print out possible values of properties.
if (nargin == 0) & (nargout == 0)
  fprintf(['          GridType: [ {Clenshaw-Curtis} | Maximum |' ...
					 ' NoBoundary ]\n']);
  fprintf('            RelTol: [ positive scalar {1e-2} ]\n');
  fprintf('            AbsTol: [ positive scalar {1e-6} ]\n');
  fprintf('        Vectorized: [ on | {off} ]\n');
	fprintf('          MinDepth: [ positive integer {2} ]\n');
	fprintf('          MaxDepth: [ positive integer {8} ]\n');
  fprintf(' VariablePositions: [ double matrix {[]} ]\n');
  fprintf('   NumberOfOutputs: [ positive integer {1} ]\n');
  fprintf('       PrevResults: [ struct {[]} ]\n');
	fprintf('   FunctionArgType: [ {list} | vector ]\n');
	fprintf('KeepFunctionValues: [ {off} | on ]\n');
	fprintf('          KeepGrid: [ {off} | on ]\n');
  fprintf('\n');
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

% Combine all leading options structures o1, o2, ... in odeset(o1,o2,...).
options = [];
for k = 1:m
  options.(Names{k}) = [];
end

k = 1;
while k <= nargin
  arg = varargin{k};
  if ischar(arg)                        % arg is an option name
    break;
  end
  if ~isempty(arg)                      % [] is a valid options argument
    if ~isa(arg,'struct')
      error(sprintf(['Expected argument %d to be a string property' ...
										 ' name or an options structure\ncreated with' ...
										 ' SPSET.'], k));  
    end
    for l = 1:m
      if any(strcmp(fieldnames(arg),Names{l}))
        val = arg.(Names{l});
      else
        val = [];
      end
      if ~isempty(val)
        options.(Names{l}) = val;
      end
    end
		k = k + 1;
  else
		k = k + 1;
		break;
	end
end

% now process the name-value pairs.
if rem(nargin-k+1,2) ~= 0
  error('Arguments must occur in name-value pairs.');
end

expectval = 0;                      % start expecting a name, not a
                                    % value
while k <= nargin
  arg = varargin{k};
    
  if ~expectval
    if ~isstr(arg)
      error(sprintf(['Expected argument %d to be a string property' ...
										 ' name.'], k)); 
    end
    
    lowArg = lower(arg);
    matched = strmatch(lowArg,names);
    if isempty(matched)                
      error(sprintf('Unrecognized property name ''%s''.', arg));
    elseif length(matched) > 1            
			msg = sprintf('Ambiguous property name ''%s'' ', arg);
			msg = [msg '(' Names{matched(1)}];
			for l = matched(2:length(matched))'
				msg = [msg ', ' Names{l}];
			end
			msg = sprintf('%s).', msg);
			error(msg);
		end
    expectval = 1;                      % we expect a value next
    
  else
    options.(Names{matched}) = arg;
    expectval = 0;
      
  end
  k = k + 1;
end

if expectval
  error(sprintf('Expected value for property ''%s''.', arg));
end
