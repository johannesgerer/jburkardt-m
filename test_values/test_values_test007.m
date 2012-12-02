function test_values_test007 ( )

%*****************************************************************************80
%
%% TEST007 demonstrates the use of AIRY_BI_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST007:\n' );
  fprintf ( 1, '  AIRY_BI_VALUES stores values of \n' );
  fprintf ( 1, '  the Airy function Bi(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           Bi(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, bi ] = airy_bi_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, bi );

  end

  return
end
