function subset_test149 ( )

%*****************************************************************************80
%
%% TEST149 tests THUE_TERNARY_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST149\n' );
  fprintf ( 1, '  THUE_TERNARY_NEXT returns the next \n' );
  fprintf ( 1, '  Thue ternary sequence.\n' );
  fprintf ( 1, '\n' );

  n = 1;
  thue(1) = 1;
  fprintf ( 1, '  %2d  ', n );
  for i = 1 : n
    fprintf ( 1, '%1d', thue(i) );
  end
  fprintf ( 1, '\n' );

  for i = 1 : 5
    [ n, thue ] = thue_ternary_next ( n, thue );
    fprintf ( 1, '  %2d  ', n );
    for i = 1 : n
      fprintf ( 1, '%1d', thue(i) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
