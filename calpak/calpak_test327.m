function calpak_test327 ( )

%*****************************************************************************80
%
%% CALPAK_TEST327 tests MONTH_CAL_STORE_COMMON.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST327\n' );
  fprintf ( 1, '  For the Common calendar:\n' );
  fprintf ( 1, '  MONTH_CAL_STORE_COMMON writes the day numbers for\n' );
  fprintf ( 1, '  a monthly calendar into a data structure.\n' );

  y = 1984;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Calendar:\n' );
  fprintf ( 1, '  Year = %d\n', y );

  for m = 1 : 12

    lines = month_cal_store_common ( y, m );
    [ r, ~ ] = size ( lines );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Month = %d\n', m );
    fprintf ( 1, '\n' );
    for i = 1 : r
      fprintf ( 1, '  %d    %s\n', i, lines(i,:) );
    end

  end

  return
end