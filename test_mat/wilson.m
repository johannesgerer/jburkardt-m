function a = wilson ( )

%*****************************************************************************80
%
%% WILSON returns the WILSON matrix.
%
%  Formula:
%
%    A =
%     5  7  6  5
%     7 10  8  7
%     6  8 10  9
%     5  7  9 10
%
%  Properties:
%
%    The Higham/MATLAB version of this matrix has rows and columns
%    1 and 2 interchanged.
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is positive definite.
%
%    det ( A ) = 1.
%
%    A is ill-conditioned.
%
%    A * X = B, where X is the Wilson solution vector, and B is the
%    Wilson right hand side.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of 
%    Linear Equations,
%    John Wiley, 1968,
%    ISBN13: 978-0471936756,
%    LC: QA263.W47.
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%

%
%  Note that the matrix entries are listed by row.
%
  a(1:4,1:4) = [ 5.0,  7.0,  6.0,  5.0; ...
                 7.0, 10.0,  8.0,  7.0; ...
                 6.0,  8.0, 10.0,  9.0; ...
                 5.0,  7.0,  9.0, 10.0 ];
  return
end
