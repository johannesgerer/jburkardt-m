function van_der_corput_values_test ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_VALUES_TEST demonstrates the use of VAN_DER_CORPUT_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1,  'VAN_DER_CORPUT_VALUES_TEST:\n' );
  fprintf ( 1,  '  VAN_DER_CORPUT_VALUES stores values of\n' );
  fprintf ( 1,  '  the van der Corput sequence in a given base.\n' );
  fprintf ( 1,  '\n' );
  fprintf ( 1,  '	BASE	  SEED    VDC(BASE,SEED)\n' );
  fprintf ( 1,  '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, base, seed, value ] = van_der_corput_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %8d  %8d  %24.16e\n', base, seed, value );

  end

  return
end
