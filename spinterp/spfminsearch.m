function [xopt,fval,exitflag,output] = spfminsearch(z, xbox, options)
% SPFMINSEARCH Optimization of sparse grids using FMINSEARCH.  
%    X = SPFMINSEARCH(Z) starts search at the best available
%    sparse grid point and attempts to find a local optimizer of the
%    sparse grid interpolant Z. The entire range of the sparse
%    grid interpolant is searched.
%
%    X = SPFMINSEARCH(Z,XBOX) attempts to find a local optimizer.
%    in the search box XBOX. The size of search box XBOX must be
%    smaller or equal to the range of the interpolant.
%
%    X = SPFMINSEARCH(Z,XBOX,OPTIONS)  optimizes with the default
%    optimization parameters replaced by values in the structure
%    OPTIONS, created with the SPOPTIMSET function.  See SPOPTIMSET
%    for details.
%
%    [X,FVAL] = SPFMINSEARCH(...)  returns the value of the 
%    objective function, described in FUN, at X.
%
%    [X,FVAL,EXITFLAG] = SPFMINSEARCH(...)  returns an EXITFLAG 
%    that describes the exit condition of SPFMINSEARCH. Possible
%    values of EXITFLAG and the corresponding exit conditions are
%
%     1  SPFMINSEARCH converged to a solution X.
%     0  Maximum number of function evaluations or iterations
%        reached.
%
%    [X,FVAL,EXITFLAG,OUTPUT] = SPFMINSEARCH(...) returns a 
%    structure OUTPUT with the number of function evaluations in 
%    OUTPUT.nFevals, and the computing time in OUTPUT.time.
%    The OUTPUT result from the FMINSEARCH call are returned
%    as OUTPUT.fminsearchOutput. 
%
%    Example: (minimizing the three-hump camel-back function)
%      f = inline('12*x.^2-6.3*x.^4+x.^6+6*y*(y-x)');
%      range = [-3 3; -3 3];
%      options = spset('keepFunctionValues','on', ...
%                      'GridType', 'Chebyshev', ...
%                      'DimensionAdaptive', 'on', ...
%                      'DimAdaptDegree', 1, ...
%                      'MinPoints', 10);
%      z = spvals(f, 2, range, options)
%      [xopt, fval] = spfminsearch(z)
%
%    See also SPOPTIMSET, FMINSEARCH.

% Author : Andreas Klimke
% Version: 1.1
% Date   : June 8, 2005

% Change log:
% V1.1   : September 8, 2006
%          Added example, added exitflag, added output from
%          fminsearch, removed obsolete code segments.
% V1.0   : June 8, 2005
%          Initial version.
	
% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

t0 = clock;

if nargin < 2, xbox = []; end;
if nargin < 3, options = []; end;

d = z.d;

% In case that no range has been provided to spvals -> set it to
% [0,1]^d. 
if isempty(z.range)
	z.range = [zeros(d,1) ones(d,1)];
end
if isempty(xbox)
	xbox = z.range;
end

% Add the Optimset options to the options structure if there are
% any.
fnames = [];
optimOptions = spoptimget(options, 'OptimsetOptions', []);
if ~isempty(optimOptions) 
	fnames = fieldnames(optimOptions);
end
for k = 1:length(fnames)
	% We only add the field if it is not there yet. This means that
	% The fields from spoptimsget have precedence.
	if ~isfield(options, fnames{k})
		options = setfield(options, fnames{k}, ...
		  getfield(optimOptions, fnames{k}));
	end
end

% Determine optimization start point(s)
[xopt, fval] = spgetstartpoint(z, xbox, options);
minimize = spoptimget(options, 'Minimize', 'on');
maximize = spoptimget(options, 'Maximize', 'off');

if strcmpi(minimize, 'on'), isminimize = 1; else isminimize = 0; end
if strcmpi(maximize, 'on'), ismaximize = 1; else ismaximize = 0; end

xmin = []; xmax = [];
ymin = []; ymax = [];
exitflagmin = []; exitflagmax = [];
outputmin = []; outputmax = [];

nfevals = 0;
if isminimize
	[xmin,ymin,exitflagmin,outputmin] = ...
			fminsearch(@fun, xopt(:,1), options, z, xbox, 0);
	nfevals = outputmin.funcCount;
end
if ismaximize
	k = 1; if isminimize, k = 2; end
	[xmax,ymax,exitflagmax,outputmax] = ...
			fminsearch(@fun, xopt(:,k), options, z, xbox, 1);
	nfevals = nfevals + outputmax.funcCount;
end

xopt = [xmin, xmax];
fval = [ymin, -ymax];
exitflag = [exitflagmin, exitflagmax];

if nargout == 4
	output.nFEvals = nfevals;
	output.time = etime(clock, t0);
  output.fminsearchOutput = [outputmin, outputmax];
end

% -----------------------------------------------------------------
function f = fun(x, z, xbox, mode)

% MODE = 0: minimize; MODE = 1: maximize;
if isfield(z, 'selectOutput')
	output = z.selectOutput;
else
	output = 1;
end

xtemp = num2cell(min(max(x,xbox(:,1)),xbox(:,2))');
if mode == 0
	f = spinterp(z, xtemp{:});
else
	f = -spinterp(z, xtemp{:});
end

% For values outside of the search box, penalize the
% result. 
d = z.d;
fevalWidth = z.fevalRange(output,2) - z.fevalRange(output,1);
for l = 1:d
	if x(l) < xbox(l,1)
		f = f + (xbox(l,1) - x(l)).^2 * fevalWidth;
	elseif x(l) > xbox(l,2)
		f = f + (x(l) - xbox(l,2)).^2 * fevalWidth;
	end
end
