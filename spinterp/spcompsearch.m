function [xopt,fval,exitflag,output] = spcompsearch(z, xbox, options)
% SPCOMPSEARCH  Modified compass (coordinate) search algorithm 
%    performing a local search of the sparse grid inpterpolant. 
%    X = SPCOMPSEARCH(Z)  Finds a local optimizer X for the given 
%    sparse grid interpolant Z using a modified compass search 
%    algorithm starting from the best available sparse grid point. 
%    The entire range of the sparse grid interplant is searched.
%
%    X = SPCOMPSEARCH(Z, XBOX) Uses the search box XBOX, X = [a1,
%    b1; a2, b2; ...]. The size of search box XBOX must be smaller
%    than or equal to the range of the interpolant.
%
%    X = SPCOMPSEARCH(Z, XBOX, OPTIONS)  Additionally, an OPTIONS
%    structure can be provided, see SPOPTIMSET for further details.
%
%    [X,FVAL] = SPCOMPSEARCH(...)  returns the value of the 
%    sparse grid interpolant at X.
%
%    [X,FVAL,EXITFLAG] = SPCOMPSEARCH(...)  returns an EXITFLAG 
%    that describes the exit condition of SPCOMPSEARCH. Possible
%    values of EXITFLAG and the corresponding exit conditions are
%
%     1  SPCOMPSEARCH converged to a solution X.
%     0  Maximum number of iterations reached.
%
%    [X,FVAL,EXITFLAG,OUTPUT] = SPCOMPSEARCH(...) returns a 
%    structure OUTPUT with the number of function evaluations in 
%    OUTPUT.nFevals and the computing time in .time.
%
%    Example: (minimizing the three-hump camel-back function)
%       f = inline('12*x.^2-6.3*x.^4+x.^6+6*y*(y-x)');
%       range = [-3 3; -3 3];
%       options = spset('keepFunctionValues','on');
%       z = spvals(f, 2, range, options);
%       [xopt, fval] = spcompsearch(z)
%
%    See also SPOPTIMSET.
 
% Author : Andreas Klimke
% Version: 2.1
% Date   : September 1, 2007
	
% Change log:
% V2.1 : September 1, 2007
%        Changed calling syntax to match other optimization
%        methods. Added maximum number of iterations.
% V2.0 : January 23, 2006
%        Added TolFun break criterium.
% V1.9 : June 9, 2005
%        Removed multiple start processing from V1.5; moved to
%        separate routine SPMULTISTART. Removed start point
%        computation; moved to separate routine.
% V1.8 : April 15, 2005
%        Corrected bug concerning testCorners option; Modified
%        slightly to cope with new dimension-adaptive format.
% V1.7 : January 14, 2005
%        Corrected bug that lead to wrong rescaling of parts of the
%        grid data if previous results were used.
% V1.6 : January 11, 2005
%        Added capability for handling polynomial sparse grid
%        interpolants. Added tolerance on X as options.
% V1.5 : November 13, 2004
%        Added feature for performing multiple searches at a time.
% V1.4 : September 6, 2004
%        Added capability for handling dimension-adaptive data.
% V1.3 : September 6, 2004
%      : Added check if the spvals structure contains a valid
%        range; otherwise, set it to [0,1]^d.
% V1.2 : March 9, 2004
%        Added random start point option
% V1.1 : February 18, 2004
%        Moved search for optimum of sparse grid points to separate
%        routine (spfindopt.m).
% V1.0 : January 7, 2004
%        Initial version	       
	
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

if isfield(z, 'dimAdapt')
	n = z.maxLevel';
else
	n = z.maxLevel*ones(d,1,'uint8');
end

% savepoints = [];

% Determine optimization start point(s)
[xopt, fval] = spgetstartpoint(z, xbox, options);

minimize = spoptimget(options, 'Minimize', 'on');
maximize = spoptimget(options, 'Maximize', 'off');
if strcmpi(minimize, 'on'), isminimize = 1; else isminimize = 0; end
if strcmpi(maximize, 'on'), ismaximize = 1; else ismaximize = 0; end

ymin = []; ymax = [];
if isminimize 
	ymin = fval(1);
	if ismaximize
		ymax = fval(2);
	end
else
	ymax = fval(1);
end


switch(lower(z.gridType))
 case {'maximum', 'noboundary', 'clenshaw-curtis'}
	linear = 1;
 case {'chebyshev', 'gauss-patterson'}
	linear = 0;
 otherwise
		error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

maxiter = spoptimget(options, 'MaxIter', 100);

tolx = spoptimget(options, 'TolX', []);
if isempty(tolx)
	if linear
		tolx = inf;
	else
		tolx = max(z.estRelError * 1e-2, 10*eps);
	end
end

tolfun = spoptimget(options, 'TolFun', 1e-6);
dispopt = spoptimget(options, 'Display', 'off');

nfevals = 0;

x = zeros(2*d,d);

exitflag = zeros(size(xopt,2));

