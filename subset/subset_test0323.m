function subset_test0323 ( )

%*****************************************************************************80
%
%% TEST0323 tests I4_BTEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  test_num = 2;
  i4_test = [ 101, -31 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0323\n' );
  fprintf ( 1, '  I4_BTEST reports whether a given bit is 0 or 1.\n' );

  for test = 1 : test_num

    i4 = i4_test(test);

    ivec = i4_to_bvec ( i4, 32 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Analyze the integer I4 = %d\n', i4 );
    fprintf ( 1, '\n' );
    fprintf ( 1, '       Pos     Digit  I4_BTEST\n' );
    fprintf ( 1, '\n' );

    for pos = 0 : 31
  
      j1 = i4_btest ( i4, pos );

      fprintf ( 1, '  %8d  %8d  %8d\n', pos, ivec(pos+1), j1 );

    end

  end

  return
end
