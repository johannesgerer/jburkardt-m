function b = strmm ( side, uplo, transa, diag, m, n, alpha, a, lda, b, ldb )

%*****************************************************************************80
%
%% STRMM performs B:=A*B or B:=B*A, A triangular, B rectangular.
%
%  Discussion:
%
%    This routine performs one of the matrix-matrix operations
%      B := alpha*op( A )*B,   or   B := alpha*B*op( A ),
%    where  alpha  is a scalar,  B  is an m by n matrix,  A  is a unit, or
%    non-unit,  upper or lower triangular matrix  and  op( A )  is one  of
%      op( A ) = A   or   op( A ) = A'.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 April 2014
%
%  Author:
%
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, character SIDE, specifies whether op(A) multiplies B from
%    the left or right as follows:
%    'L' or 'l': B := alpha*op( A )*B.
%    'R' or 'r': B := alpha*B*op( A ).
%
%    Input, character UPLO, specifies whether the matrix A is an upper or
%    lower triangular matrix as follows:
%    'U' or 'u': A is an upper triangular matrix.
%    'L' or 'l': A is a lower triangular matrix.
%
%    Input, character TRANS, specifies the form of op( A ) to be used in
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
%    Input, integer N, the number of columns of B.  
%    0 <= N.
%
%    Input, real ALPHA, the scalar  alpha.  When alpha is
%    0.0, A is not referenced and B need not be set before entry.
%
%    Input, real A(LDA,K), where k is m when  SIDE = 'L' or 'l'  
%    and is  n  when  SIDE = 'R' or 'r'.
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
%    in the calling program.  When SIDE = 'L' or 'l' then LDA must be at 
%    least max ( 1, M ); when SIDE = 'R' or 'r', LDA must be at least 
%    max ( 1, N ).
%
%    Input/output, real B(LDB,N).
%    Before entry, the leading m by n part of the array  B must contain 
%    the matrix  B, and on exit is overwritten by the transformed matrix.
%
%    Input, integer LDB, the first dimension of B as declared
%    in  the  calling program.   max ( 1, M ) <= LDB.
%

%
%  Test the input parameters.
%
  lside  = lsame ( side  , 'l' );

  if ( lside )
    nrowa = m;
  else
    nrowa = n;
  end

  nounit = lsame ( diag, 'n' );
  upper = lsame ( uplo, 'u' );

  info = 0;
  if ( ( ~ lside ) && ( ~ lsame ( side, 'r' ) ) )
    info = 1;
  elseif ( ( ~ upper ) && ( ~ lsame ( uplo, 'l' ) ) )
    info = 2;
  elseif ( ( ~ lsame ( transa, 'n' ) ) && ( ~ lsame ( transa, 't' ) ) && ...
           ( ~ lsame ( transa, 'c' ) ) )
    info = 3;
  elseif ( ( ~ lsame ( diag, 'u' ) ) && ( ~ lsame ( diag, 'n' ) ) )
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
    xerbla ( 'STRMM', info );
    return
  end
%
%  Quick return if possible.
%
  if ( n == 0 )
    return
  end
%
%  And when alpha is 0.0.
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
%  Form  B := alpha*A*B.
%
    if ( lsame ( transa, 'n' ) )

      if ( upper )
        for j = 1 : n
          for k = 1 : m
            if ( b(k,j) ~= 0.0 )
              temp = alpha * b(k,j);
              for i = 1 : k - 1
                b(i,j) = b(i,j) + temp * a(i,k);
              end
              if ( nounit )
                temp = temp * a(k,k);
              end
              b(k,j) = temp;
            end
          end
        end
      else
        for j = 1 : n
          for k = m : -1 : 1
            if ( b(k,j) ~= 0.0 )
              temp = alpha * b(k,j);
              b(k,j) = temp;
              if ( nounit )
                b(k,j) = b(k,j) * a(k,k);
              end
              for i = k + 1 : m
                b(i,j) = b(i,j) + temp * a(i,k);
              end
            end
          end
        end
      end
%
%  Form  B := alpha*A'*B.
%
    else

      if ( upper )
        for j = 1 : n
          for i = m :-1 : 1
            temp = b(i,j);
            if ( nounit )
              temp = temp * a(i,i);
            end
            for k = 1 : i - 1
              temp = temp + a(k,i) * b(k,j);
            end
            b(i,j) = alpha * temp;
          end
        end
      else
        for j = 1 : n
          for i = 1 : m
            temp = b(i,j);
            if ( nounit )
              temp = temp * a(i,i);
            end
            for k = i + 1 : m
              temp = temp + a(k,i) * b(k,j);
            end
            b(i,j) = alpha * temp;
          end
        end
      end
    end
%
%  Form  B := alpha*B*A.
%
  else

    if ( lsame ( transa, 'n' ) )

      if ( upper )

        for j = n : -1 : 1
          temp = alpha;
          if ( nounit )
            temp = temp * a(j,j);
          end
          for i = 1 : m
            b(i,j) = temp * b(i,j);
          end
          for k = 1 : j - 1
            if ( a(k,j) ~= 0.0 )
              temp = alpha * a(k,j);
              for i = 1 : m
                b(i,j) = b(i,j) + temp * b(i,k);
              end
            end
          end
        end

      else

        for j = 1 : n
          temp = alpha;
          if ( nounit )
            temp = temp * a(j,j);
          end
          for i = 1 : m
            b(i,j) = temp * b(i,j);
          end
          for k = j + 1 : n
            if ( a(k,j) ~= 0.0 )
              temp = alpha * a(k,j);
              for i = 1 : m
                b(i,j) = b(i,j) + temp * b(i,k);
              end
            end
          end
        end

      end
%
%  Form  B := alpha*B*A'.
%
    else

      if ( upper )
 
        for k = 1 : n
          for j = 1 : k - 1
            if ( a(j,k) ~= 0.0 )
              temp = alpha * a(j,k);
              for i = 1 : m
                b(i,j) = b(i,j) + temp * b(i,k);
              end
            end
          end
          temp = alpha;
          if ( nounit )
            temp = temp * a(k,k);
          end
          if ( temp ~= 1.0 )
            for i = 1 : m
              b(i,k) = temp * b(i,k);
            end
          end
        end

      else

        for k = n : -1 : 1
          for j = k + 1 : n
            if ( a(j,k) ~= 0.0 )
              temp = alpha * a(j,k);
              for i = 1 : m
                b(i,j) = b(i,j) + temp * b(i,k);
              end
            end
          end
          temp = alpha;
          if ( nounit )
            temp = temp * a(k,k);
          end
          if ( temp ~= 1.0 )
            for i = 1 : m
              b(i,k) = temp * b(i,k);
            end
          end
        end

      end

    end

  end

  return
end
