function geometry_test0415 ( )

%*****************************************************************************80
%
%% TEST0415 tests LINES_IMP_INT_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0415\n' );
  fprintf ( 1, '  LINES_IMP_INT_2D finds the intersection of\n' );
  fprintf ( 1, '  two lines written in implicit form.\n' );
  fprintf ( 1, '\n' );
%
%  x + 2y - 4 = 0
%
  a1 =  1.0;
  b1 =  2.0;
  c1 = -4.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line 1 coefficients:  %8f  %8f  %8f\n', a1, b1, c1 );
%
%  x - y - 1 = 0
%
  a2 =  1.0;
  b2 = -1.0;
  c2 = -1.0;
  fprintf ( 1, '  Line 2 coefficients:  %8f  %8f  %8f\n', a2, b2, c2 );

  [ ival, p ] = lines_imp_int_2d ( a1, b1, c1, a2, b2, c2 );

  if ( ival == 1 )
    fprintf ( 1, '  Intersection at %8f  %8f\n', p(1:dim_num) )
  elseif ( ival == 0 )
    fprintf ( 1, '  Lines are parallel, no intersection.\n' );
  elseif ( ival == 2 )
    fprintf ( 1, '  Lines are coincident.\n' );
  else
    fprintf ( 1, '  Unknown return value of ival = %d\n', ival );
  end
%
%  2x + 4y - 1 = 0
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line 1 coefficients:  %8f  %8f  %8f\n', a1, b1, c1 );

  a2 =  2.0;
  b2 = +4.0;
  c2 = -1.0;
  fprintf ( 1, '  Line 2 coefficients:  %8f  %8f  %8f\n', a2, b2, c2 );

  [ ival, p ] = lines_imp_int_2d (a1, b1, c1, a2, b2, c2 );

  if ( ival == 1 )
    fprintf ( 1, '  Intersection at %8f  %8f\n', p(1:dim_num) );
  elseif ( ival == 0 )
    fprintf ( 1, '  Lines are parallel, no intersection.\n' );
  elseif ( ival == 2 )
    fprintf ( 1, '  Lines are coincident.\n' );
  else
    fprintf ( 1, '  Unknown return value of ival = %d\n', ival );
  end
%
%  -3x - 6y +12 = 0
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Line 1 coefficients:  %8f  %8f  %8f\n', a1, b1, c1 );

  a2 =  -3.0;
  b2 =  -6.0;
  c2 = +12.0;
  fprintf ( 1, '  Line 2 coefficients:  %8f  %8f  %8f\n', a2, b2, c2 );
 
  [ ival, p ] = lines_imp_int_2d  ( a1, b1, c1, a2, b2, c2 );

  if ( ival == 1 )
    fprintf ( 1, '  Intersection at %8f  %8f\n', p(1:dim_num) );
  elseif ( ival == 0 )
    fprintf ( 1, '  Lines are parallel, no intersection.\n' );
  elseif ( ival == 2 )
    fprintf ( 1, '  Lines are coincident.\n' );
  else
    fprintf ( 1, '  Unknown return value of ival = %d\n', ival );
  end

  return
end
