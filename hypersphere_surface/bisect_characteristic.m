function r = bisect_characteristic ( x0, theta, characteristic )

%*****************************************************************************80
%
%% BISECT_CHARACTERISTIC: characteristic function transition surface.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X0(M,1), the coordinates of the base point inside the surface.
%
%    Input, real THETA, the coordinates of a direction from the base point.
%
%    Input, real y = CHARACTERISTIC ( m, n, x ), the handle for a function which
%    evaluates the characteristic for the object at N M-dimensional points X,
%    returning a 1 for points inside the object, and 0 for points outside.
%
%    Output, real R, the distance from X0 to the surface in direction THETA.
%

  x0 = x0(:);

  m = length ( x0 );
  n = 1;
%
%  Initially, X1 = X0, and so Y1 should be 1.
%
  x1(1:m,1) = x0(1:m,1);
  y1 = characteristic ( m, n, x1 );
%
%  Seek an exterior point.
%
  x2 = exterior_point_characteristic ( m, x0, theta, characteristic );
%
%  Carry out the bisection search in the interval [X1,X2].
%
  it_num = 0;

  while ( 1.0E-3 < sqrt ( norm ( x2 - x1 ) ) )
    
    x3 = ( x1 + x2 ) / 2.0;
    y3 = characteristic ( m, n, x3 );
    
    if ( y3 == 0 )
      x2 = x3;
    else
      x1 = x3;
    end

    it_num = it_num + 1;

    if ( 1000 < it_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'BISECT_CHARACTERISTIC - Fatal error!\n' );
      fprintf ( 1, '  Too many iterations.\n' );
      error ( 'BISECT_CHARACTERISTIC - Fatal error!' )
    end
  
  end
%
%  Measure the distance from X0 to the transition.
%  We estimate the transition to occur at the average of X1 and X2.
%
  x3 = ( x1 + x2 ) / 2.0;
  r = norm ( x3 - x0 );

  return
end

