function asa032_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of GAMAIN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  GAMAIN computes the incomplete Gamma function.\n' );
  fprintf ( 1, '  Compare the result to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A             X             ' );
  fprintf ( 1, 'FX                        FX2\n' );
  fprintf ( 1, '                                 ' );
  fprintf ( 1, '(Tabulated)               (GAMAIN)                 DIFF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, x, fx ] = gamma_inc_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ fx2, ifault ] = gamain ( x, a );

    fprintf ( 1, '  %12.8f  %12.8f  %24.16e  %24.16e  %10.4e\n', ...
    a, x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
