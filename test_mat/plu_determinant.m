function determ = plu_determinant ( n, p, l, u )

%*****************************************************************************80
%
%% PLU_DETERMINANT returns the determinant of the PLU matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real P(N,N), L(N,N), U(N,N), the P, L and U factors
%    of A, as defined by Gaussian elimination with partial pivoting.
%    P is a permutation matrix, L is unit lower triangular, and U
%    is upper trianguler.
%
%    Output, real DETERM, the determinant.
%
  determ = 1.0;

  for i = 1 : n
    determ = determ * u(i,i);
  end

  for i = 1 : n
    for j = 1 : n
      if ( p(i,j) == 1.0 )
        if ( i ~= j )
          determ = - determ;
        end
      end
    end
  end

  return
end

