function chrpak_test005 ( )

%*****************************************************************************80
%
%% TEST005 tests BASE_TO_I4 and I4_TO_BASE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2007
%
%  Author:
%
%    John Burkardt
%
  test_num = 6;

  base_test = [ -1, 1, 2, 3, 4, 8 ];
  i4_test = [ 5, 5, 21, -243, 16, 15 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST005\n' );
  fprintf ( 1, '  BASE_TO_I4 converts an integer in some other\n' );
  fprintf ( 1, '    base into base 10.\n' );
  fprintf ( 1, '  I4_TO_BASE converts an integer base 10 to \n' );
  fprintf ( 1, '    its representation in another base;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  BASE, I, I4_TO_BASE(I), BASE_TO_I4(I4_TO_BASE(I))\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    i1 = i4_test(test);
    base = base_test(test);

    s = i4_to_base ( i1, base );
    i2 = base_to_i4 ( s, base );

    fprintf ( 1, '  %8d  %8d  %8s  %8d\n', base, i1, s, i2 );

  end

  return
end
