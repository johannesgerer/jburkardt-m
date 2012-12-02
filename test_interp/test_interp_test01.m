function test_interp_test01 ( )

%*****************************************************************************80
%
%% TEST_INTERP_TEST01 shows how P00_STORY can be called.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_TEST01\n' );
  fprintf ( 1, '  P00_STORY prints the problem "story".\n' );

  prob_num = p00_prob_num ( );

  for prob = 1 : prob_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', prob );

    p00_story ( prob );

  end

  return
end
