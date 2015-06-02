function a = bodewig ( )

%*****************************************************************************80
%
%% BODEWIG returns the BODEWIG matrix.
%
%  Example:
%
%    2   1   3   4
%    1  -3   1   5
%    3   1   6  -2
%    4   5  -2  -1
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Joan Westlake,
%    Test Matrix A27,
%    A Handbook of Numerical Matrix Inversion and Solution of Linear Equations,
%    John Wiley, 1968.
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%

%
%  Note that the matrix entries are listed by row.
%
  a(1:4,1:4) = [ ...
    2.0,  1.0,  3.0,  4.0; ...
    1.0, -3.0,  1.0,  5.0; ...
    3.0,  1.0,  6.0, -2.0; ...
    4.0,  5.0, -2.0, -1.0 ];

  return
end
