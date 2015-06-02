function elliptic_ka_values_test ( )

%*****************************************************************************80
%
%% ELLIPTIC_KA_VALUES_TEST demonstrates the use of ELLIPTIC_KA_VALUES.
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
  fprintf ( 1, 'ELLIPTIC_KA_VALUES_TEST:\n' );
  fprintf ( 1, '  ELLIPTIC_KA_VALUES stores values of\n' );
  fprintf ( 1, '  the complete elliptic integral of the first\n' );
  fprintf ( 1, '  kind, with parameter angle ALPHA in degrees.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ALPHA        KA(ALPHA)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = elliptic_ka_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
