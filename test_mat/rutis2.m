function a = rutis2 ( )

%*****************************************************************************80
%
%% RUTIS2 returns the Rutishauser2 matrix.
%
%  Example:
%
%    5 4 1 1
%    4 5 1 1
%    1 1 4 2
%    1 1 2 4
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A has distinct eigenvalues.
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
    5.0,  4.0,  1.0,  1.0; ...
    4.0,  5.0,  1.0,  1.0; ...
    1.0,  1.0,  4.0,  2.0; ...
    1.0,  1.0,  2.0,  4.0 ]';

  return
end
