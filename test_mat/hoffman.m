function a = hoffman ( omega )

%*****************************************************************************80
%
%% HOFFMAN computes the HOFFMAN matrix.
%
%  Discussion:
%
%    This example arises from a linear programming problem.
%
%  Example:
%
%    c  = cos ( THETA )
%    c2 = cos ( 2 THETA )
%    s  = sin ( THETA )
%    s2 = sin ( 2 THETA )
%    t  = tan ( THETA )
%    w  = OMEGA
%
%    1 0 0  0        0  0      0     0      0     0    0
%    0 1 0  c       -wc c2    -2wcc  c2     2wcc  c    wc
%    0 0 1  ts/w     c  tsw/w  c2   -2ss/2  c2   -ts/w c
%    0 0 0  (c-1)/c  w  0      2w    4ss   -2wc2  4ss  w*(1-2c)
%
%  Discussion:
%
%    In 1951, Alan Hoffman presented the first example of a "circle",
%    that is, a linear programming problem which causes the linear
%    programming algorithm to fall into a cycle of operations.
%    Because of the possibility of such occurrences, the linear
%    programming algorithm was refined to avoid such cycles.
%
%    The matrix represents a system of 3 linear equations and 11 variables,
%       A * x = b
%    and one linear constraint
%       c' * x = z
%    with the added condition
%       0 <= x.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Dantzig,
%    Linear Programming and Extensions,
%    Princeton University Press, 1963.
%
%    Jon Lee,
%    Hoffman's Circle Untangled,
%    SIAM Review,
%    Volume 39, Number 1, March 1997, pages 98-105.
%
%  Parameters:
%
%    Input, real OMEGA, a value which is required to be
%    greater than ( 1 - cos ( THETA ) ) / ( 1 - 2 cos ( THETA ) )
%    where THETA is 2 * pi / 5.  This limit is roughly 1.809.
%
%    Output, real A(4,11), the matrix.
%
  a = zeros ( 4, 11 );

  theta = 2.0 * pi / 5.0;

  c = cos ( theta );

  if ( omega <= ( 1.0 - c ) / ( 1.0 - 2.0 * c ) ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HOFFMAN - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of OMEGA = %f\n', omega );
    fprintf ( 1, '  OMEGA must be at least %f\n', ...
      ( 1.0 - c ) / ( 1.0 - 2.0 * c ) );
    error ( 'HOFFMAN - Fatal error!' );
  end

  c2 = cos ( 2.0 * theta );
  s = sin ( theta );
  s2 = sin ( 2.0 * theta );
  t = tan ( theta );

  a(1,1) = 1.0;
  a(1,2:11) = 0.0;

  a(2,1) = 0.0;
  a(2,2) = 1.0;
  a(2,3) = 0.0;
  a(2,4) = c;
  a(2,5) = - omega * c;
  a(2,6) = c2;
  a(2,7) = - 2.0 * omega * c * c;
  a(2,8) = c2;
  a(2,9) = 2.0 * omega * c * c;
  a(2,10) = c;
  a(2,11) = omega * c;

  a(3,1) = 0.0;
  a(3,2) = 0.0;
  a(3,3) = 1.0;
  a(3,4) = t * s / omega;
  a(3,5) = c;
  a(3,6) = t * s2 / omega;
  a(3,7) = c2;
  a(3,8) = - 2.0 * s * s / omega;
  a(3,9) = c2;
  a(3,10) = - t * s / omega;
  a(3,11) = c;

  a(4,1) = 0.0;
  a(4,2) = 0.0;
  a(4,3) = 0.0;
  a(4,4) = ( c - 1.0 ) / c;
  a(4,5) = omega;
  a(4,6) = 0.0;
  a(4,7) = 2.0 * omega;
  a(4,8) = 4.0 * s * s;
  a(4,9) = - 2.0 * omega * c2;
  a(4,10) = 4.0 * s * s;
  a(4,11) = omega * ( 1.0 - 2.0 * c );

  return
end
