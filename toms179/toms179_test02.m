function toms179_test02 ( )

%% TOMS179_TEST02 demonstrates the use of MDBETA.
%
%  Modified:
%
%    30 January 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS179_TEST02:\n' );
  fprintf ( 1, '  MDBETA estimates the value of the modified Beta function.\n' );
  fprintf ( 1, '  Compare with tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X         P         Q         ' );
  fprintf ( 1, 'Beta                      Beta                    Diff\n' );
  fprintf ( 1, '                                    ' );
  fprintf ( 1, '(Tabulated)               (MDBETA)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, p, q, x, fx ] = beta_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    [ fx2, ifault ] = mdbeta ( x, p, q );

    fprintf ( 1, '  %8.4f  %8.4f  %8.4f  %24.16e  %24.16e  %10.4e\n', ...
    p, q, x, fx, fx2, abs ( fx - fx2 ) );

  end

  return
end
