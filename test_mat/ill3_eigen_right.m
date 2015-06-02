function a = ill3_eigen_right ( )

%*****************************************************************************80
%
%% ILL3_EIGEN_RIGHT returns the right eigenvectors of the ILL3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 March 2015
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
%    Output, real A(3,3), the right eigenvector matrix.
%

%
%  Note that the matrix entries are listed by row.
%
  a = [ ...
  -0.139139989879567, ...
  -0.404061017818396, ...
   0.316227766017190; ...
   0.973979929161820, ...
   0.909137290098421, ...
  -0.948683298050396; ...
  -0.178894272703878, ...
   0.101015254452291, ...
  -0.000000000000407 ];

  return
end
