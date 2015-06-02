function i4_lcm_test ( )

%*****************************************************************************80
%
%% I4_LCM_TEST tests I4_LCM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 7;

  i_test = [ 36, 49, 0, 12, 36, 1, 91 ];
  j_test = [ 30, -7, 71, 12, 49, 42, 28 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_LCM_TEST\n' );
  fprintf ( 1, '  I4_LCM computes the least common multiple.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J   I4_LCM\n' );
  fprintf ( 1, '\n' );
 
  for test = 1 : test_num
    i = i_test(test);
    j = j_test(test);
    fprintf ( 1, '  %6d  %6d  %6d\n', i, j, i4_lcm ( i, j ) );
  end

  return
end
