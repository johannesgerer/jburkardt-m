function asa245_test03 ( )

%*****************************************************************************80
%
%% ASA245_TEST03 demonstrates the use of GAMMA_LN.
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
  fprintf ( 1, 'ASA245_TEST03:\n' );
  fprintf ( 1, '  GAMMALN computes the logarithm of the\n' );
  fprintf ( 1, '  Gamma function.\n' );
  fprintf ( 1, '  GAMMALN is a builtin function in MATLAB.\n' );
  fprintf ( 1, '  We compare the result to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          X                     ' );
  fprintf ( 1, 'FX                        FX2\n' );
  fprintf ( 1, '                                ' );
  fprintf ( 1, '(Tabulated)               (GAMMALN)                DIFF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = gamma_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx2 = gammaln ( x );

    fprintf ( 1, '  %24.16f  %24.16e  %24.16e  %10.4e\n', ...
    x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
