function y = sgemv ( trans, m, n, alpha, a, lda, x, incx, beta, y, incy )

%*****************************************************************************80
%
%% SGEMV computes y := alpha * A * x + beta * y for general matrix A.
%
%  Discussion:
%
%    SGEMV performs one of the matrix-vector operations
%      y := alpha*A *x + beta*y
%    or
%      y := alpha*A'*x + beta*y,
%    where alpha and beta are scalars, x and y are vectors and A is an
%    m by n matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2014
%
%  Author:
%
%    Jack Dongarra, Jeremy Du Croz, Sven Hammarling,  Richard Hanson.
%
%  Parameters:
%
%    Input, character TRANS, specifies the operation to be performed:
%    'n' or 'N'   y := alpha*A *x + beta*y.
%    't' or 'T'   y := alpha*A'*x + beta*y.
%    'c' or 'C'   y := alpha*A'*x + beta*y.
%
%    Input, integer M, the number of rows of the matrix A.
%    0 <= M.
%
%    Input, integer N, the number of columns of the matrix A.
%    0 <= N.
%
%    Input, real ALPHA, the scalar multiplier for A * x.
%
%    Input, real A(LDA,N).  The M x N subarray contains
%    the matrix A.
%
%    Input, integer LDA, the the first dimension of A as declared
%    in the calling routine.  max ( 1, M ) <= LDA.
%
%    Input, real X(*), an array containing the vector to be 
%    multiplied by the matrix A.  
%    If TRANS = 'N' or 'n', then X must contain N entries, stored in INCX 
%    increments in a space of at least ( 1 + ( N - 1 ) * abs ( INCX ) ) 
%    locations.
%    Otherwise, X must contain M entries, store in INCX increments
%    in a space of at least ( 1 + ( M - 1 ) * abs ( INCX ) ) locations.
%
%    Input, integer INCX, the increment for the elements of
%    X.  INCX must not be zero.
%
%    Input, real BETA, the scalar multiplier for Y.
%
%    Input/output, real Y(*), an array containing the vector to
%    be scaled and incremented by A*X.
%    If TRANS = 'N' or 'n', then Y must contain M entries, stored in INCY
%    increments in a space of at least ( 1 + ( M - 1 ) * abs ( INCY ) ) 
%    locations.
%    Otherwise, Y must contain N entries, store in INCY increments
%    in a space of at least ( 1 + ( N - 1 ) * abs ( INCY ) ) locations.
%
%    Input, integer INCY, the increment for the elements of
%    Y.  INCY must not be zero.
%

%
%  Test the input parameters.
%
  info = 0;
  if ( ~ ( trans == 'N' || trans == 'n' || ...
           trans == 'T' || trans == 't' || ...
           trans == 'C' || trans == 'c' ) )
    info = 1;
    fprintf ( 1, 'SGEMV rejects input argument number %d\n', info );
    error ( 'SGEMV - Fatal error!' );
  end

  if ( m < 0 )
    info = 2;
    fprintf ( 1, 'SGEMV rejects input argument number %d\n', info );
    error ( 'SGEMV - Fatal error!' );
  end

  if ( n < 0 )
    info = 3;
    fprintf ( 1, 'SGEMV rejects input argument number %d\n', info );
    error ( 'SGEMV - Fatal error!' );
  end

  if ( lda < max ( 1 : m ) )
    info = 6;
    fprintf ( 1, 'SGEMV rejects input argument number %d\n', info );
    error ( 'SGEMV - Fatal error!' );
  end

  if ( incx == 0 )
    info = 8;
    fprintf ( 1, 'SGEMV rejects input argument number %d\n', info );
    error ( 'SGEMV - Fatal error!' );
  end

  if ( incy == 0 )
    info = 11;
    fprintf ( 1, 'SGEMV rejects input argument number %d\n', info );
    error ( 'SGEMV - Fatal error!' );
  end
%
%  Quick return if possible.
%
  if ( ( m == 0 ) || ...
       ( n == 0 ) || ...
       ( alpha == 0.0 && beta == 1.0 ) )
   return
  end
%
%  Set LENX and LENY, the lengths of the vectors x and y, and set
%  up the start points in X and Y.
%
  if ( trans == 'N' || trans == 'n' )
    lenx = n;
    leny = m;
  else
    lenx = m;
    leny = n;
  end

  if ( 0 < incx )
    kx = 1;
  else
    kx = 1 - ( lenx - 1 ) * incx;
  end

  if ( 0 < incy )
    ky = 1;
  else
    ky = 1 - ( leny - 1 ) * incy;
  end
%
%  Start the operations. In this version the elements of A are
%  accessed sequentially with one pass through A.
%
%  First form  y := beta*y.
%
  if ( beta ~= 1.0 )
    if ( incy == 1 )
      if ( beta == 0.0 )
        y(1:leny) = 0.0;
      else
        y(1:leny) = beta * y(1:leny);
      end
    else
      iy = ky;
      if ( beta == 0.0 )
        for i = 1 : leny
          y(iy) = 0.0;
          iy = iy + incy;
        end
      else
        for i = 1 : leny
          y(iy) = beta * y(iy);
          iy = iy + incy;
        end
      end
    end
  end

  if ( alpha == 0.0 )
    return
  end
%
%  Form y := alpha*A*x + y.
%
  if ( trans == 'N' || trans == 'n' )
    jx = kx;
    if ( incy == 1 )
      for j = 1 : n
        if ( x(jx) ~= 0.0 )
          temp = alpha * x(jx);
          for i = 1 : m
            y(i) = y(i) + temp * a(i,j);
          end
        end
        jx = jx + incx;
      end
    else
      for j = 1 : n
        if ( x(jx) ~= 0.0 )
          temp = alpha * x(jx);
          iy = ky;
          for i = 1 : m
            y(iy) = y(iy) + temp * a(i,j);
            iy = iy + incy;
          end
        end
        jx = jx + incx;
      end
    end
%
%  Form y := alpha*A'*x + y.
%
  else
    jy = ky;
    if ( incx == 1 )
      for j = 1 : n
        temp = 0.0;
        for i = 1 : m
          temp = temp + a(i,j) * x(i);
        end
        y(jy) = y(jy) + alpha * temp;
        jy = jy + incy;
      end
    else
      for j = 1 : n
        temp = 0.0;
        ix = kx;
        for i = 1 : m
          temp = temp + a(i,j) * x(ix);
          ix = ix + incx;
        end
        y(jy) = y(jy) + alpha * temp;
        jy = jy + incy;
      end
    end
  end

  return
end
