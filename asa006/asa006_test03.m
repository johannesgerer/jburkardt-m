function asa006_test03 ( )

%*****************************************************************************80
%
%% TEST03 demonstrates the use of SUBCHL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 February 2008
%
%  Author:
%
%    John Burkardt
%
  n_max = 15;
  nn_max = (n_max*(n_max+1))/2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03:\n' );
  fprintf ( 1, '  SUBCHL computes the Cholesky factor\n' );
  fprintf ( 1, '  of a submatrix\n' );
  fprintf ( 1, '  of a positive definite symmetric matrix.\n' );
  fprintf ( 1, '  A compressed storage format is used.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Here we look at the Hilbert matrix\n' );
  fprintf ( 1, '  A(I,J) = 1/(I+J-1).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For this particular matrix, we expect the\n' );
  fprintf ( 1, '  errors to grow rapidly.\n' );
%
%  Set A to the N_MAX order Hilbert matrix.
%
  k = 0;
  for i = 1 : n_max
    for j = 1 : i
      k = k + 1;
      a(k) = 1.0 / ( i + j - 1 );
    end
  end

  for n = 1 : n_max

    for i = 1 : n
      b(i) = i;
    end

    [ u, nullty, ifault, det ] = subchl ( a, b, n, nn_max );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Matrix order N = %d\n', n );
    fprintf ( 1, '  Matrix nullity NULLTY = %d\n', nullty );
    fprintf ( 1, '  Matrix determinant DET = %e\n', det );

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
        diff = diff + ( a(k) - utu )^2;
      end
    end

    diff = sqrt ( diff );

    fprintf ( 1, '  RMS ( A - U''*U ) = %f\n', diff );
  end

  return
end
