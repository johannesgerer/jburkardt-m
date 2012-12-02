function subset_test018 ( )

%*****************************************************************************80
%
%% TEST018 tests CONGRUENCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
  test_num = 20;

  a_test = [
     1027,  1027,  1027,  1027, -1027, ...
    -1027, -1027, -1027,     6,     0, ...
        0,     0,     1,     1,     1, ...
     1024,     0,     0,     5,     2 ];
  b_test = [
      712,   712,  -712,  -712,   712, ...
      712,  -712,  -712,     8,     0, ...
        1,     1,     0,     0,     1, ...
   -15625,     0,     3,     0,     4 ];
  c_test = [
        7,    -7,     7,    -7,     7, ...
       -7,     7,    -7,    50,     0, ...
        0,     1,     0,     1,     0, ...
    11529,     1,    11,    19,     7 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST018\n' );
  fprintf ( 1, '  CONGRUENCE solves a congruence equation:\n' );
  fprintf ( 1, '    A * X = C mod ( B )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I        A         B         C         X     Mod ( A*X-C,B)\n' );
  fprintf ( 1, '\n' );

  for test_i = 1 : test_num

    a = a_test(test_i);
    b = b_test(test_i);
    c = c_test(test_i);

    [ x, ierror ] = congruence ( a, b, c );

    if ( b ~= 0 )
      result = i4_modp ( a * x - c, b );
    else
      result = 0;
    end

    fprintf ( 1, '  %2d  %8d  %8d  %8d  %8d  %8d\n', test_i, a, b, c, x, result );

  end

  return
end
