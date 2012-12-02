function x = lauchli_null_left ( alpha, m, n, x )

%*****************************************************************************80
%
%% LAUCHLI_NULL_LEFT returns a left null vector of the LAUCHLI matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining the matrix.
%
%    Input, integer M, N, the order of A.
%    It should be the case that M = N + 1.
%
%    Output, real X(M), the vector.
%
  x(1) = - alpha;
  x(2:m) = 1.0;

  return
end
