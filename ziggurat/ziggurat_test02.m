function test02 ( )

%*****************************************************************************80
%
%% TEST02 tests R4_UNI.
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
  fprintf ( 1, 'TEST02\n' );
  fprintf ( 1, '  R4_UNI returns pseudorandom uniformly distributed\n' );
  fprintf ( 1, '  real numbers between 0 and 1.\n' );

  for j = 0 : 2

    if ( mod ( j, 2 ) == 0 )
      seed = uint32 ( 123456789 );
    else
      seed = uint32 ( 987654321 );
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %6d  %12u\n', 0, seed );
    fprintf ( 1, '\n' );

    for i = 1 : 10
      [ value, seed ] = r4_uni ( seed );
      if ( seed < u32_max_half )
        sseed = seed;
      else
        sseed = - int32 ( u32_max - seed ) + 1;
      end
      fprintf ( 1, '  %6d  %12d  %12u  %f\n', i, sseed, seed, value );
    end

  end

  return
end
