function options = spset(varargin)
% SPSET   Create/alter sparse interpolation OPTIONS structure
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
% GridType - Sparse grid type and basis functions to use 
%   [ {Clenshaw-Curtis} | Maximum | NoBoundary | Chebyshev |
%   Gauss-Patterson ]. For an illustration of  the grid types, 
%   run CMPGRIDS.
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
%   compute. The maximum supported depth (and the default) is 6
%   for the Gauss-Patterson grid.
%
% VariablePositions - Position of the ranges to interpolate in the
%   argument list when FUN is evaluated. [ 1xD vector {[]} ] 
%   By setting VariablePositions, SPVALS will evaluate FUN with respect
%   to some of its input parameters, but not necessarily the first
%   D ones. With VARPOS, the actual position of each variable may
%   be set. VARPOS must be a 1xD array.
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
%   If this parameter is set, a structure field 'fvals' is
%   returned, containing a cell array with the function values at
%   the sparse grid points.
%
% KeepGrid - Keep the sparse grid points [ {off} | on ]
%   If this parameter is set, a structure field 'grid' is
%   returned, containing a cell array with the the sparse grid
%   points. 
%
% DimensionAdaptive - Set dimension adaptivity option [ {off} | on ]
%   Dimension-adaptive grids try to adaptively find important
%   dimensions and adjust the sparse grid structure
%   accordingly. The implementation of dimension-adaptive sparse
%   grids follows the approach by Gerstner/Griebel.
%
% MinPoints - Minimum number of support nodes [ integer {100} ]
%   This parameter only applies to dimension-adaptive sparse grids,
%   and indicates the minimum number of support nodes
%   (i.e. function evaluations to perform).
%
% MaxPoints - Maximum number of support nodes [ integer {10000} ]
%   This parameter only applies to dimension-adaptive sparse grids.
%   The dimension-adaptive algorithm is aborted once the function
%   evaluation count exceeds this number.
%
% DimadaptDegree - Fine-tuning parameter to alter the degree of
%   dimension-adaptivity [ positive scalar {0.9} ]. A value of 1
%   places complete emphasis on the error estimates, and thus leads
%   to "greedy" dimension-adaptivity. A value of 0 disregards the
%   error estimates, and constructs a conventional sparse grid
%   based on the amount of work involved. 
%
% DegreeStrategy - [ {balancing} | depth ] Strategy for the degree
%   of dimensional adaptivity. 
%   The 'balancing' strategy balances the number of grid points 
%   generated according to the greedy, error estimate-based refine-
%   ment rule compared to the number of points generated by the 
%   conventional (regular) sparse grid refinement rule. I.e., a 
%   DimadaptDegree value of 0.9 would mean that around 90% of the 
%   grid points are generated by the error estimate-based rule, and
%   the remaining points are selected according to the regular 
%   rule.
%   The 'depth' strategy makes sure that the maximum level depth
%   reached by the error estimate-based refinement in one dimension
%   does not get too deep compared to the depth reached in the other
%   dimensions. This measurement degree strategy is the one used 
%   prior to version 5.1.0 of the toolbox, and is described on page
%   61 of A. Klimke, "Uncertainty modeling using fuzzy arithmetic 
%   and sparse grids". This approach is still supported but no 
%   the default strategy.
%
% SparseIndices - [ {auto} | on | off ] Manually turn the efficient
%   sparse storage scheme (new feature since version 3.0) of the 
%   multi-index arrays on or off. The default switch auto uses the
%   new scheme for the ClenshawCurtis and the Chebyshev grid, and 
%   the old (full) storage scheme from version 2.x for the Maximum 
%   and the NoBoundary grid (the sparse grid storage scheme is not
%   supported for these two grid types).
%
% DropTol - Drop tolerance [ {auto} | off | 1x2 double vector ]
%   During the sparse grid construction progress, the spvals 
%   algorithm may add subgrids with hierarchical surpluses that are 
%   all close to zero or of negligible magnitude compared to the 
%   surpluses of other sub-grids. In particular, this occurs when
%   additive structure is present in the objective function. 
%   To increase the performance of the spinterp algorithm, 
%   subgrids where all (absolute) hierarchical surpluses are less 
%   than max(relDropTol*(max(fevalRange)-min(fevalRange),absDropTol))
%   can be omitted from the interpolation process by running the
%   sppurge algoritm (see help sppurge).
%   You may specify the absolute and the relative drop tolerance 
%   as a vector [ absDropTol, relDropTol ], or turn it off completely
%   (= behavior of version 3.0 and earlier). The switch 'auto' uses 
%   the values absDropTol = 0, relDropTol = 100*eps, that is, by 
%   default, only a relative drop tolerance is used.
%
% EnableDCT - [ {on} | off ]  Use the DCT when constructing the
%   Chebyshev-Gauss-Lobatto type sparse grid. 

% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.9
% Date   : November 18, 2007
	
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
% V1.4   : Apr 22, 2004
%          Added options for dimension-adaptive sparse grids.
% V1.5   : Feb 22, 2005
%          Added handling of sparse sets of indices (useful for
%          high-dimensional interpolation)
% V1.6   : January 13, 2006
%          Added documentation of SparseIndices property
% V1.7   : February 2, 2006
%          Added DropTol property
% V1.8   : March 1, 2006
%          Added DCT feature
% V1.9   : November 18, 2007
%          Added new grid type : Gauss-Patterson
% V2.0   : January 20, 2007
%          Added new parameter for dimensional adaptivity degree
%          strategy.

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

% Note: SPSET is similar in syntax and code the the options
% handling with ODEGET and ODESET of the MATLAB ODE suite by Marc
% Reichelt and Lawrence Shampine.

% Print out possible values of properties.
if (nargin == 0) && (nargout == 0)
  fprintf(['          GridType: [ {Clenshaw-Curtis} | Maximum |' ...
					 ' NoBoundary | Chebyshev | Gauss-Patterson ]\n']);
  fprintf('            RelTol: [ positive scalar {1e-2} ]\n');
  fprintf('            AbsTol: [ positive scalar {1e-6} ]\n');
  fprintf('        Vectorized: [ {off} | on ]\n');
	fprintf('          MinDepth: [ positive integer {2} ]\n');
	fprintf('          MaxDepth: [ positive integer {8} ] (6 for Gauss-Patt.)\n');
  fprintf(' VariablePositions: [ double matrix {[]} ]\n');
  fprintf('   NumberOfOutputs: [ positive integer {1} ]\n');
  fprintf('       PrevResults: [ struct {[]} ]\n');
	fprintf('   FunctionArgType: [ {list} | vector ]\n');
	fprintf('KeepFunctionValues: [ {off} | on ]\n');
	fprintf('          KeepGrid: [ {off} | on ]\n');
	fprintf(' DimensionAdaptive: [ {off} | on ]\n');
	fprintf('         MinPoints: [ positive integer {100} ]\n');
	fprintf('         MaxPoints: [ positive integer {10000} ]\n');
	fprintf('    DimadaptDegree: [ positive scalar in [0,1] {0.9} ]\n');
	fprintf('    DegreeStrategy: [ {balancing} | depth ]\n');
	fprintf('     SparseIndices: [ {auto} | on | off ]\n');
	fprintf(['           DropTol: [ {auto} | off |' ...
					 ' [absTol, relTol] (pos. scalars)]\n']);
	fprintf('         EnableDCT: [ {on} | off ]\n');
  fprintf('\n');
  return;
end

Names = {'GridType', 'RelTol', 'AbsTol', 'Vectorized', 'MinDepth', ...
				 'MaxDepth', 'VariablePositions', 'NumberOfOutputs', ...
				 'PrevResults', 'FunctionArgType', 'KeepFunctionValues', ...
				 'KeepGrid', 'DimensionAdaptive', 'MinPoints', ...
				 'MaxPoints', 'DimadaptDegree', 'DegreeStrategy', ...
				 'SparseIndices', 'DropTol', 'EnableDCT'};


m = length(Names);
names = cell(m,1);
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
      msg = sprintf(['Expected argument %d to be a string property' ...
										 ' name or an options structure\ncreated with' ...
										 ' SPSET.'], k);
      error(msg);  
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
    if ~ischar(arg)
      msg = sprintf(['Expected argument %d to be a string property' ...
										 ' name.'], k);
      error(msg); 
    end
    lowArg = lower(arg);
    matched = strmatch(lowArg,names);
    if isempty(matched)
      msg = sprintf('Unrecognized property name ''%s''.', arg);
      error(msg);
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
  msg = sprintf('Expected value for property ''%s''.', arg);
  error(msg);
end
