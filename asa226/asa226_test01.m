function asa226_test01 ( )

%*****************************************************************************80
%
%% TEST01 demonstrates the use of BETANC.
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
  fprintf ( 1, '  BETANC computes the noncentral incomplete beta function.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A       B   LAMBDA      X       ' );
  fprintf ( 1, 'FX                        FX2\n' );
  fprintf ( 1, '                                      ' );
  fprintf ( 1, '(Tabulated)              (BETANC)                DIFF\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, a, b, lambda, x, fx ] = beta_noncentral_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ fx2, ifault ] = betanc ( x, a, b, lambda );

    fprintf ( 1, '  %6.2f  %6.2f  %6.2f  %6.2f  %24.16e  %24.16e  %10.4e\n', ...
    a, b, lambda, x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
