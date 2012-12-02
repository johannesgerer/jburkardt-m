function blas1_c_test17 ( )

%*****************************************************************************80
%
%% TEST17 tests SCNRM2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2007
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  x = [ ...
     2.0 - 1.0 * i, ...
    -4.0 - 2.0 * i, ...
     3.0 + 1.0 * i, ...
     2.0 + 2.0 * i, ...
    -1.0 - 1.0 * i ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST17\n' );
  fprintf ( 1, '  SCNRM2 returns the Euclidean norm of a complex vector.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The vector X:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  incx = 1;
  norm = scnrm2 ( n, x, incx );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The L2 norm of X is %f\n', norm );

  return
end
