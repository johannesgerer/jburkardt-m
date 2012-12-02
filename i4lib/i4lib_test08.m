function i4lib_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests I4_GCD.
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
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  I4_GCD computes the greatest common factor\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J   I4_GCD\n' );
  fprintf ( 1, '\n' );
 
  for test = 1 : test_num
    i = i_test(test);
    j = j_test(test);
    fprintf ( 1, '  %6d  %6d  %6d\n', i, j, i4_gcd ( i, j ) );
  end

  return
end
