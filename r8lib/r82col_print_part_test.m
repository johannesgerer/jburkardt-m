function r82col_print_part_test ( )

%*****************************************************************************80
%
%% R82COL_PRINT_PART_TEST tests R82COL_PRINT_PART.
%
%  Discussion:
%
%    An R82COL is an (N,2) array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2015
%
%  Author:
%
%    John Burkardt
%
  n = 10;
%
%  Set up the array by rows.
%
  v = [ ...
    11.0,  12.0; ...
    21.0,  22.0; ...
    31.0,  32.0; ...
    41.0,  42.0; ...
    51.0,  52.0; ...
    61.0,  62.0; ...
    71.0,  72.0; ...
    81.0,  82.0; ...
    91.0,  92.0; ...
   101.0, 102.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R82COL_PRINT_PART_TEST\n' );
  fprintf ( 1, '  R82COL_PRINT_PART prints part of an R82COL.\n' );

  max_print = 2;
  r82col_print_part ( n, v, max_print, '  Output with MAX_PRINT = 2' );

  max_print = 5;
  r82col_print_part ( n, v, max_print, '  Output with MAX_PRINT = 5' );

  max_print = 25;
  r82col_print_part ( n, v, max_print, '  Output with MAX_PRINT = 25' );

  return
end
