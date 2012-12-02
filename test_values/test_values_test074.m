function test_values_test074 ( )

%*****************************************************************************80
%
%% TEST074 demonstrates the use of FRESNEL_COS_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST074:\n' );
  fprintf ( 1, '  FRESNEL_COS_VALUES stores values of\n' );
  fprintf ( 1, '  the Fresnel cosine integral C(X).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           C(X)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = fresnel_cos_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
