function stroud_test35 ( )

%*****************************************************************************80
%
%% TEST35 tests SQUARE_UNIT_SET, RECTANGLE_SUB_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  global FUNC_2D_INDEX;

  num = function_2d_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST35\n' );
  fprintf ( 1, '  SQUARE_UNIT_SET sets up a quadrature rule\n' );
  fprintf ( 1, '    on a unit square.\n' );
  fprintf ( 1, '  RECTANGLE_SUB_2D applies it to subrectangles of an\n' );
  fprintf ( 1, '    arbitrary rectangle.\n' );
  fprintf ( 1, '\n' );
%
%  Set the location of the square.
%
  xval(1) = 1.0;
  yval(1) = 2.0;

  xval(2) = 3.0;
  yval(2) = 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The corners of the rectangle are:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f  %12f\n', xval(1), yval(1) );
  fprintf ( 1, '  %12f  %12f\n', xval(2), yval(2) );
%
%  Get the quadrature abscissas and weights for a unit square.
%
  rule = 2;

  order = square_unit_set ( rule );

  [ xtab, ytab, weight ] = square_unit_set ( rule, order );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using unit square integration rule number %d\n', rule );
%
%  Set the function.
%
  for i = 1 : num

    FUNC_2D_INDEX = i;
%
%  Try an increasing number of subdivisions.
%
    fprintf ( 1, '\n' );
    fprintf ( 1, '    Function  Subdivisions  Integral\n' );
    fprintf ( 1, '\n' );

    for j = 1 : 5

      nsub(1) = j;
      nsub(2) = 2 * j;

      result = rectangle_sub_2d ( 'function_2d', xval, yval, nsub, order, xtab, ...
        ytab, weight );

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s  %2d  %2d  %14f\n', fname, nsub(1), nsub(2), result );

    end

  end

  return
end
