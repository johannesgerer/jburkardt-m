function a = chow_inverse ( alpha, beta, n )

%*****************************************************************************80
%
%% CHOW_INVERSE returns the inverse of the Chow matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the ALPHA value.  A typical value is 1.0.
%
%    Input, real BETA, the BETA value.  A typical value is 0.0.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1:n) = 0.0;

  if ( 0.0 == alpha & beta == 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHOW_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The Chow matrix is not invertible, because\n' );
    fprintf ( 1, '  ALPHA = 0 and BETA = 0.\n' );
    error ( 'CHOW_INVERSE - Fatal error!' );

  elseif ( 0.0 == alpha & beta ~= 0.0 )

    for i = 1 : n
      for j = 1 : n

        if ( i <= j )
          a(i,j) = (-1)^(j-i) / beta^(j+1-i);
        else
          a(i,j) = 0.0;
        end

      end
    end

    return

  elseif ( 0.0 ~= alpha & beta == 0.0 )

    if ( 1 < n )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CHOW_INVERSE - Fatal error!\n' );
      fprintf ( 1, '  The Chow matrix is not invertible, because\n' );
      fprintf ( 1, '  BETA = 0 and 1 < N.\n' );
      error ( 'CHOW_INVERSE - Fatal error!' );
    end

    a(1,1) = 1.0 / alpha;

    return

  end

  d(0+1) = 1.0;
  d(1+1) = beta;
  for i = 2 : n
    d(i+1) = beta * d(i-1+1) + alpha * beta * d(i-2+1);
  end

  dp(-1+2) = 1.0 / beta;
  dp(0+2) = 1.0;
  dp(1+2) = alpha + beta;
  for i = 2 : n
    dp(i+2) = d(i+1) + alpha * d(i-1+1);
  end

  for i = 1 : n
    for j = 1 : i-1
      a(i,j) = - alpha * ( alpha * beta )^(i-j) * dp(j-2+2) * d(n-i+1) ...
        / dp(n+2);
    end
    for j = i : n
      a(i,j) = (-1)^(i+j) * dp(i-1+2) * d(n+1-j+1) / ( beta * dp(n+2) );
    end
  end

  return
end
