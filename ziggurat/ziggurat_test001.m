function test001 ( )

%*****************************************************************************80
%
%% TEST001 tests SHR3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2013
%
%  Author:
%
%    John Burkardt
%
  u32_max_half = uint32 ( 2147483648 );
  u32_max      = uint32 ( 4294967296 );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  SHR3 returns pseudorandom uniformly distributed\n' );
  fprintf ( 1, '  unsigned 32 bit integers.\n' );

  for j = 0 : 2

    if ( mod ( j, 2 ) == 0 )
      seed = uint32 ( 123456789 );
    else
      seed = uint32 ( 987654321 );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %6d  %14u\n', 0, seed );
    fprintf ( 1, '\n' );

    for i = 1 : 10
      [ value, seed ] = shr3 ( seed );
      if ( seed < u32_max_half )
        sseed = seed;
      else
        sseed = - int32 ( u32_max - seed ) + 1;
      end
      fprintf ( 1, '  %6d  %12d  %12u  %12u\n', i, sseed, seed, value );
    end

  end

  return
end
