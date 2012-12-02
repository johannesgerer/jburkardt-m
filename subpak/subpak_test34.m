function subpak_test34 ( )

%*****************************************************************************80
%
%% TEST34 tests UPC_CHECK_DIGIT.
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

  l_test = [ 72890, 12345 ];
  p_test = [ 0, 0 ];
  r_test = [ 00011, 67890 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST34\n' );
  fprintf ( 1, '  UPC_CHECK_DIGIT determines the check digit for a UPC.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  P-LLLLL-RRRRR-C\n' );
  fprintf ( 1, '\n' );

  for test = 1 : test_num

    p = p_test(test);
    l = l_test(test);
    r = r_test(test);

    c = upc_check_digit ( p, l, r );

    fprintf ( 1, '  %d-%05d-%05d-%05d\n', p, l, r, c );

  end

  return
end
