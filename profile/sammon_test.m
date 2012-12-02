function sammon_test ( )

%*****************************************************************************80
%
%% SAMMON_TEST - minimal test harness for Sammon mapping routine
%
%    SAMMON_TEST provides a simple test harness and demonstration program
%    for SAMMON, a vectorised MATLAB implementation of Sammon's nonlinear
%    mapping algorithm [1].  Basically, it just generates and displays a
%    Sammon map of Fisher's famous Iris dataset [2].
%
%    References :
%
%       [1] Sammon, John W. Jr., "A Nonlinear Mapping for Data Structure
%           Analysis", IEEE Transactions on Computers, vol. C-18, no. 5,
%           pp 401-409, May 1969.
%
%       [2] Fisher, R. A., "The use of multiple measurements in taxonomic
%           problems", Annual Eugenics, vol. 7, part II, pp 179-188, 1936.
%
%    See also : SAMMON

%
% File        : sammon_test.m
%
% Date        : Monday 12th November 2007
%
% Author      : Gavin C. Cawley 
%
% Description : Minimal test harness for a vectorised MATLAB implementation of
%               Sammon's nonlinear mapping algorithm [1] (sammon.m).  
%               Basically, it just creates and displays a Sammon mapping of
%               Fisher's famous Iris dataset [2].
%
% References  : [1] Sammon, John W. Jr., "A Nonlinear Mapping for Data
%                   Structure Analysis", IEEE Transactions on Computers,
%                   vol. C-18, no. 5, pp 401-409, May 1969.
%
%               [2] Fisher, R. A., "The use of multiple measurements in
%                   taxonomic problems", Annual Eugenics, vol. 7, part II,
%                   pp 179-188, 1936.
%
% History     : 11/08/2004 - v1.00
%               12/12/2007 - v1.10 - PCA based initialisation
%
% Copyright   : (c) Dr Gavin C. Cawley, November 2007.
%
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program; if not, write to the Free Software
%    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
%

% start from a clean slate

clear all;

%
% this is Fisher's Iris dataset
%
% Attribute information:
%
%    1 - sepal length in cm
%    2 - sepal width in cm
%    3 - petal length in cm
%    4 - petal width in cm
%    5 - class :
%
%           Iris setosa      = 1
%           Iris Versicolour = 2
%           Iris Virginica   = 3
%

