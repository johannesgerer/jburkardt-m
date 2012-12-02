function unicycle_test01 ( )

%*****************************************************************************80
%
%% UNICYCLE_TEST01 tests PERM_IS_UNICYCLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 June 2012
%
%  Author:
%
%    John Burkardt
%
  n = 5;
  test_num = 10;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'UNICYCLE_TEST01\n' );
  fprintf ( 1, '  PERM_IS_UNICYCLE determines whether a permutation\n' );
  fprintf ( 1, '  is a unicyle\n' );

  for test = 1 : test_num

    [ p, seed ] = perm_random ( n, seed );

    value = perm_is_unicycle ( n, p );

    if ( value )

      perm_print ( n, p, '  This permutation is a unicycle' );
      u = unicycle_index_to_sequence ( n, p );
      unicycle_print ( n, u, '  The permutation in sequence form' );

    else

      perm_print ( n, p, '  This permutation is NOT a unicycle' );

    end

  end

  return
end
