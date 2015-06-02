function a = lehmer_llt ( n )

%*****************************************************************************80
%
%% LEHMER_LLT returns the Cholesky factor of the LEHMER matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Emrah Kilic, Pantelimon Stanica,
%    The Lehmer matrix and its recursive analogue,
%    Journal of Combinatorial Mathematics and Combinatorial Computing,
%    Volume 74, August 2010, pages 193-205.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for j = 1 : n
    for i = j : n
      a(i,j) = sqrt ( 2 * j - 1 ) / i;
    end
  end

  return
end
