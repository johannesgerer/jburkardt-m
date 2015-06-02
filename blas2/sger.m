function a = sger ( m, n, alpha, x, incx, y, incy, a, lda )

%*****************************************************************************80
%
%% SGER computes A := alpha*x*y' + A.
%
%  Discussion:
%
%    SGER performs the rank 1 operation
%
%      A := alpha*x*y' + A,
%
%    where alpha is a scalar, x is an m element vector, y is an n element
%    vector and A is an m by n matrix.
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
%    Jack Dongarra, Argonne National Lab.
%    Jeremy Du Croz, Nag Central Office.
%    Sven Hammarling, Nag Central Office.
%    Richard Hanson, Sandia National Labs.
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix A.
%    0 <= M.
%
%    Input, integer N, the number of columns of the matrix A.
%    0 <= N.
%
%    Input, real ALPHA, the scalar multiplier.
%
%    Input, real X((1+(M-1)*abs(INCX)), the first vector.
%
%    Input, integer INCX, the increment for elements of X.
%    INCX must not be zero.
%
%    Input, real Y(((1+(N-1)*abs(INCY)), the second vector.
%
%    Input, integer INCY, the increment for elements of Y.
%    INCY must not be zero.
%
%    Input/output, real A(LDA,N).  On entry, the leading M by N 
%    part of the array contains the matrix of coefficients. On exit, A is
%    overwritten by the updated matrix.
%
%    Input, integer LDA, the first dimension of A as declared
%    in the calling program. max ( 1, M ) <= LDA.
%

%
%  Test the input parameters.
%
  info = 0;
  if ( m < 0 )
    info = 1;
    fprintf ( 1, 'SGER rejects input argument number %d\n', info );
    error ( 'SGER - Fatal error!' );
  elseif ( n < 0 )
    info = 2;
    fprintf ( 1, 'SGER rejects input argument number %d\n', info );
    error ( 'SGER - Fatal error!' );
  elseif ( incx == 0 )
    info = 5;
    fprintf ( 1, 'SGER rejects input argument number %d\n', info );
    error ( 'SGER - Fatal error!' );
  elseif ( incy == 0 )
    info = 7;
    fprintf ( 1, 'SGER rejects input argument number %d\n', info );
    error ( 'SGER - Fatal error!' );
  elseif ( lda < max ( 1, m ) )
    info = 9;
    fprintf ( 1, 'SGER rejects input argument number %d\n', info );
    error ( 'SGER - Fatal error!' );
  end
%
%  Quick return if possible.
%
  if ( ( m == 0 ) || ( n == 0 ) || ( alpha == 0.0 ) )
    return;
  end
%
%  Start the operations. In this version the elements of A are
%  accessed sequentially with one pass through A.
%
  if ( 0 < incy )
    jy = 1;
  else
    jy = 1 - ( n - 1 ) * incy;
  end

  if ( incx == 1 )
    for j = 1 : n
      if ( y(jy) ~= 0.0 )
        temp = alpha * y(jy);
        a(1:m,j) = a(1:m,j) + x(1:m) * temp;
      end
      jy = jy + incy;
    end
  else
    if ( 0 < incx )
      kx = 1;
    else
      kx = 1 - ( m - 1 ) * incx;
    end
    for j = 1 : n
      if ( y(jy) ~= 0.0 )
        temp = alpha * y(jy);
        ix = kx;
        for i = 1 : m
          a(i,j) = a(i,j) + x(ix) * temp;
          ix = ix + incx;
        end
      end
      jy = jy + incy;
    end
  end

  return
end
