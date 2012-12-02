function a = ill3 ( )

%*****************************************************************************80
%
%% ILL3 returns an ill conditioned 3 by 3 matrix.
%
%  Formula:
%
%    -149  -50 -154
%     537  180  546
%     -27   -9  -25
%
%  Properties:
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    The eigenvalues are ( 1, 2, 3 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2008
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
%    Output, real A(3,3), the matrix.
%
  a = [ ...
  -149.0,  537.0, -27.0; ...
   -50.0,  180.0,  -9.0; ...
  -154.0,  546.0, -25.0 ]';

  return
end

