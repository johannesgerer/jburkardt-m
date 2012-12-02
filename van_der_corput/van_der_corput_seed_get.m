function seed = van_der_corput_seed_get ( )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_SEED_GET gets the seed of the van der Corput sequence.
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
%    Output, integer SEED, the current value for the seed.
%
%    Global, integer VAN_DER_CORPUT_SEED, the current seed.
%
  global van_der_corput_BASE
  global van_der_corput_SEED
%
 seed = van_der_corput_SEED;

  return
end
