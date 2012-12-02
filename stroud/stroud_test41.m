function stroud_test41 ( )

%*****************************************************************************80
%
%% TEST41 tests TRIANGLE_UNIT_SET and TRIANGLE_SUB.
%
%  Discussion:
%
%    Break up the triangle into NSUB**2 equal subtriangles.  Approximate 
%    the integral over the triangle by the sum of the integrals over each
%    subtriangle.
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
  fprintf ( 1, 'TEST41\n' );
  fprintf ( 1, '  TRIANGLE_UNIT_SET sets up a quadrature rule\n' );
  fprintf ( 1, '    on a triangle.\n' );
  fprintf ( 1, '  TRIANGLE_SUB applies it to subtriangles of an\n' );
  fprintf ( 1, '    arbitrary triangle.\n' );
  fprintf ( 1, '\n' );
%
%  Set the location of the triangle.
%
  xval(1) = 0.0;
  yval(1) = 0.0;

  xval(2) = 0.0;
  yval(2) = 1.0;

  xval(3) = 1.0;
  yval(3) = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Triangle vertices:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %8f  %8f\n', xval(1), yval(1) );
  fprintf ( 1, '  %8f  %8f\n', xval(2), yval(2) );
  fprintf ( 1, '  %8f  %8f\n', xval(3), yval(3) );
%
%  Get the quadrature abscissas and weights for a unit triangle.
%
  rule = 3;
  order = triangle_unit_size ( rule );

  [ xtab, ytab, weight ] = triangle_unit_set ( rule, order );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using unit triangle quadrature rule %d\n', rule );
  fprintf ( 1, '  Rule order = %d\n', order );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Function Nsub  Result\n' );
  fprintf ( 1, '\n' );
%
%  Set the function.
%
  for i = 1 : num

    FUNC_2D_INDEX = i;
%
%  Try an increasing number of subdivisions.
%
    for nsub = 1 : 5

      result = triangle_sub ( ...
        'function_2d', xval, yval, nsub, order, xtab, ytab, weight );

      fname = function_2d_name ( i );

      fprintf ( 1, '  %s  %2d  %12f\n', fname, nsub, result );
 
    end
  
  end

  return
end
