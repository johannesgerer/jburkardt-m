function calpak_test615 ( )

%*****************************************************************************80
%
%% CALPAK_TEST615 tests YEAR_LENGTH_REPUBLICAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 April 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST615\n' );
  fprintf ( 1, '  For the Republican calendar:\n' );
  fprintf ( 1, '  YEAR_LENGTH_REPUBLICAN determines the length of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Length\n' );
  fprintf ( 1, '\n' );

  for y = 1 : 6
    sy = y_to_s_republican ( y );
    fprintf ( 1, '  %10s  %3d\n', sy, year_length_republican ( y ) );
  end

  return
end
