function asa006_test02 ( )

%*****************************************************************************80
%
%% TEST02 demonstrates the use of CHOLESKY.
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
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  CHOLESKY computes the Cholesky factorization\n' );
  fprintf ( 1, '  of a positive definite symmetric matrix.\n' );
  fprintf ( 1, '  A compressed storage format is used.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we look at the Hilbert matrix\n' );
  fprintf ( 1, '  A(I,J) = 1 / ( I + J - 1 )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We expect errors to grow quickly with N.\n' );

  for n = 1 : n_max

    nn = ( n * ( n + 1 ) ) / 2;
%
%  Set A to the Hilbert matrix.
%
    k = 0;
    for i = 1 : n
      for j = 1 : i
        k = k + 1;
        a(k) = 1.0 / ( i + j - 1 );
      end
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
