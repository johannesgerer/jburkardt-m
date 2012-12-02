function a = ill3_right ( )

%*****************************************************************************80
%
%% ILL3_RIGHT returns the right eigenvectors of the ILL3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2011
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
%    Output, real ( kind = 8 ) A(3,3), the right eigenvector matrix.
%
  a = [ ...
  -0.139139989879567, ...
   0.973979929161820, ...
  -0.178894272703878; ...
  -0.404061017818396, ...
   0.909137290098421, ...
   0.101015254452291; ...
   0.316227766017190, ...
  -0.948683298050396, ...
  -0.000000000000407 ]';

  return
end
