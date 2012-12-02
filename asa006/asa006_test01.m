function asa006_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of CHOLESKY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2008
%
%  Author:
%
%    John Burkardt
%
  n_max = 15;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  CHOLESKY computes the Cholesky factorization\n' );
  fprintf ( 1, '  of a positive definite symmetric matrix.\n' );
  fprintf ( 1, '  A compressed storage format is used.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we look at the matrix A which is\n' );
  fprintf ( 1, '  N+1 on the diagonal and\n' );
  fprintf ( 1, '  N   on the off diagonals.\n' );

  for n = 1 : n_max

    nn = ( n * ( n + 1 ) ) / 2;
%
%  Set A to the lower triangle of the matrix which is N+1 on the diagonal
%  and N on the off diagonals.
%
    k = 0;
    for i = 1 : n
      for j = 1 : i - 1
        k = k + 1;
        a(k) = n;
      end
      k = k + 1;
      a(k) = n + 1;
    end

    [ u, nullty, ifault ] = cholesky ( a, n, nn );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Matrix order N = %d\n', n );
    fprintf ( 1, '  Maxtrix nullity NULLTY = %d\n', nullty );

    k = 0;
    for j = 1 : n
      for i = 1 : j
        k = k + 1;
        ufull(i,j) = u(k);
      end
      for i = j + 1 : n
        ufull(i,j) = 0.0;
      end
    end
%
%  Compute U' * U and compare to A.
%
    k = 0;
    diff = 0.0;
    for i = 1 : n
      for j = 1 : i
        k = k + 1;
        utu = 0.0;
        for l = 1 : n
          utu = utu + ufull(l,i) * ufull(l,j);
        end
        diff = diff + ( a(k) - utu ) * ( a(k) - utu );
      end
    end

    diff = sqrt ( diff );

    fprintf ( 1,  '  RMS ( A - U''*U ) = %f\n', diff );
  end

  return
end
