function blas1_c_test15 ( )

%*****************************************************************************80
%
%% TEST15 tests ICAMAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2006
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  x = [ ...
      2.0 - 1.0 * i, ...
    - 4.0 - 2.0 * i, ...
      3.0 + 1.0 * i, ...
      2.0 + 2.0 * i, ...
    - 1.0 - 1.0 * i ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST15\n' );
  fprintf ( 1, '  ICAMAX returns the index of the entry of\n' );
  fprintf ( 1, '  maximum magnitude in a complex vector.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The entries and CABS1 magnitudes:\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f  %10f\n', ...
      j, real ( x(j) ), imag ( x(j) ), cabs1 ( x(j) ) );
  end

  incx = 1;
  j = icamax ( n, x, incx );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The index of maximum magnitude = %d\n', j );

  return
end
