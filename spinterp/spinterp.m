function [ip, ipder] = spinterp(z, varargin)
% SPINTERP   Evaluation of sparse grid interpolant
%    IP = SPINTERP(Z, Y1, ..., YD)  Computes the interpolated
%    values at (Y1, ..., YD) over the sparse grid. The Y may be
%    double arrays of equal size for vectorized processing. The
%    sparse grid data must be given as a structure Z containing the
%    hierarchical surpluses (computed with SPVALS). 
%
%    [IP, IPDER] = SPINTERP(Z, Y1, ..., YD)  Computes interpolated
%    values and derivatives at the specified points. The
%    derivatives are returned as D x 1 gradient vectors inside of a
%    cell array that has equal size as the double array IP.
%
%    [...] = SPINTERP(Z, Y)  Alternative syntax for calling spinterp
%    with a single matrix Y containing the points to evaluate. The 
%    matrix must have the size 1xD, Dx1, or NxD, where N are the 
%    number of points to evaluate.
%
%    Two additional options are available with SPINTERP that are
%    set by adding a field to the structure Z:
%       selectOutput [ integer {1} ]  Set the output variable number
%          if an interpolant with multiple output variables was 
%          constructed with SPVALS.
%       continuousDerivatives [ 'on' | {'off'} ]  Enable augmented
%          continuous derivatives for the Clenshaw-Curtis grid.   
%
%    Examples:
%       f = inline('x.^2 + y.^2 - 2.*z');
%       z = spvals(f,3);
%       f_interp = spinterp(z, 0.5, 0.2, 0.2)
%       f_exact = f(0.5, 0.2, 0.2)
%       error = abs(f_exact - f_interp)
%
%       [f_interp, f_ipgrad] = spinterp(z, [0.5, 0.2, 0.2])
%       z.continuousDerivatives = 'on';
%       [f_interp, f_ipgrad] = spinterp(z, [0.5, 0.2, 0.2])
%
%    See also SPGRID, SPVALS, SPSET, SPDIM. 
	
% Author : Andreas Klimke, Universitaet Stuttgart
% Version: 1.8
% Date   : March 3, 2007

% Change log:
% V1.0   : September 23, 2003
%          Initial version
% V1.1   : January 27, 2004
%          Added some new options that can be specified using
%          optional structure fields in z. With the selectOutput
%          field, the desired output argument can be specified
%          (this applies to interpolants of functions with several
%          output variables). See SPDEMOVAROUT for a
%          demonstration.
% V1.2   : June 15, 2004
%          Added new grid type and high degree polynomial
%          interpolation at the Chebyshev distributed nodes
%          (at the extrema of the Chebyshev polynomials).
% V1.3   : March 10, 2005
%          Added processing of sparse index arrays. This
%          significantly improves the computational complexity for
%          higher-dimensional sparse grids.
% V1.4   : February 4, 2006
%          Added drop tolerance processing.
% V1.5   : June 22, 2006
%          Added derivative computation capability.
% V1.6   : September 8, 2006
%          Fixed bug when calling spinterp in undocumented
%          vectorized form when z is computed for default
%          range (required by spsurfun).
% V1.7   : October 28, 2006
%          Added support of calling spinterp with a single matrix
%          (special thanks to Daniel Harenberg for the suggestion 
%          and the provided code).
% V1.8   : March 3, 2007
%          Fixed bug in gradient computation that caused a wrong
%          scaling of derivatives where range intervals were
%          not equal to one (problem found and solved by Katrin 
%          Grau).

% ------------------------------------------------------------
% Sparse Grid Interpolation Toolbox
% Copyright (c) 2006 W. Andreas Klimke, Universitaet Stuttgart 
% Copyright (c) 2007-2008 W. A. Klimke. All Rights Reserved.
% See LICENSE.txt for license. 
% email: klimkeas@ians.uni-stuttgart.de
% web  : http://www.ians.uni-stuttgart.de/spinterp
% ------------------------------------------------------------

gridtype = z.gridType;
d = z.d;
range = z.range;

deriv = 0; 
continuous = 0;
if nargout > 1
	deriv = 1;
	% Default is computing derivatives with jumps 
	if strcmpi(gridtype, 'clenshaw-curtis')
		if isfield(z, 'continuousDerivatives')
			if strcmpi(z.continuousDerivatives, 'on')
				continuous = 1;
			end
		end
	end
end

if isfield(z, 'indices');
	sparseIndices = 'on';
	indices = z.indices;
else
	sparseIndices = 'off';
	n = size(z.vals,2) - 1;
	nfrom = 0;
end

if isfield(z, 'selectOutput')
	output = z.selectOutput;
else
	output = 1;
end

vals = z.vals;

