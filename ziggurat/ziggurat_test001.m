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
%    06 May 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  SHR3 returns pseudorandom uniformly distributed\n' );
  fprintf ( 1, '  integers.\n' );

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
      [ value, seed ] = shr3 ( seed );
      fprintf ( 1, '  %6d  %12d  %12u  %12u\n', i, seed, seed, value );
    end

  end

  return
end
