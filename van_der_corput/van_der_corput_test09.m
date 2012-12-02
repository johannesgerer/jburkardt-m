function van_der_corput_test09 ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_TEST09 tests VDC_NUMERATOR_SEQUENCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VAN_DER_CORPUT_TEST09\n' );
  fprintf ( 1, '  VDC_NUMERATOR_SEQUENCE returns N elements\n' );
  fprintf ( 1, '  of a van der Corput numerator sequence in base 2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N:  Sequence\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 20

    r = vdc_numerator_sequence ( n );
    fprintf ( 1, '  %2d:  ', n );
    for i = 1: n
      fprintf ( 1, '  %2d', r(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
