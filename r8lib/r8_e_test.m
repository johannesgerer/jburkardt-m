function r8_e_test ( )

%*****************************************************************************80
%
%% R8_E_TEST tests R8_E.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_E_TEST\n' );
  fprintf ( 1, '  R8_E returns the value of E.\n' );
  fprintf ( 1, '  Compare E to (1+1/n)^n\n' );
  value1 = r8_e ( );
  fprintf ( 1, '  R8_E =      %g\n', value1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        N     Estimate      Error\n' );
  fprintf ( 1, '\n' );

  n = 1;
  for i = 0 : 20
    value2 = ( ( n + 1 ) / n ) ^ n;
    fprintf ( 1, '  %8d  %14.6g  %14.6g\n', n, value2, abs ( value1 - value2 ) );
    n = n * 2;
  end

  return
end
