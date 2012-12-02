function chrpak_test001 ( )

%*****************************************************************************80
%
%% TEST001 tests A_TO_I4 and I4_TO_A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  A_TO_I4: Alphabetic character => I\n' );
  fprintf ( 1, '  I4_TO_A: I => Alphabetic character\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  1:26 = A:Z\n' );
  fprintf ( 1, '  27:52 = a:z\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I  ==>  A  ==>  I\n' );
  fprintf ( 1, '\n' );

  for i4 = 0 : 3 : 55
 
    a = i4_to_a ( i4 );
    j4 = a_to_i4 ( a );

    fprintf ( 1, '  %8d  "%c"  %8d\n', i4, a, j4 );
 
  end

  return
end
