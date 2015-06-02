function x = combin_eigen_right ( alpha, beta, n )

%*****************************************************************************80
%
%% COMBIN_EIGEN_RIGHT returns the right eigenvectors of the COMBIN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, scalars that define A.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real X(N,N), the right eigenvectors.
%
  x(1:n,1:n) = 0.0;

  for j = 1 : n - 1
    x(  1,j) = +1.0;
    x(j+1,j) = -1.0;
  end

  j = n;
  x(1:n,j) = 1.0;

  return
end
