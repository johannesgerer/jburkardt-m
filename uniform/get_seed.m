function seed = get_seed ( )

%*****************************************************************************80
%
%% GET_SEED returns a random seed for the random number generator.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    16 November 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, integer SEED, a random seed value.
%
  time_array = clock;

  hour = time_array(4);
  minute = time_array(5);
  second = time_array(6);

  seed = second + 60 * ( minute + 60 * hour );
%
%  We want values in [1,43200], not [0,43199].
%
  seed = seed + 1;
%
%  Remap SEED from [1,43200] to [1,I_MAX].
%
  i4_huge = 2147483647;
  seed = i4_huge * ( seed  / ( 60.0 * 60.0 * 24.0 ) );

  seed = floor ( seed );
%
%  Never use a seed of 0.
%
  if ( seed == 0 )
    seed = 1;
  end

  return
end

