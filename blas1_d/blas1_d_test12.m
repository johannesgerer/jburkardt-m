function blas1_d_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests IDAMAX, DAXPY, DDOT, DSCAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 May 2006
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  lda = n;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  Use IDAMAX, DAXPY, DDOT and DSCAL\n' );
  fprintf ( 1, '  in a Gauss elimination routine.\n' );
  fprintf ( 1, '\n' );
%
%  Set the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = 2.0;
      elseif ( i == j + 1 )
        a(i,j) = - 1.0;
      elseif ( i == j - 1 )
        a(i,j) = - 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end
%
%  Set the right hand side.
%
  b(1:n-1) = 0.0;
  b(n) = n + 1.0;

  info = 0;

  for k = 1 : n - 1

    l = idamax ( n-k+1, a(k:n,k), 1 ) + k - 1;
    ipvt(k) = l;

    if ( a(l,k) == 0.0 )

      info = k;

    else

      if ( l ~= k )
        t = a(l,k);
        a(l,k) = a(k,k);
        a(k,k) = t;
      end

      t = -1.0 / a(k,k);
      a(k+1:n,k) = dscal ( n-k, t, a(k+1:n,k), 1 );

      for j = k+1 : n
        t = a(l,j);
        if ( l ~= k )
          a(l,j) = a(k,j);
          a(k,j) = t;
        end
        a(k+1:n,j) = daxpy ( n-k, t, a(k+1:n,k), 1, a(k+1:n,j), 1 );
      end

    end

  end

  ipvt(n) = n;
  if ( a(n,n) == 0.0 )
    info = n;
  end

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The matrix is singular.\n' );
    return
  end

  for k = 1 : n-1
    l = ipvt(k);
    t = b(l);
    if ( l ~= k )
      b(l) = b(k);
      b(k) = t;
    end
    b(k+1:n) = daxpy ( n-k, t, a(k+1:n,k)', 1, b(k+1:n), 1 );
  end

  for k = n : -1 : 1
    b(k) = b(k) / a(k,k);
    t = - b(k);
    b(1:k-1) = daxpy ( k-1, t, a(1:k-1,k)', 1, b(1:k-1), 1 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solution (should be (1,2,3,...,n)):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12f\n', b(i) );
  end

  return
end