switch lower(gridtype)
 case 'clenshaw-curtis'
	if strcmpi(sparseIndices, 'off')
		if deriv
			if continuous
				ipmethod = @spcontdercc;
			else
				ipmethod = @spderivcc;
			end
		else
			ipmethod = @spinterpcc;
		end
	else
		if deriv
			if continuous
				ipmethod = @spcontderccsp;
			else
				ipmethod = @spderivccsp;
			end
		else
			ipmethod = @spinterpccsp;
		end
	end
 case 'maximum'
	if deriv
		error('MATLAB:spinterp:badopt',['Computing derivatives not ' ...
		      'supported for grid type ''' gridtype '''.']);
	else
		ipmethod = @spinterpm;
	end
 case 'noboundary'
	if deriv
		error('MATLAB:spinterp:badopt',['Computing derivatives not ' ...
		      'supported for grid type ''' gridtype '''.']);
	else
		ipmethod = @spinterpnb;
	end
 case 'chebyshev'
	if strcmpi(sparseIndices, 'off')
		if deriv
			ipmethod = @spderivcb;
		else
			ipmethod = @spinterpcb;
		end
	else
		if deriv
			ipmethod = @spderivcbsp;
		else
			ipmethod = @spinterpcbsp;
		end
	end
 case 'gauss-patterson'
	if strcmpi(sparseIndices, 'off')
		ipmethod = @spinterpgp;
	else
		ipmethod = @spinterpgpsp;
	end
 otherwise
	error('MATLAB:spinterp:badopt',['Unknown grid type ''' gridtype '''.']);
end

if length(varargin) == 1 && d > 1 
	y = varargin{1};
	if ndims(y) == 2
		if size(y,1) == 1 || size(y,2) == 1
			% allow call both as row and as column vector
			y = y(:)';
			orgsize = [1, 1];
		else
			orgsize = [size(y,1), 1];
		end
	else
		error('MATLAB:spinterp:badopt','Invalid array dimension');
	end
			
	% Call in the form of a single vector or matrix instead of a 
	% comma-separated list
	if size(y,2) == d
	  if ~isempty(range)
			y = (y - ones(size(y,1),1)*range(:,1)') ./ ...
							(ones(size(y,1),1)*(range(:,2)'-range(:,1)'));
		end
	else
		error('MATLAB:spinterp:badopt', ...
					['Number of inputs does not match sparse grid' ...
					' dimension.']);
	end  
elseif length(varargin) ~= d
	error('MATLAB:spinterp:badopt', ...
				['Number of inputs does not match sparse grid' ...
				 ' dimension.']);
else
	% store the original array shape
	orgsize = size(varargin{1});

	% Transform multiple parameter inputs to a matrix for fast
	% processing; also perform normalization to unit cube.
	for k = 1:length(varargin)
		if ~isempty(range)
			varargin{k} = (varargin{k}(:)-range(k,1))./(range(k,2)-range(k,1));
		else 
			varargin{k} = varargin{k}(:);
		end
	end
	y = [varargin{:}];
end
	
ninterp = size(y,1);

ip = zeros(ninterp,1);
if deriv, ipder = zeros(ninterp,d); end
if continuous, ipder2 = zeros(ninterp,d); end

% do multiple levels at once
if strcmpi(sparseIndices, 'off')
	for k = nfrom:n
		% get the sequence of levels
		levelseq = spgetseq(k,d);
		if isfield(z, 'purgeData')
			pd = z.purgeData{k+1}(:,output);
		else
		  pd = [];
		end
		if deriv
			if continuous
				[iptemp, ipdertemp, ipdertemp2] = ...
					  feval(ipmethod,d,vals{output,k+1},y,levelseq,pd,...
						      z.maxLevel);
				ipder2 = ipder2 + ipdertemp2;
			else
				[iptemp, ipdertemp] = feval(ipmethod,d,vals{output,k+1},y,levelseq,pd);
			end
			ip = ip + iptemp;
			ipder = ipder + ipdertemp; 
		else	
			ip = ip + feval(ipmethod,d,vals{output,k+1},y,levelseq,pd);
		end
	end
else
	if isfield(z, 'purgeData')
		pd = z.purgeData(:,output);
	else
		pd = [];
	end
	if deriv
	  if continuous
  		[ip, ipder, ipder2] = feval(ipmethod,d,vals{output},y,indices,pd,...
			                            z.maxLevel);
		else
			[ip, ipder] = feval(ipmethod,d,vals{output},y,indices,pd);
		end
	else
		ip = feval(ipmethod,d,vals{output},y,indices,pd);
	end
end

if continuous
	% Post-process if continuous derivatives are requested
	ipder = ppderiv(ipder, ipder2, z.maxLevel, y);
end
if deriv && ~isempty(range)
    for k = 1:d
        ipder(:,k) = ipder(:,k) / (range(k,2)-range(k,1));
    end
end  
		
% restore original array shape
ip = reshape(ip,orgsize);

% if requested by the user, return derivatives as cell array matching 
% the original array shape; each cell containts derivatives as a [dx1] 
% vector. 
if deriv
	if ninterp == 1
		% Treat special case of only a single point
		ipder = {ipder(:)};
	else
	  nd = length(orgsize);
		ipder = permute(num2cell(...
						permute(reshape(ipder,[orgsize double(d)]),...
						[nd+1,1:nd]),1),[2:nd+1,1]);
	end
end