iris = [ 5.1 3.5 1.4 0.2 1 ; 4.9 3.0 1.4 0.2 1 ; 4.7 3.2 1.3 0.2 1 ;
         4.6 3.1 1.5 0.2 1 ; 5.0 3.6 1.4 0.2 1 ; 5.4 3.9 1.7 0.4 1 ;
         4.6 3.4 1.4 0.3 1 ; 5.0 3.4 1.5 0.2 1 ; 4.4 2.9 1.4 0.2 1 ;
         4.9 3.1 1.5 0.1 1 ; 5.4 3.7 1.5 0.2 1 ; 4.8 3.4 1.6 0.2 1 ;
         4.8 3.0 1.4 0.1 1 ; 4.3 3.0 1.1 0.1 1 ; 5.8 4.0 1.2 0.2 1 ;
         5.7 4.4 1.5 0.4 1 ; 5.4 3.9 1.3 0.4 1 ; 5.1 3.5 1.4 0.3 1 ;
         5.7 3.8 1.7 0.3 1 ; 5.1 3.8 1.5 0.3 1 ; 5.4 3.4 1.7 0.2 1 ;
         5.1 3.7 1.5 0.4 1 ; 4.6 3.6 1.0 0.2 1 ; 5.1 3.3 1.7 0.5 1 ;
         4.8 3.4 1.9 0.2 1 ; 5.0 3.0 1.6 0.2 1 ; 5.0 3.4 1.6 0.4 1 ;
         5.2 3.5 1.5 0.2 1 ; 5.2 3.4 1.4 0.2 1 ; 4.7 3.2 1.6 0.2 1 ;
         4.8 3.1 1.6 0.2 1 ; 5.4 3.4 1.5 0.4 1 ; 5.2 4.1 1.5 0.1 1 ;
         5.5 4.2 1.4 0.2 1 ; 4.9 3.1 1.5 0.1 1 ; 5.0 3.2 1.2 0.2 1 ;
         5.5 3.5 1.3 0.2 1 ; 4.9 3.1 1.5 0.1 1 ; 4.4 3.0 1.3 0.2 1 ;
         5.1 3.4 1.5 0.2 1 ; 5.0 3.5 1.3 0.3 1 ; 4.5 2.3 1.3 0.3 1 ;
         4.4 3.2 1.3 0.2 1 ; 5.0 3.5 1.6 0.6 1 ; 5.1 3.8 1.9 0.4 1 ;
         4.8 3.0 1.4 0.3 1 ; 5.1 3.8 1.6 0.2 1 ; 4.6 3.2 1.4 0.2 1 ;
         5.3 3.7 1.5 0.2 1 ; 5.0 3.3 1.4 0.2 1 ; 7.0 3.2 4.7 1.4 2 ;
         6.4 3.2 4.5 1.5 2 ; 6.9 3.1 4.9 1.5 2 ; 5.5 2.3 4.0 1.3 2 ;
         6.5 2.8 4.6 1.5 2 ; 5.7 2.8 4.5 1.3 2 ; 6.3 3.3 4.7 1.6 2 ;
         4.9 2.4 3.3 1.0 2 ; 6.6 2.9 4.6 1.3 2 ; 5.2 2.7 3.9 1.4 2 ;
         5.0 2.0 3.5 1.0 2 ; 5.9 3.0 4.2 1.5 2 ; 6.0 2.2 4.0 1.0 2 ;
         6.1 2.9 4.7 1.4 2 ; 5.6 2.9 3.6 1.3 2 ; 6.7 3.1 4.4 1.4 2 ;
         5.6 3.0 4.5 1.5 2 ; 5.8 2.7 4.1 1.0 2 ; 6.2 2.2 4.5 1.5 2 ;
         5.6 2.5 3.9 1.1 2 ; 5.9 3.2 4.8 1.8 2 ; 6.1 2.8 4.0 1.3 2 ;
         6.3 2.5 4.9 1.5 2 ; 6.1 2.8 4.7 1.2 2 ; 6.4 2.9 4.3 1.3 2 ;
         6.6 3.0 4.4 1.4 2 ; 6.8 2.8 4.8 1.4 2 ; 6.7 3.0 5.0 1.7 2 ;
         6.0 2.9 4.5 1.5 2 ; 5.7 2.6 3.5 1.0 2 ; 5.5 2.4 3.8 1.1 2 ;
         5.5 2.4 3.7 1.0 2 ; 5.8 2.7 3.9 1.2 2 ; 6.0 2.7 5.1 1.6 2 ;
         5.4 3.0 4.5 1.5 2 ; 6.0 3.4 4.5 1.6 2 ; 6.7 3.1 4.7 1.5 2 ;
         6.3 2.3 4.4 1.3 2 ; 5.6 3.0 4.1 1.3 2 ; 5.5 2.5 4.0 1.3 2 ;
         5.5 2.6 4.4 1.2 2 ; 6.1 3.0 4.6 1.4 2 ; 5.8 2.6 4.0 1.2 2 ;
         5.0 2.3 3.3 1.0 2 ; 5.6 2.7 4.2 1.3 2 ; 5.7 3.0 4.2 1.2 2 ;
         5.7 2.9 4.2 1.3 2 ; 6.2 2.9 4.3 1.3 2 ; 5.1 2.5 3.0 1.1 2 ;
         5.7 2.8 4.1 1.3 2 ; 6.3 3.3 6.0 2.5 3 ; 5.8 2.7 5.1 1.9 3 ;
         7.1 3.0 5.9 2.1 3 ; 6.3 2.9 5.6 1.8 3 ; 6.5 3.0 5.8 2.2 3 ;
         7.6 3.0 6.6 2.1 3 ; 4.9 2.5 4.5 1.7 3 ; 7.3 2.9 6.3 1.8 3 ;
         6.7 2.5 5.8 1.8 3 ; 7.2 3.6 6.1 2.5 3 ; 6.5 3.2 5.1 2.0 3 ;
         6.4 2.7 5.3 1.9 3 ; 6.8 3.0 5.5 2.1 3 ; 5.7 2.5 5.0 2.0 3 ;
         5.8 2.8 5.1 2.4 3 ; 6.4 3.2 5.3 2.3 3 ; 6.5 3.0 5.5 1.8 3 ;
         7.7 3.8 6.7 2.2 3 ; 7.7 2.6 6.9 2.3 3 ; 6.0 2.2 5.0 1.5 3 ;
         6.9 3.2 5.7 2.3 3 ; 5.6 2.8 4.9 2.0 3 ; 7.7 2.8 6.7 2.0 3 ;
         6.3 2.7 4.9 1.8 3 ; 6.7 3.3 5.7 2.1 3 ; 7.2 3.2 6.0 1.8 3 ;
         6.2 2.8 4.8 1.8 3 ; 6.1 3.0 4.9 1.8 3 ; 6.4 2.8 5.6 2.1 3 ;
         7.2 3.0 5.8 1.6 3 ; 7.4 2.8 6.1 1.9 3 ; 7.9 3.8 6.4 2.0 3 ;
         6.4 2.8 5.6 2.2 3 ; 6.3 2.8 5.1 1.5 3 ; 6.1 2.6 5.6 1.4 3 ;
         7.7 3.0 6.1 2.3 3 ; 6.3 3.4 5.6 2.4 3 ; 6.4 3.1 5.5 1.8 3 ;
         6.0 3.0 4.8 1.8 3 ; 6.9 3.1 5.4 2.1 3 ; 6.7 3.1 5.6 2.4 3 ;
         6.9 3.1 5.1 2.3 3 ; 5.8 2.7 5.1 1.9 3 ; 6.8 3.2 5.9 2.3 3 ;
         6.7 3.3 5.7 2.5 3 ; 6.7 3.0 5.2 2.3 3 ; 6.3 2.5 5.0 1.9 3 ;
         6.5 3.0 5.2 2.0 3 ; 6.2 3.4 5.4 2.3 3 ; 5.9 3.0 5.1 1.8 3 ];
          
