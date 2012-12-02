function owens_test02 ( )

%*****************************************************************************80
%
%% TEST02 demonstrates the use of BIVNOR.
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
  fprintf ( 1, 'TEST02:\n' );
  fprintf ( 1, '  BIVNOR computes the bivariate normal probability.\n' );
  fprintf ( 1, '  Compare to tabulated values.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X             Y             ' );
  fprintf ( 1, 'R             P                         P                       DIFF\n' );
  fprintf ( 1, '                                          ' );
  fprintf ( 1, '     (Tabulated)               (BIVNOR)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, y, r, fxy1 ] = bivariate_normal_cdf_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fxy2 = bivnor ( - x, - y, r );

    fprintf ( 1, '  %12.8f  %12.8f  %12.8f  %24.16e  %24.16e  %10.4e\n', ...
    x, y, r, fxy1, fxy2, abs ( fxy1 - fxy2 ) );

  end

  return
end
