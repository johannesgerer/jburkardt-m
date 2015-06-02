function elliptic_em_values_test ( )

%*****************************************************************************80
%
%% ELLIPTIC_EM_VALUES_TEST demonstrates the use of ELLIPTIC_EM_VALUES.
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
  fprintf ( 1, 'ELLIPTIC_EM_VALUES_TEST:\n' );
  fprintf ( 1, '  ELLIPTIC_EM_VALUES stores values of\n' );
  fprintf ( 1, '  the complete elliptic integral of the second\n' );
  fprintf ( 1, '  kind, with parameter modulus M.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      M            EM(M)\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, x, fx ] = elliptic_em_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %12f  %24.16f\n', x, fx );

  end

  return
end
