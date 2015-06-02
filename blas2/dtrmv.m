function x = dtrmv ( uplo, trans, diag, n, a, lda, x, incx )

%*****************************************************************************80
%
%% DTRMV computes x: = A*x or x = A'*x for a triangular matrix A.
%
%  Discussion:
%
%    DTRMV performs one of the matrix-vector operations
%
%      x := A*x,   or   x := A'*x,
%
%    where x is an n element vector and  A is an n by n unit, or non-unit,
%    upper or lower triangular matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 April 2014
%
%  Author:
%
%    This MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, character UPLO, specifies whether the matrix is an upper or
%    lower triangular matrix as follows:
%    'u' or 'U': A is an upper triangular matrix.
%    'l' or 'L': A is a lower triangular matrix.
%
%    Input, character TRANS, specifies the operation to be performed as
%    follows:
%    'n' or 'N': x := A*x.
%    't' or 'T': x := A'*x.
%    'c' or 'C': x := A'*x.
%
%    Input, character DIAG, specifies whether or not A is unit
%    triangular as follows:
%    'u' or 'U': A is assumed to be unit triangular.
%    'n' or 'N': A is not assumed to be unit triangular.
%
%    Input, integer N, the order of the matrix A.
%    0 <= N.
%
%    Input, real A(LDA,N).
%    Before entry with  UPLO = 'u' or 'U', the leading n by n
%    upper triangular part of the array A must contain the upper
%    triangular matrix and the strictly lower triangular part of
%    A is not referenced.
%    Before entry with UPLO = 'l' or 'L', the leading n by n
%    lower triangular part of the array A must contain the lower
%    triangular matrix and the strictly upper triangular part of
%    A is not referenced.
%    Note that when  DIAG = 'u' or 'U', the diagonal elements of
%    A are not referenced either, but are assumed to be unity.
%
%    Input, integer LDA, the first dimension of A as declared
%    in the calling program. max ( 1, N ) <= LDA.
%
%    Input/output, real X(1+(N-1)*abs( INCX)).
%    Before entry, the incremented array X must contain the n
%    element vector x. On exit, X is overwritten with the
%    tranformed vector x.
%
%    Input, integer INCX, the increment for the elements of
%    X.  INCX must not be zero.
%

%
%  Test the input parameters.
%
  info = 0;
  if  ( ~ lsame ( uplo , 'U' ) && ~ lsame ( uplo , 'L' ) )
    info = 1;
  elseif ( ~ lsame ( trans, 'N' ) && ~ lsame ( trans, 'T' ) && ...
            ~ lsame ( trans, 'C' ) )
    info = 2;
  elseif ( ~ lsame ( diag , 'U' ) && ~ lsame ( diag , 'N' ) )
    info = 3;
  elseif ( n < 0 )
    info = 4;
  elseif ( lda < max ( 1, n ) )
    info = 6;
  elseif ( incx == 0 )
    info = 8;
  end

  if ( info ~= 0 )
    xerbla ( 'DTRMV', info );
    return
  end
%
%  Quick return if possible.
%
  if ( n == 0 )
    return
  end

  nounit = lsame ( diag, 'N' );
%
%  Set up the start point in X if the increment is not unity. This
%  will be  ( N - 1 ) * INCX  too small for descending loops.
%
  if ( incx <= 0 )
    kx = 1 - ( n - 1 ) * incx;
  elseif ( incx ~= 1 )
    kx = 1;
  end
%
%  Start the operations. In this version the elements of A are
%  accessed sequentially with one pass through A.
%
  if ( lsame ( trans, 'N' ) )
%
%  Form x := A*x.
%
    if ( lsame ( uplo, 'U' ) )
      if ( incx == 1 )
        for j = 1 : n
          if ( x(j) ~= 0.0 )
            temp = x(j);
            for i = 1 : j - 1
              x(i) = x(i) + temp * a(i,j);
            end
            if ( nounit )
              x(j) = x(j) * a(j,j);
            end
          end
        end
      else
        jx = kx;
        for j = 1 : n
          if ( x(jx) ~= 0.0 )
            temp = x(jx);
            ix = kx;
            for i = 1 : j - 1
              x(ix) = x(ix) + temp * a(i,j);
              ix = ix + incx;
            end
            if ( nounit )
              x(jx) = x(jx) * a(j,j);
            end
          end
          jx = jx + incx;
        end
      end
    else
      if ( incx == 1 )
        for j = n : -1 : 1
          if ( x(j) ~= 0.0 )
            temp = x(j);
            for i = n : -1 : j + 1
              x(i) = x(i) + temp * a(i,j);
            end
            if ( nounit )
              x(j) = x(j) * a(j,j);
            end
          end
        end
      else
        kx = kx + ( n - 1 ) * incx;
        jx = kx;
        for j = n : -1 : 1
          if ( x(jx) ~= 0.0 )
            temp = x(jx);
            ix = kx;
            for i = n : -1 : j + 1
              x(ix) = x(ix) + temp * a(i,j);
              ix = ix - incx;
            end
            if ( nounit )
              x(jx) = x(jx) * a(j,j);
            end
          end
          jx = jx - incx;
        end
      end
    end
%
%  Form x := A'*x.
%
  else
    if ( lsame ( uplo, 'U' ) )
      if ( incx == 1 )
        for j = n : -1 : 1
          temp = x(j);
          if ( nounit )
            temp = temp * a(j,j);
          end
          for i = j - 1 : -1 : 1
            temp = temp + a(i,j) * x(i);
          end
          x(j) = temp;
        end
      else
        jx = kx + ( n - 1 ) * incx;
        for j = n : -1 : 1
          temp = x(jx);
          ix = jx;
          if ( nounit )
            temp = temp * a(j,j);
          end
          for i = j - 1 : -1 : 1
            ix = ix   - incx;
            temp = temp + a(i,j) * x(ix);
          end
          x(jx) = temp;
          jx = jx - incx;
        end
      end
    else
      if ( incx == 1 )
        for j = 1 : n
          temp = x(j);
          if ( nounit )
            temp = temp * a(j,j);
          end
          for i = j + 1 : n
            temp = temp + a(i,j) * x(i);
          end
          x(j) = temp;
        end
      else
        jx = kx;
        for j = 1 : n
          temp = x(jx);
          ix = jx;
          if ( nounit )
            temp = temp * a(j,j);
          end
          for i = j + 1 : n
            ix = ix + incx;
            temp = temp + a(i,j) * x(ix);
          end
          x(jx) = temp;
          jx = jx + incx;
        end
      end
    end
  end

  return
end