% process training data

[x,idx] = unique(iris(:,1:4), 'rows');
t = iris(idx,5);
n = size(x, 1);

% modify options and perform Sammon mapping 

opts                = sammon;
opts.Display        = 'iter';
opts.TolFun         = 1e-9;
opts.Initialisation = 'pca';

% before = 69.007789
% after  =

tic
for i=1:20
  [y, E] = sammon(x, 2, opts);
end
toc

% plot results

figure(1);
clf;
set(axes, 'FontSize', 16);
plot(y(t == 1,1), y(t == 1,2), 'r.', ...
     y(t == 2,1), y(t == 2,2), 'b+', ...
     y(t == 3,1), y(t == 3,2), 'go');
title(['Sammon Mapping of the Iris Dataset (stress = ' num2str(E) ')']);
legend('Setosa', 'Versicolour', 'Virginica');

  pause

  return
end
function [y, E] = sammon(x, n, opts)

%
% SAMMON - apply Sammon's nonlinear mapping 
%
%    Y = SAMMON(X) applies Sammon's nonlinear mapping procedure on
%    multivariate data X, where each row represents a pattern and each column
%    represents a feature.  On completion, Y contains the corresponding
%    co-ordinates of each point on the map.  By default, a two-dimensional
%    map is created.  Note if X contains any duplicated rows, SAMMON will
%    fail (ungracefully). 
%
%    [Y,E] = SAMMON(X) also returns the value of the cost function in E (i.e.
%    the stress of the mapping).
%
%    An N-dimensional output map is generated by Y = SAMMON(X,N) .
%
%    A set of optimisation options can also be specified using a third
%    argument, Y = SAMMON(X,N,OPTS) , where OPTS is a structure with fields:
%
%       MaxIter        - maximum number of iterations
%       TolFun         - relative tolerance on objective function
%       MaxHalves      - maximum number of step halvings
%       Input          - {'raw','distance'} if set to 'distance', X is 
%                        interpreted as a matrix of pairwise distances.
%       Display        - {'off', 'on', 'iter'}
%       Initialisation - {'pca', 'random'}
%
%    The default options structure can be retrieved by calling SAMMON with
%    no parameters.
%
%    References :
%
%       [1] Sammon, John W. Jr., "A Nonlinear Mapping for Data Structure
%           Analysis", IEEE Transactions on Computers, vol. C-18, no. 5,
%           pp 401-409, May 1969.
%
%    See also : SAMMON_TEST

