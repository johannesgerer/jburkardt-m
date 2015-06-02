function b = hankel_n_inverse ( n )

%*****************************************************************************80
%
%% HANKEL_N_INVERSE returns the inverse of the HANKEL_N matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ( kind = 4 ) N, the order of the matrix.
%
%    Output, real ( kind = 8 ) B(N,N), the matrix.
%
  v = zeros ( n, 1 );

  v(1) = 1.0 / n;
  for i = 2 : n
    v(i) = 0.0;
    for j = 1 : i - 1
      v(i) = v(i) - ( n + j - i ) * v(j);
    end
    v(i) = v(i) / n;
  end

  b = zeros ( n, n );

  for j = 1 : n
    for i = 1 : n - j
      b(i,j) = 0.0;
    end
    for i = n + 1 - j: n
      b(i,j) = v(i+j-n);
    end
  end

  return
end