for k = 1:size(xopt,2)
	
	% Compute the step length parameters
	dx = 1./2.^(floor(double(n)/double(d))).*(z.range(:,2)-z.range(:,1));
	dxunit = 1./2.^(floor(double(n)/double(d)));
	dxmin = 1./2.^double(n);
	dxminvec = 1./2.^double(n).*(z.range(:,2)-z.range(:,1));
	
	% correct the start values to lie on a full grid point
	if linear
		updated = 0;
		for l = 1:d
			xtemp = floor((xopt(l,k) - z.range(l,1)) / ...
										dxminvec(l))*dxminvec(l) + z.range(l,1);
			while xtemp < xbox(l,1)
				xtemp = xtemp + dxminvec(l);
			end
			if xtemp > xbox(l,2)
				% this can only be true if the search box is smaller than the
				% step width dx. In this case, take the center of the search
				% box as the starting point.
				xtemp = (xbox(l,1) + xbox(l,2))/2;
			end
			if xtemp ~= xopt(l,k)
				xopt(l,k) = xtemp;
				updated = 1;
			end
		end
		if updated
			xoptcell = num2cell(xopt(:,k));
			nfevals = nfevals + 1;
      if k == 1 && isminimize
        ymin = spinterp(z, xoptcell{:});
      else
        ymax = spinterp(z, xoptcell{:});
      end
    end
	end
	
  [isdispiter, iterstr] = initoptidisp(dispopt);
  if isdispiter
	  if k == 1 && isminimize
		  disp(sprintf(iterstr, 0, nfevals, 0, ymin, 'start point'));
	  else
		  disp(sprintf(iterstr, 0, nfevals, 0, ymax, 'start point'));
		end
	end
	if k == 2
		isminimize = 0;
	end
	
	exitflag(k) = 0;
	for kit = 1:maxiter
		
		% save the points for later processing, if requested by the
    % user
		%if nargout == 3
		%	if isminimize
		%		savepoints = [savepoints; [xopt(:,k)' ymin]];
		%	else
		%		savepoints = [savepoints; [xopt(:,k)' ymax]];
		%	end
		%end
		
		nfevals = nfevals + uint32(d)*2;
		
		% Generate search points
		id = uint32(1);
		for l = 1:d
			for l2 = 1:d
				if l == l2
					x(id,l) = xopt(l,k) - dx(l);
					x(id+1,l) = xopt(l,k) + dx(l);
					if x(id,l) < xbox(l,1)
            x(id,l) = xbox(l,1);
          end
          if x(id+1,l) > xbox(l,2)
            x(id+1,l) = xbox(l,2);
          end
				else
					x(id,l2) = xopt(l2,k);
					x(id+1,l2) = xopt(l2,k);
				end
			end
			id = id + 2;
		end
		
		% Perform sparse grid interpolation
		xcell = num2cell(x,1);
		ytemp = spinterp(z, xcell{:});
		
		if isminimize
			[ymintemp, id] = min(ytemp);
			if ymintemp < ymin
				xopt(:,k) = x(id,:)';        
      	if isdispiter, disp(sprintf(iterstr, kit, nfevals, ...
	                          0, ymintemp, 'coordinate step')); end
        % Terminate if function value change is below tolerance
        if abs(ymin-ymintemp) < tolfun
				  ymin = ymintemp;
					exitflag(k) = 1;
          break;
        end
        ymin = ymintemp;  
			else
      	if isdispiter, disp(sprintf(iterstr, kit, nfevals, ...
	                          0, ymin, 'contract step')); end
				if all(dxunit <= dxmin) && all(dxunit <= tolx)
					exitflag(k) = 1;
					break;
				end
				for l = 1:d
					if dxunit(l) > dxmin(l) || dxunit(l) > tolx
						dxunit(l) = dxunit(l) / 2;
						dx(l) = dx(l) / 2;
					end
				end
			end
		else
			[ymaxtemp, id] = max(ytemp);
			if ymaxtemp > ymax
				xopt(:,k) = x(id,:)';
      	if isdispiter, disp(sprintf(iterstr, kit, nfevals, ...
	                          0, ymaxtemp, 'coordinate step')); end
        % Terminate if function value change is below tolerance
        if abs(ymax-ymaxtemp) < tolfun
				  ymax = ymaxtemp;
					exitflag(k) = 1;
          break;
        end
				ymax = ymaxtemp;
			else
      	if isdispiter, disp(sprintf(iterstr, kit, nfevals, ...
	                          0, ymax, 'contract step')); end
				if all(dxunit <= dxmin) && all(dxunit <= tolx)
					exitflag(k) = 1;
					break;
				end
				for l = 1:d
					if dxunit(l) > dxmin(l) || dxunit(l) > tolx
						dxunit = dxunit / 2;
						dx = dx / 2;
					end
				end
			end
		end
	end
end

fval = [ymin ymax];

if nargout == 4
	output.nFEvals = nfevals;
	output.time = etime(clock, t0);
	% output.points = savepoints;
end