%
% File        : sammon.m
%
% Date        : Monday 12th November 2007.
%
% Author      : Gavin C. Cawley and Nicola L. C. Talbot
%
% Description : Simple vectorised MATLAB implementation of Sammon's non-linear
%               mapping algorithm [1].
%
% References  : [1] Sammon, John W. Jr., "A Nonlinear Mapping for Data
%                   Structure Analysis", IEEE Transactions on Computers,
%                   vol. C-18, no. 5, pp 401-409, May 1969.
%
% History     : 10/08/2004 - v1.00
%               11/08/2004 - v1.10 Hessian made positive semidefinite
%               13/08/2004 - v1.11 minor optimisation
%               12/11/2007 - v1.20 initialisation using the first n principal
%                                  components.
%
% Thanks      : Dr Nick Hamilton (nick@maths.uq.edu.au) for supplying the
%               code for implementing initialisation using the first n
%               principal components (introduced in v1.20).
%
% To do       : The current version does not take advantage of the symmetry
%               of the distance matrix in order to allow for easy
%               vectorisation.  This may not be a good choice for very large
%               datasets, so perhaps one day I'll get around to doing a MEX
%               version using the BLAS library etc. for very large datasets.
%
% Copyright   : (c) Dr Gavin C. Cawley, November 2007.
%
%    This program is free software; you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation; either version 2 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program; if not, write to the Free Software
%    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
%

% use the default options structure

if nargin < 3

   opts.Display        = 'iter';
   opts.Input          = 'raw';
   opts.MaxHalves      = 20;
   opts.MaxIter        = 500;
   opts.TolFun         = 1e-9;
   opts.Initialisation = 'random';

end

% the user has requested the default options structure

if nargin == 0

   y = opts;

   return;

end

% create a two-dimensional map unless dimension is specified

if nargin < 2

   n = 2;

end

% set level of verbosity

if strcmp(opts.Display, 'iter')

   display = 2;

elseif strcmp(opts.Display, 'on')

   display = 1;

else

   display = 0;

end

% create distance matrix unless given by parameters

if strcmp(opts.Input, 'distance')

   D = x;

else

   D = euclid(x, x);

end

% remaining initialisation

N     = size(x, 1);
scale = 0.5/sum(D(:));
D     = D + eye(N);
Dinv  = 1./D;

if strcmp(opts.Initialisation, 'pca')

   [UU,DD] = svd(x);
   y       = UU(:,1:n)*DD(1:n,1:n);

else

   y = randn(N, n);

end

one   = ones(N,n);
d     = euclid(y,y) + eye(N);
dinv  = 1./d;
delta = D - d;
E     = sum(sum((delta.^2).*Dinv));

% get on with it

for i=1:opts.MaxIter

   % compute gradient, Hessian and search direction (note it is actually
   % 1/4 of the gradient and Hessian, but the step size is just the ratio
   % of the gradient and the diagonal of the Hessian so it doesn't matter).

   delta    = dinv - Dinv;
   deltaone = delta*one;
   g        = delta*y - y.*deltaone;
   dinv3    = dinv.^3; 
   y2       = y.^2;
   H        = dinv3*y2 - deltaone -2*y.*(dinv3*y) + y2.*(dinv3*one);
   s        = -g(:)./abs(H(:));
   y_old    = y;

   % use step-halving procedure to ensure progress is made

   for j=1:opts.MaxHalves

      y(:) = y_old(:) + s;

      d     = euclid(y,y) + eye(N);
      dinv  = 1./d;
      delta = D - d;
      E_new = sum(sum((delta.^2).*Dinv));

      if E_new < E

         break;

      else

         s = 0.5*s;

      end

   end

   % bomb out if too many halving steps are required

   if j == opts.MaxHalves

      if display

         fprintf(1, 'Warning : MaxHalves exceeded.\n');

      end

      break;

   end

   % evaluate termination criterion

   if abs((E - E_new)/E) < opts.TolFun

      if display

         fprintf(1, 'Optimisation terminated - TolFun exceeded.\n');

      end

      break;

   end

   % report progress

   E = E_new;

   if display > 1

      fprintf(1, 'epoch = %d : E = %12.10f\n', i, E*scale);

   end

end

% fiddle stress to match the original Sammon paper

  E = E*scale;

  return
end
function d = euclid(x,y)

  d = sqrt(sum(x.^2,2)*ones(1,size(y,1))+ones(size(x,1),1)*sum(y.^2,2)'-2*(x*y'));

  return
end
