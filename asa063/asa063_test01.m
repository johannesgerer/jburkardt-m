function asa063_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of BETAIN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  BETAIN computes the incomplete beta function.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A       B       X       ' );
  fprintf ( 1, 'FX                       FX2\n' );
  fprintf ( 1, '                              ' );
  fprintf ( 1, '(Tabulated)              (BETAIN)                DIFF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, x, fx ] = beta_inc_values ( n_data );

    if ( n_data == 0 )
      break
    end

    beta_log = alogam ( a ) ...
             + alogam ( b ) ...
             - alogam ( a + b );

    [ fx2, ifault ] = betain ( x, a, b, beta_log );

    fprintf ( 1, '  %6.2f  %6.2f  %6.2f  %24.16e  %24.16e  %10.4e\n', ...
    a, b, x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
