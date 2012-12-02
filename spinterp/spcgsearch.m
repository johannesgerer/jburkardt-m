function [xopt,fval,exitflag,output] = spcgsearch(z, xbox, options)
% SPCGSEARCH  Optimizes the sparse grid interpolant using the CG 
%    method.
%    X = SPCGSEARCH(Z) Starts search at the best available
%    sparse grid point and attempts to find a local minimizer of the
%    sparse grid interpolant Z. The entire range of the sparse
%    grid interpolant is searched.
%
%    X = SPCGSEARCH(Z,XBOX)  Uses the search box XBOX = [a1,
%    b1; a2, b2; ...]. The size of search box XBOX must be smaller 
%    than or equal to the range of the interpolant.
%
%    X = SPCGSEARCH(Z,XBOX,OPTIONS)  Minimizes with the default
%    optimization parameters replaced by values in the structure
%    OPTIONS, created with the SPOPTIMSET function.  See SPOPTIMSET
%    for details.
%
%    [X,FVAL] = SPCGSEARCH(...)  Returns the value of the 
%    sparse grid interpolant at X.
%
%    [X,FVAL,EXITFLAG] = SPCGSEARCH(...)  Returns an EXITFLAG 
%    that describes the exit condition of SPCGSEARCH. Possible
%    values of EXITFLAG and the corresponding exit conditions are
%
%    1  SPCGSEARCH converged to a solution X.
%    0  Maximum number of function evaluations or iterations
%       reached.
%
%    [X,FVAL,EXITFLAG,OUTPUT] = SPCGSEARCH(...) Returns a 
%    structure OUTPUT with the number of function evaluations in 
%    OUTPUT.nFEvals, the number of gradients in .nGradEvals,
%    and the computing time in .time.
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
%      [xopt, fval] = spcgsearch(z)
%
%    See also SPOPTIMSET.
	
% Author : Andreas Klimke
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
range = z.range;
if isempty(range)
	range = [zeros(d,1) ones(d,1)];
end
if isempty(xbox)
	xbox = range;
end

% Break if maximize is set; not yet supported.
maximize = spoptimget(options, 'Maximize', 'off');
minimize = spoptimget(options, 'Minimize', 'on');
if strcmpi(maximize, 'on')
  warning('MATLAB:spinterp:unsupported',['spcgsearch ' ...
	  'does currently not support searching for maxima. ' ...
		'Search for local maximum is skipped.']);
	options = spoptimset(options, 'Maximize', 'off');
  if strcmpi(minimize, 'off')
    xopt = NaN;
	  fval = NaN;
	  exitflag = 0;
	  if nargout == 4
		  output.nFEvals = 0;
		  output.nGradEvals = 0;
		  output.time = etime(clock, t0);
	  end
	  return;
  end
end

% Determine optimization start point
[x, fval] = spgetstartpoint(z, xbox, options);
fprev = fval;

maxiter = spoptimget(options, 'MaxIter', 100);
tolfun  = spoptimget(options, 'TolFun', 1e-6);
dispopt = spoptimget(options, 'Display', 'off');
[isdispiter, iterstr] = initoptidisp(dispopt);

if isfield(z,'selectOutput')
	numout = z.selectOutout;
else
	numout = 1;
end	
abstol = (z.fevalRange(numout,2) - z.fevalRange(numout,1)).*100*eps;

% Default tolx is computed from range times floating point accuracy.
tolxvec = eps * (range(:,2) - range(:,1));

% Define step size variable; initial value will be computed by
% spminbracket.
stepsize = [];

% Do a maximum of 50 inner iterations
brentopt = spoptimset('MaxIter',50,'TolFun',tolfun);

[dummy, gf] = spsurfun(x,z);

nfevals = 1; ngradevals = 1;
if isdispiter, disp(sprintf(iterstr, 0, 1, 1, fprev, 'start point')); end
neggf  = -gf;
xi = neggf;
h  = neggf;

exitflag = 0;
for k = 1:maxiter
	% Check if gradient is zero
	gg  = dot(neggf,neggf);
	if gg == 0.0
		exitflag = 1;
		break;
	end
	% Check if new search direction is all-zero vector
	if dot(xi,xi) == 0.0
		exitflag = 1;
		break;
	end
	[xbrac,fxbrac,bflag,p,fp,gfp,addfevals] = ...
	  spminbracket(z,x,fval,-neggf,xi,xbox,[],stepsize);
	nfevals = nfevals + addfevals;

	if bflag == 0 || bflag == 2
		% Compute tolx along the search line
		brentopt.TolX = abs(dot(xi / norm(xi), tolxvec));
		brentopt.gf = -neggf;
		[u,fnext,flag,tempoutput] = spbrent(z,x,xi,xbrac,fxbrac,brentopt);
		
		% Next line intentionally commented out (AK)
		% if 2.0*(fnext-fprev) <= tolfun * (abs(fnext)+abs(fprev)+eps);
		
		% Security check that fval has not increased beyond
		% allowed tolerance for break condition
		fval = fnext;
		stepsize = norm(xi * u);
		x = x + xi * u;
		
		% Next line intentionally commented out (AK)
		% end
		
		nfevals = nfevals + tempoutput.nFEvals;
		if isdispiter, disp(sprintf(iterstr, k, nfevals, ...
												ngradevals, fval, 'line search')); end
	else
		if isdispiter, disp(sprintf(iterstr, k, nfevals, ...
												ngradevals, fval, 'boundary hit')); end
		stepsize = norm(x-p);
		x = p;
		fval = fp;
		xi = gfp;
		ngradevals = ngradevals + 1;
	end
	
	if 2.0*abs(fval-fprev) <= max(tolfun * (abs(fval)+abs(fprev)),abstol)
	  exitflag = 1;
	  break;
	end

	fprev = fval;
	if bflag == 0 || bflag == 2
	  [dummy, xi] = spsurfun(x,z);
		nfevals = nfevals + 1;
		ngradevals = ngradevals + 1;
	end
	dgg = dot((xi + neggf),xi);
	neggf = -xi;
	xi = neggf + dgg / gg * h;
	% Adjust search direction for boundary
	for l = 1:d
		if x(l) <= xbox(l,1) + 100*eps*(range(l,2)-range(l,1))
			if neggf(l) < 0
			  xi(l) = 0;
			elseif sign(xi(l)) < 0
			  xi(l) = neggf(l);
		  end
	  end
		if x(l) >= xbox(l,2) - 100*eps*(range(l,2)-range(l,2))
		  if neggf(l) > 0 
			  xi(l) = 0;
		  elseif sign(xi(l)) > 0
			  xi(l) = neggf(l);
			end
		end
	end
	h = xi;
end

xopt = x;

% Return stats
if nargout == 4
  output.nFEvals = nfevals;
  output.nGradEvals = ngradevals;
	output.time = etime(clock, t0);
end

if strcmpi(maximize, 'on')
  xopt = [xopt NaN.*ones(size(xopt))];
	fval = [fval NaN];
	exitflag = [exitflag 0];
end
