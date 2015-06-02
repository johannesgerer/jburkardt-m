function x_opt = coordinate_search ( x, function_handle, flag )

%*****************************************************************************80
%
%% COORDINATE_SEARCH carries out a direct search minimization algorithm.
%
%  Discussion:
%
%    This function implements a direct search algorithm, to seek a 
%    multidimensional point X_OPT which minimizes a scalar function F(X).
%
%    The function is currently set up for coordinate search by
%    using a default stencil along coordinate axes.  The stencil and the
%    initial size of the stencil (delta) should probably be input parameters.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    Jeff Borggaard
%
%  Parameters:
%
%    Input, real X(N_VAR), a starting estimate for the minimizer.
%
%    Input, function handle FUNCTION_HANDLE ( X ), ...
%
%    Optional input, integer FLAG, selects features of the algorithm.
%    If FLAG is not input, it defaults to the value 0.
%    0, do not include graphical displays.
%    nonzero, display the status of the search graphically.
%    3, use the water stick stencil.
%
%    Output, real X_OPT(N_VAR), the estimated minimizer.
%
%  Local Parameters:
%
%    Local, real DELTA, the initial size of the stencil.
%
%    Local, real TOLERANCE, a tolerance for the variation between the maximum
%    and minimum values of F in the stencil.
%
%    Local, integer MAX_FEVAL, the maximum number of function evaluations.
%
  delta = 1.0;
  tolerance = 1.0E-06;
  max_feval = 250;
  verbose = 0;
%
%  The default value of FLAG is 0.
%
  if ( nargin <= 2 )
    flag = 0;
  end

  x = x(:)';
  n_var = length(x);
%
%  Define the search stencil
%
  if ( flag ~= 3 )

    for i = 1 : n_var
      stencil(2*i-1).v    = zeros(size(x));
      stencil(2*i-1).v(i) = 1;
      stencil(2*i  ).v    = zeros(size(x));
      stencil(2*i  ).v(i) =-1;
    end

  else

    stencil(1).v = [   1        0    ];
    stencil(2).v = [ -1/2  sqrt(3)/2 ];
    stencil(3).v = [ -1/2 -sqrt(3)/2 ];

  end
    
  n_sten = length ( stencil );
%
%  Compute the function value at the initial point.
%
  f = feval ( function_handle, x );
  n_feval = 1;
  
  if ( flag )
    xp = linspace ( -5.0, 5.0, 101 );
    yp = xp;
    for i=1:101
      for j=1:101
        fp(j,i) = feval(function_handle,[xp(i),yp(j)]);
      end
    end
    
    figure(27)
    hold on
    contour(xp,yp,fp,linspace(0,200,25))
  end
%
%  Begin the Direct Search iteration.
%  
  while ( 1 )
   
    x_s = compute_points ( x, stencil, delta );
%
%  Plot the current search pattern.
%
    if ( flag )
      for i=1:n_sten
        plot([x(1) x_s(i,1)],[x(2) x_s(i,2)],'r')
        plot(x_s(i,1),x_s(i,2),'r*')
      end
    end

    f_s = evaluate ( x_s, function_handle );
    n_feval = n_feval + n_sten;
%
% "erase" the current search pattern after it has been considered
%
    if ( flag )   
      
      for i = 1 : n_sten
        plot ( [x(1) x_s(i,1)],[x(2) x_s(i,2)],'b')
        plot ( x_s(i,1),x_s(i,2),'b*')
      end
    end
%   
%  Find the element in the pattern with the lowest function value.
%
    [ fc_min, i_min ] = min ( f_s );
    [ fc_max        ] = max ( f_s );  
%
%  If we found a lower value, move to that location.
%
    if ( fc_min < f )

      xb = x_s(i_min,:);
      shift = xb - x;
      
      x = xb;
      f = fc_min;
      
      for i = 1 : n_sten
        x_s(i,:) = x_s(i,:) + shift;
      end
%
%  Otherwise, shrink the pattern about the center and recalculate the stencil.
%
    else
      delta = delta / 2.0;
      x_s = compute_points ( x, stencil, delta );
    end
%
%  Test whether we should continue.
%    
    converged = ( fc_max - fc_min < tolerance ) || ( delta < tolerance );

    if ( converged )
      break
    end
    
    diverged = ( max_feval < n_feval );
    
    if ( diverged )
      break
    end

  end

  if ( verbose )
    fprintf ( 'The best point x^* was: %d %d\n', x(1,:) );
    fprintf ( 'f(x^*) = %d\n', f(1) );
  end

  x_opt = x(1,:);

  if ( verbose )
    fprintf ( 'The algorithm terminated after %d function evaluations\n',...
      n_feval);
  end

  if ( diverged )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Convergence was not achieved.\n' );
    fprintf ( 1, '  The iteration limit of %d was exceeded.\n', max_feval );
  end

  return
end
function f = evaluate ( x, function_handle )

%*****************************************************************************80
%
%% EVALUATE evaluates the function at the stencil points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    Jeff Borggaard
%
%  Parameters:
%
%    Input, real X(N_STEN,N_VAR), a set of N_STEN points, each of
%    dimension N_VAR.
%
%    Input, f = FUNCTION_HANDLE ( x ), the handle of a function which
%    accepts as input a vector X and returns the scalar function value F.
%
%    Output, real F(N_STEN), the function evaluated at each of the points.
%
  [ n_sten, n_var ] = size ( x );

  f = zeros ( 1, n_sten );
  
  for i = 1 : n_sten
    f(i) = feval ( function_handle, x(i,:) );
  end

  return
end
function x_s = compute_points ( x, stencil, delta )

%*****************************************************************************80
%
%% COMPUTE_POINTS computes all of the points in the stencil.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    Jeff Borggaard
%
%  Parameters:
%
%    Input, real X(N_VAR), the center of the stencil.
%
%    Input, real STENCIL, a structure describing the stencil.
%
%    Input, real DELTA, determines the geometric size of the stencil.
%
%    Output, real X_S(N_STEN,N_VAR), the stencil points.
%
  n_var = length(x);
  n_sten = length(stencil);

  x_s = zeros ( n_sten, n_var );
  
  for i = 1 : n_sten
    x_s(i,:) = x + delta * stencil(i).v;
  end

  return  
end
