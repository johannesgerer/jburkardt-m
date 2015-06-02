function b = dtrsm ( side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb )

%*****************************************************************************80
%
%% DTRSM solves A*X=alpha*B or X*A=alpha*B, for triangular A, rectangular B.
%
%  Discussion:
%
%    DTRSM solves one of the matrix equations
%      op( A )*X = alpha*B,   
%    or
%      X*op( A ) = alpha*B,
%    where alpha is a scalar, X and B are m by n matrices, A is a unit, or
%    non-unit,  upper or lower triangular matrix  and  op( A )  is one  of
%      op( A ) = A   or   op( A ) = A'.
%    The matrix X is overwritten on B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 June 2005
%
%  Author:
%
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, character SIDE, specifies whether op( A ) appears on the left
%    or right of X as follows:
%    'L' or 'l': op( A )*X = alpha*B.
%    'R' or 'r': X*op( A ) = alpha*B.
%
%    Input, character UPLO, specifies whether the matrix A is an upper or
%    lower triangular matrix as follows:
%    'U' or 'u': A is an upper triangular matrix.
%    'L' or 'l': A is a lower triangular matrix.
%
%    Input, character TRANSA, specifies the form of op( A ) to be used in
%    the matrix multiplication as follows:
%    'N' or 'n': op( A ) = A.
%    'T' or 't': op( A ) = A'.
%    'C' or 'c': op( A ) = A'.
%
%    Input, character DIAG, specifies whether or not A is unit triangular
%    as follows:
%    'U' or 'u': A is assumed to be unit triangular.
%    'N' or 'n': A is not assumed to be unit triangular.
%
%    Input, integer M, the number of rows of B.  0 <= M.
%
%    Input, integer N, the number of columns of B.  0 <= N.
%
%    Input, real ALPHA, the scalar alpha.  When alpha is
%    0.0 then A is not referenced and B need not be set before entry.
%
%    Input, real A(LDA,K) where K is M when SIDE = 'L' or 'l'  
%    and K is N when SIDE = 'R' or 'r'.
%    Before entry  with  UPLO = 'U' or 'u',  the  leading  k by k
%    upper triangular part of the array  A must contain the upper
%    triangular matrix  and the strictly lower triangular part of
%    A is not referenced.
%    Before entry  with  UPLO = 'L' or 'l',  the  leading  k by k
%    lower triangular part of the array  A must contain the lower
%    triangular matrix  and the strictly upper triangular part of
%    A is not referenced.
%    Note that when  DIAG = 'U' or 'u',  the diagonal elements of
%    A  are not referenced either,  but are assumed to be  unity.
%
%    Input, integer LDA, the first dimension of A as declared
%    in the calling (sub) program.  When  SIDE = 'L' or 'l'  then
%    LDA  must be at least  max( 1, m ),  when  SIDE = 'R' or 'r'
%    then LDA must be at least max( 1, n ).
%
%    Input/output, real B(LDB,N).
%    Before entry, the leading m by n part of the array B must
%    contain the right-hand side matrix B, and on exit is
%    overwritten by the solution matrix X.
%
%    Input, integer LDB, the first dimension of B as declared
%    in the calling program.  LDB must be at least max ( 1, M ).
%

%
%  Test the input parameters.
%
  lside  = lsame ( side, 'L' );

  if ( lside )
    nrowa = m;
  else
    nrowa = n;
  end

  nounit = lsame ( diag, 'N' );
  upper = lsame ( uplo, 'U' );

  info = 0;

  if (      ( ~ lside ) && ...
            ( ~ lsame ( side, 'R' ) ) )
    info = 1;
  elseif ( ( ~ upper ) && ...
            ( ~ lsame ( uplo, 'L' ) ) )
    info = 2;
  elseif ( ( ~ lsame ( transa, 'N' ) ) && ...
            ( ~ lsame ( transa, 'T' ) ) && ...
            ( ~ lsame ( transa, 'C' ) ) )
    info = 3;
  elseif ( ( ~ lsame ( diag, 'U' ) ) && ...
            ( ~ lsame ( diag, 'N' ) ) )
    info = 4;
  elseif ( m < 0 )
    info = 5;
  elseif ( n < 0 )
    info = 6;
  elseif ( lda < max ( 1, nrowa ) )
    info = 9;
  elseif ( ldb < max ( 1, m ) )
    info = 11;
  end

  if ( info ~= 0 )
    xerbla ( 'DTRSM', info );
    return
  end
