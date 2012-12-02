function blas1_s_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates ISAMAX.
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
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  ISAMAX returns the index of maximum magnitude;\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    x(i) = mod ( 7 * i, 11 ) - round ( n / 2 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The vector X:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %6d  %8f\n', i, x(i) );
  end

  incx = 1;

  i1 = isamax ( n, x, incx );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The index of maximum magnitude = %d\n', i1 );

  return
end
