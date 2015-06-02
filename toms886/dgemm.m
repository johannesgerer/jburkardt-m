function c = dgemm ( transa, transb, m, n, k, alpha, a, lda, b, ldb, beta, ...
  c, ldc )

%*****************************************************************************80
%
%c DGEMM computes C = alpha * A * B and related operations.
%
%  Discussion:
%
%    DGEMM performs one of the matrix-matrix operations
%
%     C := alpha * op ( A ) * op ( B ) + beta * C,
%
%    where op ( X ) is one of
%
%      op ( X ) = X   or   op ( X ) = X',
%
%    ALPHA and BETA are scalars, and A, B and C are matrices, with op ( A )
%    an M by K matrix, op ( B ) a K by N matrix and C an N by N matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%    
%  Modified:
%
%    10 February 2014
%
%  Author:
%
%    Original FORTRAN77 version by Jack Dongarra.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, character TRANSA, specifies the form of op( A ) to be used in
%    the matrix multiplication as follows:
%    'N' or 'n', op ( A ) = A.
%    'T' or 't', op ( A ) = A'.
%    'C' or 'c', op ( A ) = A'.
%
%    Input, character TRANSB, specifies the form of op ( B ) to be used in
%    the matrix multiplication as follows:
%    'N' or 'n', op ( B ) = B.
%    'T' or 't', op ( B ) = B'.
%    'C' or 'c', op ( B ) = B'.
%
%    Input, integer M, the number of rows of the  matrix op ( A ) and of the  
%    matrix C.  0 <= M.
%
%    Input, integer N, the number  of columns of the matrix op ( B ) and the 
%    number of columns of the matrix C.  0 <= N.
%
%    Input, integer K, the number of columns of the matrix op ( A ) and the 
%    number of rows of the matrix op ( B ).  0 <= K.
%
%    Input, real ALPHA, the scalar multiplier 
%    for op ( A ) * op ( B ).
%
%    Input, real A(LDA,KA), where:
%    if TRANSA is 'N' or 'n', KA is equal to K, and the leading M by K
%    part of the array contains A;
%    if TRANSA is not 'N' or 'n', then KA is equal to M, and the leading
%    K by M part of the array must contain the matrix A.
%
%    Input, integer LDA, the first dimension of A as declared in the calling 
%    routine.  When TRANSA = 'N' or 'n' then LDA must be at least max ( 1, M ), 
%    otherwise LDA must be at least max ( 1, K ).
%
%    Input, real B(LDB,KB), where:
%    if TRANSB is 'N' or 'n', kB is N, and the leading K by N 
%    part of the array contains B;
%    if TRANSB is not 'N' or 'n', then KB is equal to K, and the leading
%    n by k  part of the array must contain the matrix B.
%
%    Input, integer LDB, the first dimension of B as declared in the calling 
%    routine.  When TRANSB = 'N' or 'n' then LDB must be at least max ( 1, K ), 
%    otherwise LDB must be at least max ( 1, N ).
%
%    Input, real BETA, the scalar multiplier for C.
%
%    Input, real C(LDC,N).
%    Before entry, the leading M by N part of this array must contain the 
%    matrix C, except when BETA is 0.0, in which case C need not be set 
%    on entry.
%    On exit, the array C is overwritten by the M by N matrix
%      alpha * op ( A ) * op ( B ) + beta * C.
%
%    Input, integer LDC, the first dimension of C as declared in the calling 
%    routine.  max ( 1, M ) <= LDC.
%

%
%  Set NOTA and NOTB as true if A and B respectively are not
%  transposed and set NROWA, NCOLA and NROWB as the number of rows
%  and columns of A and the number of rows of B respectively.
%
  nota = ( transa == 'N' || transa == 'n' );

  if ( nota )
    nrowa = m;
    ncola = k;
  else
    nrowa = k;
    ncola = m;
  end

  notb = ( transb == 'N' || transb == 'n' );

  if ( notb )
    nrowb = k;
  else
    nrowb = n;
  end
