function blas1_d_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests DSCAL.
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
  n = 6;

  for i = 1 : n
    x(i) = i;
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  DSCAL multiplies a vector by a scalar.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end

  da = 5.0;
  x = dscal ( n, da, x, 1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DSCAL ( N, %f, X, 1 )\n', da );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end

  for i = 1 : n
    x(i) = i;
  end

  da = -2.0;
  x = dscal ( 3, da, x, 2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DSCAL ( 3, %f, X, 2 )\n', da );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %12f\n', i, x(i) );
  end

  return
end
