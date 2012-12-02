function base = van_der_corput_base_get ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_BASE_GET gets the base of the van der Corput sequence.
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
%    Output, integer BASE, the current value for the base.
%
%    Global, integer VAN_DER_CORPUT_BASE, the current base.
%
  global van_der_corput_BASE
  global van_der_corput_SEED
%
 base = van_der_corput_BASE;

  return
end
