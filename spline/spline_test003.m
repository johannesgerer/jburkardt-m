function spline_test003 ( )

%*****************************************************************************80
%
%% TEST003 tests R8VEC_BRACKET3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author
%
%    John Burkardt
%
  n = 10;
  ntest = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST003\n' );
  fprintf ( 1, '  R8VEC_BRACKET3 finds a pair of entries in a\n' );
  fprintf ( 1, '    sorted real array which bracket a value.\n' );

  xtest(1:6) = [ -10.0, 1.0, 4.5, 5.0, 10.0, 12.0 ];

  x = r8vec_indicator ( n );
  x(6) = x(5);

  r8vec_print ( n, x, '  Sorted array:' );

  left = floor ( ( n + 1 ) / 2 );

  for itest = 1 : ntest

    xval = xtest(itest);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Search for XVAL = %f\n', xval );

    fprintf ( 1, '  Starting guess for interval is = %d\n', left );

    left = r8vec_bracket3 ( n, x, xval, left );

    fprintf ( 1, '  Nearest interval:' );
    fprintf ( 1, '    X[%d]= %f\n', left, x(left) );
    fprintf ( 1, '    X[%d]= %f\n', left+1, x(left+1) );

  end

  return
end
