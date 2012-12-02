function chrpak_test1225 ( )

%*****************************************************************************80
%
%% TEST1225 tests S_S_SUBANAGRAM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 4;

  s1_test(1,1:13) = 'Get a priest!';
  s1_test(2,1:13) = 'Get a priest!';
  s1_test(3,1:13) = 'Get a priest!';
  s1_test(4,1:13) = 'Get a priest!';

  s2_test(1,1:6) = 'stripe';
  s2_test(2,1:6) = 'pastor';
  s2_test(3,1:6) = 'a sip ';
  s2_test(4,1:6) = 'tag!  ';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST1225\n' );
  fprintf ( 1, '  S_S_SUBANAGRAM is TRUE if S2 is a "subanagram"\n' );
  fprintf ( 1, '  of S1.\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    s1 = s1_test(test,1:13);
    s2 = s2_test(test,1:6);
    s2_length = s_len_trim ( s2 );

    value = s_s_subanagram ( s1, s2(1:s2_length) );

    fprintf ( 1, '  "%s"  "%s"  %d\n', s1, s2, value );

  end

  return
end