%
%  Quick return if possible.
%
  if ( n == 0 )
    return;
  end
%
%  and when alpha is 0.0.
%
  if ( alpha == 0.0 )
    b(1:m,1:n) = 0.0;
    return
  end
%
%  Start the operations.
%
  if ( lside )
%
%  Form  B := alpha*inv( a )*B.
%
    if ( lsame ( transa, 'N' ) )

      if ( upper )
        for j = 1 : n
          if ( alpha ~= 1.0 )
            for i = 1 : m
              b(i,j) = alpha * b(i,j);
            end
          end
          for k = m : -1 : 1
            if ( b(k,j) ~= 0.0 )
              if ( nounit )
                b(k,j) = b(k,j) / a(k,k);
              end
              for i = 1 : k - 1
                b(i,j) = b(i,j) - b(k,j) * a(i,k);
              end
            end
          end
        end
      else
        for j = 1 : n
          if ( alpha ~= 1.0 )
            for i = 1 : m
              b(i,j) = alpha * b(i,j);
            end
          end
          for k = 1 : m
            if ( b(k,j) ~= 0.0 )
              if ( nounit )
                b(k,j) = b(k,j) / a(k,k);
              end
              for i = k + 1 : m
                b(i,j) = b(i,j) - b(k,j) * a(i,k);
              end
            end
          end
        end
      end
%
%  Form  B := alpha*inv( A' )*B.
%
    else

      if ( upper )
        for j = 1 : n
          for i = 1 : m
            temp = alpha * b(i,j);
            for k = 1 : i - 1
              temp = temp - a(k,i) * b(k,j);
            end
            if ( nounit )
              temp = temp / a(i,i);
            end
            b(i,j) = temp;
          end
        end
      else
        for j = 1, n
          for i = m : -1 : 1
            temp = alpha * b(i,j);
            for k = i + 1 : m
              temp = temp - a(k,i) * b(k,j);
            end
            if ( nounit )
              temp = temp / a(i,i);
            end
            b(i,j) = temp;
          end
        end
      end
    end
%
%  Form  B := alpha*B*inv( A ).
%
  else

    if ( lsame ( transa, 'N' ) )

      if ( upper )

        for j = 1 : n
          if ( alpha ~= 1.0 )
            for i = 1 : m
              b(i,j) = alpha * b(i,j);
            end
          end
          for k = 1 : j - 1
            if ( a(k,j) ~= 0.0 )
              for i = 1 : m
                b(i,j) = b(i,j) - a(k,j) * b(i,k);
              end
            end
          end
          if ( nounit )
            temp = 1.0 / a(j,j);
            for i = 1 : m
              b(i,j) = temp * b(i,j);
            end
          end
        end

      else

        for j = n : -1 : 1
          if ( alpha ~= 1.0 )
            for i = 1 : m
              b(i,j) = alpha * b(i,j);
            end
          end
          for k = j + 1 : n
            if ( a(k,j) ~= 0.0 )
              for i = 1 : m
                b(i,j) = b(i,j) - a(k,j) * b(i,k);
              end
            end
          end
          if ( nounit )
            temp = 1.0 / a(j,j);
            for i = 1 : m
              b(i,j) = temp * b(i,j);
            end
          end
        end
      end
%
%  Form  B := alpha*B*inv( A' ).
%
    else

      if ( upper )
        for k = n : -1 : 1
          if ( nounit )
            temp = 1.0 / a(k,k);
            for i = 1 : m
              b(i,k) = temp * b(i,k);
            end
          end
          for j = 1 : k - 1
            if ( a(j,k) ~= 0.0 )
              temp = a(j,k);
              for i = 1 : m
                b(i,j) = b(i,j) - temp * b(i,k);
              end
            end
          end
          if ( alpha ~= 1.0 )
            for i = 1 : m
              b(i,k) = alpha * b(i,k);
            end
          end
        end
      else
        for k = 1 : n
          if ( nounit )
            temp = 1.0 / a(k,k);
            for i = 1 : m
              b(i,k) = temp * b(i,k);
            end
          end
          for j = k + 1 : n
            if ( a(j,k) ~= 0.0 )
              temp = a(j,k);
              for i = 1 : m
                b(i,j) = b(i,j) - temp * b(i,k);
              end
            end
          end
          if ( alpha ~= 1.0 )
            for i = 1 : m
              b(i,k) = alpha * b(i,k);
            end
          end
        end
      end
    end
  end

  return
end
