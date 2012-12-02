function van_der_corput_base_set ( base )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_BASE_SET sets the base of the van der Corput sequence.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 February 2003
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Johannes van der Corput,
%    Verteilungsfunktionen I & II,
%    Nederl. Akad. Wetensch. Proc.,
%    Volume 38, 1935, pages 813-820, pages 1058-1066.
%
%  Parameters:
%
%    Input, integer BASE, the new value for the base.  BASE should be
%    greater than 1.  Only the integer part of BASE is used.
%
%    Global, integer VAN_DER_CORPUT_BASE, the current base.
%
  global van_der_corput_BASE
  global van_der_corput_SEED
%
  if ( floor ( base ) <= 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VAN_DER_CORPUT_BASE_SET - Fatal error!\n' );
    fprintf ( 1, '  Input value of BASE <= 1!\n' );
    fprintf ( 1, '  BASE = %d\n', base );
    return
  end

 van_der_corput_BASE = floor ( base );

  return
end
