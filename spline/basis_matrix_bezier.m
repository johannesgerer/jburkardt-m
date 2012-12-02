function mbasis = basis_matrix_bezier ( )

%*****************************************************************************80
%
%% BASIS_MATRIX_BEZIER sets up the cubic Bezier spline basis matrix.
%
%  Discussion:
%
%    This basis matrix assumes that the data points are stored as
%    ( P1, P2, P3, P4 ).  P1 is the function value at T = 0, while
%    P2 is used to approximate the derivative at T = 0 by
%    dP/dt = 3 * ( P2 - P1 ).  Similarly, P4 is the function value
%    at T = 1, and P3 is used to approximate the derivative at T = 1
%    by dP/dT = 3 * ( P4 - P3 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Foley, van Dam, Feiner, Hughes,
%    Computer Graphics: Principles and Practice,
%    page 489.
%
%  Parameters:
%
%    Output, real MBASIS(4,4), the basis matrix.
%
  mbasis(1,1) = -1.0;
  mbasis(1,2) =  3.0;
  mbasis(1,3) = -3.0;
  mbasis(1,4) =  1.0;

  mbasis(2,1) =  3.0;
  mbasis(2,2) = -6.0;
  mbasis(2,3) =  3.0;
  mbasis(2,4) =  0.0;

  mbasis(3,1) = -3.0;
  mbasis(3,2) =  3.0;
  mbasis(3,3) =  0.0;
  mbasis(3,4) =  0.0;

  mbasis(4,1) =  1.0;
  mbasis(4,2) =  0.0;
  mbasis(4,3) =  0.0;
  mbasis(4,4) =  0.0;

  return
end
