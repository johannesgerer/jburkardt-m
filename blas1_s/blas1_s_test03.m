function blas1_s_test03 ( )

%*****************************************************************************80
%
%% TEST03 tests SASUM.
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
  lda = 6;
  ma = 5;
  na = 4;
  nx = 10;

  for i = 1 : nx
    x(i) = (-1.0)^i * 2 * i;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  SASUM adds the absolute values of elements of a vector.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : nx
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SASUM ( NX, X, 1 ) =   %f\n', sasum ( nx, x, 1 ) );
  fprintf ( 1, '  SASUM ( NX/2, X, 2 ) = %f\n', sasum ( nx/2, x, 2 ) );
  fprintf ( 1, '  SASUM ( 2, X, NX/2 ) = %f\n', sasum ( 2, x, nx/2 ) );

  a(1:lda,1:na) = zeros ( lda, na );

  for i = 1 : ma
    for j = 1 : na
      a(i,j) = (-1.0)^(i+j) * ( 10 * i + j );
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Demonstrate with a matrix A:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : ma
    for j = 1 : na
      fprintf ( 1, '  %12f', a(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  SASUM(MA,A(1:MA,2),1) = %f\n', sasum ( ma, a(1:ma,2), 1 ) );
  fprintf ( 1, '  SASUM(NA,A(2,1:NA),1) = %f\n', sasum ( na, a(2,1:na), 1 ) );

  return
end