%
%  Test the input parameters.
%
  info = 0;

  if ( ~ ( transa == 'N' || transa == 'n' || ...
           transa == 'C' || transa == 'c' || ...
           transa == 'T' || transa == 't' ) )
    info = 1;
    fprintf ( 1, 'DGEMM rejects input argument number %d\n', info );
    error ( 'DGEMM - Fatal error!' );
  end

  if ( ~ ( transb == 'N' || transb == 'n' || ...
           transb == 'C' || transb == 'c' || ...
           transb == 'T' || transb == 't' ) )
    info = 2;
    fprintf ( 1, 'DGEMM rejects input argument number %d\n', info );
    error ( 'DGEMM - Fatal error!' );
  end

  if ( m < 0 )
    info = 3;
    fprintf ( 1, 'DGEMM rejects input argument number %d\n', info );
    error ( 'DGEMM - Fatal error!' );
  end

  if ( n < 0 )
    info = 4;
    fprintf ( 1, 'DGEMM rejects input argument number %d\n', info );
    error ( 'DGEMM - Fatal error!' );
  end

  if ( k < 0 )
    info = 5;
    fprintf ( 1, 'DGEMM rejects input argument number %d\n', info );
    error ( 'DGEMM - Fatal error!' );
  end

  if ( lda < max ( 1, nrowa ) )
    info = 8;
    fprintf ( 1, 'DGEMM rejects input argument number %d\n', info );
    error ( 'DGEMM - Fatal error!' );
  end

  if ( ldb < max ( 1, nrowb ) )
    info = 10;
    fprintf ( 1, 'DGEMM rejects input argument number %d\n', info );
    error ( 'DGEMM - Fatal error!' );
  end

  if ( ldc < max ( 1, m ) )
    info = 13;
    fprintf ( 1, 'DGEMM rejects input argument number %d\n', info );
    error ( 'DGEMM - Fatal error!' );
  end
%
%  Quick return if possible.
%
  if ( m == 0 )
    return
  end

  if ( n == 0 )
    return
  end

  if ( ( alpha == 0.0 || k == 0 ) && ( beta == 1.0 ) )
    return
  end
%
%  And if alpha is 0.0.
%
  if ( alpha == 0.0 )
    if ( beta == 0.0 )
      c = zeros ( ldc, n );
    else
      c(1:m,1:n) = beta * c(1:m,1:n);
    end
    return
  end
%
%  Start the operations.
%
  if ( notb )
%
%  Form  C := alpha*A*B + beta*C.
%
    if ( nota )

      for j = 1 : n

        if ( beta == 0.0 )
          c(1:m,j) = 0.0;
        elseif ( beta ~= 1.0 )
          c(1:m,j) = beta * c(1:m,j);
        end

        for l = 1 : k
          if ( b(l,j) ~= 0.0 )
            c(1:m,j) = c(1:m,j) + alpha * b(l,j) * a(1:m,l);
          end
        end

      end
%
%  Form  C := alpha*A'*B + beta*C
%
    else

      for j = 1 : n
        for i = 1 : m

          temp = a(1:k,i)' * b(1:k,j);

          if ( beta == 0.0 )
            c(i,j) = alpha * temp;
          else
            c(i,j) = alpha * temp + beta * c(i,j);
          end

        end
      end

    end
%
%  Form  C := alpha*A*B' + beta*C
%
  else

    if ( nota )

      for j = 1 : n

        if ( beta == 0.0 )
          c(1:m,j) = 0.0;
        elseif ( beta ~= 1.0 )
          c(1:m,j) = beta * c(1:m,j);
        end

        for l = 1 : k
          if ( b(j,l) ~= 0.0 )
            c(1:m,j) = c(1:m,j) + alpha * b(j,l) * a(1:m,l);
          end
        end

      end
%
%  Form  C := alpha*A'*B' + beta*C
%
    else

      for j = 1 : n
        for i = 1 : m

          temp = a(1:k,i)' * b(j,1:k)';

          if ( beta == 0.0 )
            c(i,j) = alpha * temp;
          else
            c(i,j) = alpha * temp + beta * c(i,j);
          end
        end
      end

    end

  end

  return
end