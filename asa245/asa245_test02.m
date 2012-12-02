function asa245_test02 ( )

%*****************************************************************************80
%
%% TEST02 demonstrates the use of LNGAMMA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  LNGAMMA computes the logarithm of the\n' );
  fprintf ( 1, '  Gamma function.  We compare the result\n' );
  fprintf ( 1, '  to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          X                     ' );
  fprintf ( 1, 'FX                        FX2\n' );
  fprintf ( 1, '                                ' );
  fprintf ( 1, '(Tabulated)               (LNGAMMA)                DIFF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = gamma_log_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ fx2, ier ] = lngamma ( x );

    fprintf ( 1, '  %24.16f  %24.16e  %24.16e  %10.4e\n', ...
    x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
