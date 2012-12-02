function i4lib_test83 ( )

%*****************************************************************************80
%
%% I4LIB_TEST83 tests I4VEC_SORTED_UNDEX.
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
  fprintf ( 1, 'I4LIB_TEST83\n' );
  fprintf ( 1, '  I4VEC_SORTED_UNDEX produces index vectors which create a sorted\n' );
  fprintf ( 1, '  list of the unique elements of a sorted I4VEC, \n' );
  fprintf ( 1, '  and a map from the original vector to the (implicit) \n' );
  fprintf ( 1, '  vector of sorted unique elements.\n' );

  x_num = 9;
  x_val = [ 11, 11, 11, 22, 22, 33, 33, 55, 55 ];

  i4vec_print ( x_num, x_val, '  The vector X:' );

  x_unique_num = i4vec_sorted_unique_count ( x_num, x_val );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of unique entries in X is %d\n', x_unique_num );

  [ undx, xdnu ] = i4vec_sorted_undex ( x_num, x_val, x_unique_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  UNDX can be used to list the unique elements of X\n' );
  fprintf ( 1, '  in sorted order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I  UNDX   X(UNDX)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : x_unique_num
    fprintf ( 1, '  %4d  %4d  %8d\n', i, undx(i), x_val(undx(i)) );
  end

  xu_val(1:x_unique_num) = x_val(undx(1:x_unique_num));

  fprintf ( 1, '\n' );
  fprintf ( 1, '  UNDX can be used to created XU, a copy of X\n' );
  fprintf ( 1, '  containing only the unique elements, in sorted order.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I  UNDX XU(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : x_unique_num
    fprintf ( 1, '  %4d  %4d  %4d\n', i, undx(i), xu_val(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  XDNU can be used to match each element of X with one of the\n' );
  fprintf ( 1, '  unique elements\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I  XDNU  X(I)   XU(XDNU(I))\n' );
  fprintf ( 1, '\n' );

  for i = 1 : x_num
    fprintf ( 1, '  %4d  %4d  %4d  %12d\n', i, xdnu(i), x_val(i), xu_val(xdnu(i)) );
  end

  return
end
