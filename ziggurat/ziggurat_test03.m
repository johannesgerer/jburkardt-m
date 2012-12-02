function test03 ( )

%*****************************************************************************80
%
%% TEST03 tests R4_NOR.
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
  fprintf ( 1, 'TEST03\n' );
  fprintf ( 1, '  R4_NOR returns pseudorandom normally distributed\n' );
  fprintf ( 1, '  real numbers between 0 and 1.\n' );

  [ kn, fn, wn ] = r4_nor_setup ( );

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
      [ value, seed ] = r4_nor ( seed, kn, fn, wn );
      fprintf ( 1, '  %6d  %12d  %12u  %14f\n', i, seed, seed, value );
    end

  end

  return
end
