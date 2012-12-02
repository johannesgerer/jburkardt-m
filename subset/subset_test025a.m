function subset_test025a ( )

%*****************************************************************************80
%
%% TEST025a tests DIOPHANTINE.
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
  test_num = 20;

  a_test = [ ...
     1027,  1027,  1027, 1027, -1027,  -1027, -1027, -1027,    6,   0, ...
        0,     0,     1,    1,     1,   1024,     0,     0,    5,   2 ];
  b_test = [ ...
       712,   712, -712, -712,   712,    712,  -712,  -712,    8,   0, ...
         1,     1,    0,    0,     1, -15625,     0,     3,    0,   4 ];
  c_test = [ ...
         7,    -7,    7,   -7,     7,     -7,     7,    -7,   50,   0, ...
         0,     1,    0,    1,     0,  11529,     1,    11,   19,   7 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST025a\n' );
  fprintf ( 1, '  DIOPHANTINE solves a Diophantine equation:\n' );
  fprintf ( 1, '    A * X + B * Y = C\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        A         B         C         X     Y     Error\n' );
  fprintf ( 1, '\n' );

  for test_i = 1 : test_num

    a = a_test(test_i);
    b = b_test(test_i);
    c = c_test(test_i);

    [ x, y, ierror ] = diophantine ( a, b, c );

    if ( ierror ~= 0 )
      fprintf ( 1, '  %8d  %8d  %8d  Error code = %d\n', a, b, c, ierror );
    else
      error = a * x + b * y - c;
      fprintf ( 1, '  %8d  %8d  %8d  %8d  %8d  %8d\n', a, b, c, x, y, error );
    end

  end

  return
end
