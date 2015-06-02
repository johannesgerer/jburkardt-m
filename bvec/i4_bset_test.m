function i4_bset_test ( )

%*****************************************************************************80
%
%% I4_BSET_TEST tests I4_BSET.
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
  fprintf ( 1, 'TEST03225\n' );
  fprintf ( 1,'  I4_BSET sets a given bit to 0.\n' );

  for test = 1 : test_num

    i4 = i4_test(test);

    ivec = i4_to_bvec ( i4, 32 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Working on I4 = %d\n', i4 );
    fprintf ( 1, '\n' );
    fprintf ( 1, '       Pos     Digit       I4_BSET\n' );
    fprintf ( 1, '\n' );

    for pos = 0 : 31
  
      j1 = i4_bset ( i4, pos );

      fprintf ( 1, '  %8d  %8d  %8d\n', pos, ivec(pos+1), j1 );

    end

  end

  return
end
