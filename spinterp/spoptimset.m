function options = spoptimset(varargin)
% SPOPTIMSET   Create/alter sparse grid optimization OPTIONS structure.
%   OPTIONS = SPOPTIMSET('NAME1',VALUE1,'NAME2',VALUE2,...) creates an
%   options structure OPTIONS in which the named properties have
%   the specified values. Any unspecified properties have default
%   values. It is sufficient to type only the leading characters
%   that uniquely identify the property. Case is ignored for
%   property names.
%   
%   OPTIONS = SPOPTIMSET(OLDOPTS,'NAME1',VALUE1,...) alters an existing
%   options structure OLDOPTS.
%   
%   OPTIONS = SPOPTIMSET(OLDOPTS,NEWOPTS) combines an existing options
%   structure OLDOPTS with a new options structure NEWOPTS. Any new
%   properties overwrite corresponding old properties. 
%   
%   SPOPTIMSET with no input arguments displays all property names and
%   their possible values. 
%   
%   See also SPOPTIMGET, SPCOMSEARCH, SPFMINSEARCH, SPMULTISTART.
%
%
% SPOPTIMSET PROPERTIES
%
% Minimize [ {on} | off ] - Find minimizer
%	
% Maximize [ {off} | on ] - Find maximizer (searching for the
%   minimizer and the maximizer at the same time is allowed)
%
% TolX - Termination tolerance on X [ positive scalar ]
%   Default is 1e-4. Note that the tolerance on X is taken with 
%   respect to the problem being re-scaled to the unit interval in 
%   each coordinate direction. That is, for instance, a sparse grid
%   interpolant defined for the box [0, 1e6]x[0, 1e-6] with TolX 
%   = 0.1 would mean a break tolerance of 1e5 in x1 and a tolerance
%   of 1e-7 in x2-direction. TolX does not apply to SPCGSEARCH.
%
% TolFun - Termination tolerance on the function value [ positive
%   scalar {1e-6} ]  The search is terminated when the change of 
%   the function value from one iteration to the next is smaller 
%   than TolFun.
%
% MaxIter - Maximum number of allowed iterations [ integer {100} ]
%
% StartPoint [ {best} | random | dx1 vector ] - Start search from 
%   best available, random, or specified start point.
%
% TestCorners - Test the range box corner points [ on | {off} ]
%   Specifically includes the corner points of the search box as
%   potential start points of the search.
%
% PrevResult - Previous optimizer [ (d+1)x{1|2} double array ]
%   Specifies a possible best start point, such as from a previous 
%   search over a subdomain of the current search box. Format: 
%   [xoptmin;ymin xoptmax;ymax], where xoptmin and xoptmax are column
%   vectors. Depending on the contents of the Minimize and Maximize
%   fields, minima and/or maxima information should be provided.
% 
% Method - [ {spcgsearch} | {spcompsearch} | spfminsearch ] 
%   Specifies the method used by the multiple random start search
%   SPMULTISTART. SPCGSEARCH is the default for the Chebyshev grid,
%   otherwise, it is SPCOMPSEARCH.
%
% NumStarts - Number of restarts [ integer {10} ]
%   Parameter to the multiple random start method SPMULTISTART. The
%   following points are considered : (best) + (NumStarts - 1
%   random points). 
%
% OptimsetOptions - Add options structure obtained with OPTIMSET to
%   the SPOPTIMSET structure. [ struct {[]} ]
%   This feature is useful if additional configuration of the 
%   Matlab fminsearch algorithm used by spfminsearch is required
%   beyond the parameters available through spoptimset.
%   Example: 
%     options = spoptimset('Optimset', optimset('FunValCheck','on'));
%
% Display - Display options [ {off} | iter ]
%   Optionally, displays information at each iteration. 

% Author : Andreas Klimke
% Version: 1.2
% Date   : November 13, 2006
	
% Change log:
% V1.2   : November 13, 2006
%          Cleaned up description, added Display option.
% V1.1   : August 8, 2005
%          Added TolFun parameters
% V1.0   : June 09, 2005
%          Initial release
	
% Note: SPOTIMSET is similar in syntax and code the the options
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

% Print out possible values of properties.
if (nargin == 0) & (nargout == 0)
  fprintf('          Minimize: [ {on} | off ]\n');
  fprintf('          Maximize: [ on | {off} ]\n');
  fprintf('            TolFun: [ positive scalar {1e-6} ]\n');
  fprintf('              TolX: [ positive scalar {1e-4} ]\n');
  fprintf('           MaxIter: [ positive integer {1000} ]\n');
  fprintf('        StartPoint: [ {best} | random | dx1 vector ]\n');
  fprintf('       TestCorners: [ on | {off} ]\n');
  fprintf('        PrevResult: [ double matrix {[]} ]\n');
  fprintf('            Method: [ string ]\n');
  fprintf('         NumStarts: [ positive integer {10} ]\n');
  fprintf('   OptimsetOptions: [ struct {[]} ]\n');
  fprintf('           Display: [ {off} | iter ]\n');
  fprintf('\n');
  return;
end

Names = {'Minimize', 'Maximize', 'TolFun', 'TolX', ...
	 'MaxIter', 'StartPoint', 'TestCorners', 'PrevResult', ...
	 'Method', 'NumStarts', 'OptimsetOptions', 'Display'};

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
		     ' SPOPTIMSET.'], k));  
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
