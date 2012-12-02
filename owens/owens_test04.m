function owens_test04 ( )

%*****************************************************************************80
%
%% TEST04 demonstrates the use of ZNORM2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 November 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST04:\n' );
  fprintf ( 1, '  ZNORM2 computes the complementary normal CDF.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '          X           P                         P                       DIFF\n' );
  fprintf ( 1, '                     (Tabulated)               (ZNORM2)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx1 ] = normal_01_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fx1 = 1.0 - fx1;

    fx2 = znorm2 ( x );

    fprintf ( 1, '  %12.8f  %24.16e  %24.16e  %10.4e\n', ...
    x, fx1, fx2, abs ( fx1 - fx2 ) );

  end

  return
end
