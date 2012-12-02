function [xopt,fval,exitflag,output] = spmultistart(z, xbox, options)
% SPMULTISTART  Multiple random start optimization method for
% sparse grid interpolants.
%    X = SPMULTISTART(Z)  Attemps to find a global optimizer X of the
%    sparse grid interpolant Z by performing multiple local searches 
%    starting from random start points. The entire range of the
%    sparse grid interpolant is searched. Using the default settings,
%    the first start point is not random but the best available sparse
%    grid point. By default, SPCOMPSEARCH is used for the local
%    searches if the grid type is not Chebyshev. If it is, SPCGSEARCH
%    is used. 
%
%    X = SPMULTISTART(Z, XBOX)  Uses the search box XBOX, X = [a1,
%    b1; a2, b2; ...]. The size of search box XBOX must be smaller 
%    than or equal to the range of the interpolant.
%
%    X = SPMULTISTART(Z, XBOX, OPTIONS)  Additionally, an
%    OPTIONS structure can be provided, created with SPOPTIMSET.
%    For instance, the local optimization method (e.g. SPFMINSEARCH)
%    used can be selected.
%
%    [X,FVAL] = SPMULTISTART(...)  returns the value of the 
%    sparse grid interpolant at X.
%
%    [X,FVAL,EXITFLAG] = SPMULTISTART(...)  returns a EXITFLAG 
%    that describes the exit condition of SPCOMPSEARCH. Possible
%    values of EXITFLAG and the corresponding exit conditions are
%
%     1  SPMULTISTART converged to at least one solution X.
%     0  Maximum number of function evaluations or iterations 
%        reached for all local searches.
%
%    [X,FVAL,EXITFLAG,OUTPUT] = SPMULTISTART(...) returns a 
%    structure OUTPUT with the following information:
%     .time         : Total computing time in s.
%     .allResults   : Cell array of all local search results.
%
%   Example:
%      f = inline(['(5/pi*x-5.1/(4*pi^2)*x.^2+y-6).^2 +' ...
%                  '10*(1-1/(8*pi))*cos(x)+10']); 
%      range = [-5 10; 0 15];
%      options = spset('keepFunctionValues','on', ...
%                      'GridType', 'Chebyshev', ...
%                      'DimensionAdaptive', 'on', ...
%                      'DimAdaptDegree', 1, ...
%                      'MinPoints', 10);
%      z = spvals(f, 2, range, options);
%      [xopt, fval] = spmultistart(z)
%
%    See also SPOPTIMSET.
 
% Author : Andreas Klimke, Universität Stuttgart
% Version: 1.0
% Date   : September 1, 2007

% Change log:
% V1.0   : September 1, 2007
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
	
if nargin < 2, xbox = []; end
if nargin < 3, options = []; end
	
d = z.d;

% In case that no range has been provided to spvals -> set it to
% [0,1]^d. 
if isempty(z.range)
	z.range = [zeros(d,1) ones(d,1)];
end
if isempty(xbox)
	xbox = z.range;
end

minimize = spoptimget(options, 'Minimize', 'on');
maximize = spoptimget(options, 'Maximize', 'off');

isminimize = 0; ismaximize = 0;
xoptmin = []; xoptmax = [];
ymin = []; ymax = [];
if strcmpi(minimize, 'on'), isminimize = 1; end
if strcmpi(maximize, 'on'), ismaximize = 1; end

switch(lower(z.gridType))
 case {'maximum', 'noboundary', 'clenshaw-curtis', 'gauss-patterson'}
  method = spoptimget(options, 'Method', 'spcompsearch');
 case {'chebyshev'}
  method = spoptimget(options, 'Method', 'spcgsearch');
 otherwise
		error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

dispopt = spoptimget(options, 'Display', 'off');

d = z.d;

% By default, do multiple optimizations from best and from random
% start points.
snum = spoptimget(options, 'NumStarts', 10);

if isminimize
	xminvec = zeros(d,snum);
	yminvec = zeros(1,snum);
end
if ismaximize
	xmaxvec = zeros(d,snum);
	ymaxvec = zeros(1,snum);
end

xopt = [];
ymin = [];
ymax = [];
exitflag = [];

if nargout == 4
	allResults.x = [];
	allResults.fval = [];
	allResults.exitflag = [];
	allResults.output = {};
end

for k = 1:snum
	if k == 1
		options.StartPoint = 'best';
	else
		options.StartPoint = 'random';
	end
	if nargout == 4
		[xopt, fval, tmpexitflag, tmpoutput] = feval(method, z, xbox, options);
		allResults.x = [allResults.x xopt];
		allResults.fval = [allResults.fval fval];
		allResults.exitflag = [allResults.exitflag tmpexitflag];
		allResults.output = [allResults.output tmpoutput];
	else
		[xopt, fval, tmpexitflag] = feval(method, z, xbox, options);
	end
	if isempty(exitflag)
	  exitflag = tmpexitflag;
	else 
	  exitflag = max(exitflag,tmpexitflag);
	end
	
	s = 1;
	if isminimize
		xminvec(:,k) = xopt(:,1);
		yminvec(k) = fval(1);
		s = 2;
	end
	if ismaximize
		xmaxvec(:,k) = xopt(:,s);
		ymaxvec(k) = fval(s);
	end
end

xopt = [];
if isminimize
	[ymin, id] = min(yminvec);
	xopt = xminvec(:,id);
end
if ismaximize
	[ymax, id] = max(ymaxvec);
	xopt = [xopt xmaxvec(:,id)];
end
fval = [ymin ymax];

if nargout == 4
	output.time = etime(clock, t0);
	output.allResults = allResults;
end
