function r8lib_test1505 ( )

%*****************************************************************************80
%
%% R8LIB_TEST1505 tests R8VEC_UNDEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8LIB_TEST1505\n' );
  fprintf ( 1, '  R8VEC_UNDEX produces index vectors which create a sorted\n' );
  fprintf ( 1, '  list of the unique elements of an (unsorted) R8VEC, \n' );
  fprintf ( 1, '  and a map from the original vector to the (implicit) \n' );
  fprintf ( 1, '  vector of sorted unique elements.\n' );

  x_num = 9;
  x_val = [ 33.0, 55.0, 11.0, 11.0, 55.0, 33.0, 22.0, 22.0, 11.0 ];

  r8vec_print ( x_num, x_val, '  The vector X:' );

  tol = r8_epsilon ( );
  x_unique_num = r8vec_unique_count ( x_num, x_val, tol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Tolerance for equality is %e\n', tol );
  fprintf ( 1, '  Number of unique entries in X is %d\n', x_unique_num );

  [ undx, xdnu ] = r8vec_undex ( x_num, x_val, x_unique_num, tol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  UNDX can be used to list the unique elements of X\n' );
  fprintf ( 1, '  in sorted order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I  UNDX   X(UNDX)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : x_unique_num
    fprintf ( 1, '  %4d  %4d  %8f\n', i, undx(i), x_val(undx(i)) );
  end

  xu_val(1:x_unique_num) = x_val(undx(1:x_unique_num));

  fprintf ( 1, '\n' );
  fprintf ( 1, '  UNDX can be used to created XU, a copy of X\n' );
  fprintf ( 1, '  containing only the unique elements, in sorted order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I  UNDX     XU(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : x_unique_num
    fprintf ( 1, '  %4d  %4d  %8f\n', i, undx(i), xu_val(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XDNU can be used to match each element of X with one of the\n' );
  fprintf ( 1, '  unique elements\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I  XDNU    X(I)       XU(XDNU(I))\n' );
  fprintf ( 1, '\n' );

  for i = 1 : x_num
    fprintf ( 1, '  %4d  %4d  %8f  %12f\n', i, xdnu(i), x_val(i), xu_val(xdnu(i)) );
  end

  return
end
