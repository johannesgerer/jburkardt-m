function asa109_test01 ( )

%*****************************************************************************80
%
%% ASA109_TEST01 demonstrates the use of XINBTA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA109_TEST01:\n' );
  fprintf ( 1, '  XINBTA inverts the incomplete beta function.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A        B         CDF     ' );
  fprintf ( 1, ' X                         X\n' );
  fprintf ( 1, '                                 ' );
  fprintf ( 1, '(Tabulated)               (XINBTA)                DIFF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = beta_inc_values ( n_data );

    if ( n_data == 0 )
      break
    end

    beta_log = gammaln ( a ) ...
             + gammaln ( b ) ...
             - gammaln ( a + b );

    [ x2, ifault ] = xinbta ( a, b, beta_log, fx );

    fprintf ( 1, '  %6.2f  %6.2f  %10.4f  %24.16e  %24.16e  %10.4e\n', ...
      a, b, fx, x, x2, abs ( x - x2 ) );

  end

  return
end
