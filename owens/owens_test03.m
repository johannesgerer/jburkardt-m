function owens_test03 ( )

%*****************************************************************************80
%
%% TEST03 demonstrates the use of ZNORM1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST03:\n' );
  fprintf ( 1, '  ZNORM1 computes the normal CDF starting at 0.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          X           P                         P                       DIFF\n' );
  fprintf ( 1, '                     (Tabulated)               (ZNORM1)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = normal_01_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx1 = fx1 - 0.5;

    fx2 = znorm1 ( x );

    fprintf ( 1, '  %12.8f  %24.16e  %24.16e  %10.4e\n', ...
    x, fx1, fx2, abs ( fx1 - fx2 ) );

  end

  return
end
