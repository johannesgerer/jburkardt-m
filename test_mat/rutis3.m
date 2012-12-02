function a = rutis3 ( )

%*****************************************************************************80
%
%% RUTIS3 returns the Rutishauser3 matrix.
%
%  Example:
%
%    4 -5  0  3
%    0  4 -3 -5
%    5 -3  4  0
%    3  0  5  4
%
%  Properties:
%
%    A is not symmetric: A' /= A.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A has distinct eigenvalues.
%
%    A has a pair of complex eigenvalues.
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
  a(1:4,1:4) = [ ...
    4.0,  0.0,  5.0,  3.0; ...
   -5.0,  4.0, -3.0,  0.0; ...
    0.0, -3.0,  4.0,  5.0; ...
    3.0, -5.0,  0.0,  4.0  ]';

  return
end
