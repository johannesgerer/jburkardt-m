function a = rutis1 ( )

%*****************************************************************************80
%
%% RUTIS1 returns the RUTIS1 matrix.
%
%  Example:
%
%    6 4 4 1
%    4 6 1 4
%    4 1 6 4
%    1 4 4 6
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A has constant row sums.
%
%    Because it has a constant row sum of 15,
%    A has an eigenvalue of 15, and
%    a (right) eigenvector of ( 1, 1, 1, 1 ).
%
%    A has constant column sums.
%
%    Because it has a constant column sum of 15,
%    A has an eigenvalue of 15, and
%    a (left) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    A has a repeated eigenvalue.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
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
  a(1:4,1:4) = [ ...
    6.0,  4.0,  4.0,  1.0; ...
    4.0,  6.0,  1.0,  4.0; ...
    4.0,  1.0,  6.0,  4.0; ...
    1.0,  4.0,  4.0,  6.0 ];

  return
end
