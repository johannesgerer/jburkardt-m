function value = r8mat_rms ( m, n, a )

%*****************************************************************************80
%
%% R8MAT_RMS returns the RMS norm of an R8MAT.
%
%  Discussion:
%
%    The matrix RMS norm is defined as:
%
%      value = 
%        sqrt ( sum ( 1 <= J <= N ) sum ( 1 <= I <= M ) A(I,J)^2 / M / N ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the dimensions of the array.
%
%    Input, real A(M,N), the array.
%
%    Output, real VALUE, the RMS norm.
%
  value = sqrt ( sum ( sum ( a(1:m,1:n).^2 ) ) / m / n );

  return
end
