function calpak_test616 ( )

%*****************************************************************************80
%
%% CALPAK_TEST616 tests YEAR_LENGTH_ROMAN.
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
  fprintf ( 1, 'CALPAK_TEST616\n' );
  fprintf ( 1, '  For the Roman calendar:\n' );
  fprintf ( 1, '  YEAR_LENGTH_ROMAN determines the length of a year.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Year  Length\n' );
  fprintf ( 1, '\n' );

  for y = 96 : 100
    sy = y_to_s_roman ( y );
    fprintf ( 1, '  %10s  %3d\n', sy, year_length_roman ( y ) );
  end

  return
end
