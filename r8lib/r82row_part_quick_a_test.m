function r82row_part_quick_a_test ( )

%*****************************************************************************80
%
%% R82ROW_PART_QUICK_A_TEST tests R82ROW_PART_QUICK_A.
%
%  Discussion:
%
%    An R82ROW is a (2,N) array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 12;
  b = 0.0;
  c = 10.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R82ROW_PART_QUICK_A_TEST\n' );
  fprintf ( 1, '  R82ROW_PART_QUICK_A reorders an R82ROW\n' );
  fprintf ( 1, '  as part of a quick sort.\n' );
  fprintf ( 1, '  Using initial random number seed = ', seed );

  [ a, seed ] = r8mat_uniform_ab ( 2, n, b, c, seed );
 
  r82row_print ( n, a, '  Before rearrangement:' );

  [ a, l, r ] = r82row_part_quick_a ( n, a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rearranged array\n' );
  fprintf ( 1, '  Left index =  %d\n', l );
  fprintf ( 1, '  Key index =   %d\n', l+1 );
  fprintf ( 1, '  Right index = %d\n', r );
  fprintf ( 1, '\n' );

  r82row_print ( l,     a(1:2,1:l),   '  Left half:' );
  r82row_print ( 1,     a(1:2,l+1),   '  Key:' );
  r82row_print ( n-l-1, a(1:2,l+2:n), '  Right half:' );

  return
end
