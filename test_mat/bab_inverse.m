function a = bab_inverse ( n, alpha, beta )

%*****************************************************************************80
%
%% BAB_INVERSE returns the inverse of the BAB matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real ALPHA, BETA, the parameters.
%
%    Output, real A(N,N), the matrix.
%
  if ( beta == 0.0 )

    if ( alpha == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'BAB_INVERSE - Fatal error!\n' );
      fprintf ( 1, '  ALPHA = BETA = 0.\n' );
      error ( 'BAB_INVERSE - Fatal error!' );
    end

    a(1:n,1:n) = 0.0;

    for i = 1 : n
      a(i,i) = 1.0 / alpha;
    end

  else

    x = 0.5 * alpha / beta;

    u = cheby_u_polynomial ( n, x );

    for i = 1 : n
      for j = 1 : i
        a(i,j) = ( - 1.0 )^( i + j ) * u(j-1+1) * u(n-i+1) / u(n+1) / beta;
      end
      for j = i + 1 : n
        a(i,j) = ( - 1.0 )^( i + j ) * u(i-1+1) * u(n-j+1) / u(n+1) / beta;
      end
    end

  end

  return
end

