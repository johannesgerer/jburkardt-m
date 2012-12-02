function van_der_corput_seed_set ( seed )

%*****************************************************************************80
%
%% VAN_DER_CORPUT_SEED_SET sets the seed of the van der Corput sequence.
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
%    Input, integer SEED, the new value for the seed.  SEED should be
%    nonnegative.  Only the integer part of SEED is used.  SEED = 0
%    is allowed, and returns R = 0.
%
%    Global, integer VAN_DER_CORPUT_SEED, the current seed.
%
  global van_der_corput_BASE
  global van_der_corput_SEED
%
  if ( seed < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'VAN_DER_CORPUT_SEED_SET - Fatal error!\n' );
    fprintf ( 1, '  Input value of SEED < 0!\n' );
    fprintf ( 1, '  SEED = %d\n', seed );
    return
  end

  van_der_corput_SEED = floor ( seed );

  return
end
