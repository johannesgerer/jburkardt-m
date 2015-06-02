function blas2_test06 ( )

%*****************************************************************************80
%
%% BLAS2_TEST06 tests DTRMV.
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
%    John Burkardt
%
  m = 5;
  lda = m;
  n = m;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLAS2_TEST06\n' );
  fprintf ( 1, '  For a triangular matrix A,\n' );
  fprintf ( 1, '  DTRMV computes y := A * x or y := A'' * x\n' );

  for test = 1 : 2

    uplo = 'U';

    if ( test == 1 )
      trans = 'N';
    else
      trans = 'T';
    end

    diag = 'N';

    for j = 1 : n
      for i = 1 : j
        a(i,j) = i + j;
      end
      for i = j + 1 : m
        a(i,j) = 0.0;
      end
    end

    incx = 1;
    for i = 1 : n
      x(i) = i;
    end

    x = dtrmv ( uplo, trans, diag, n, a, lda, x, incx );

    if ( trans == 'N' )
      r8vec_print ( n, x, '  Result y = A * x' );
    else
      r8vec_print ( n, x, '  Result y = A'' * x' );
    end

  end

  return
end
