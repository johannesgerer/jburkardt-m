function asa103_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of DIGAMMA.
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
  fprintf ( 1, 'TEST01:\n' );
  fprintf ( 1, '  DIGAMMA computes the Digama or Psi function.\n' );
  fprintf ( 1, '  Compare the result to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          X         ' );
  fprintf ( 1, 'FX                        FX2\n' );
  fprintf ( 1, '                    ' );
  fprintf ( 1, '(Tabulated)               (DIGAMMA)               DIFF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = psi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ fx2, ifault ] = digamma ( x );

    fprintf ( 1, '  %12.4f  %24.16e  %24.16e  %10.4e\n', ...
    x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
