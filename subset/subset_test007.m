function subset_test007 ( )

%*****************************************************************************80
%
%% TEST007 tests CFRAC_TO_RAT, RAT_TO_CFRAC.
%
%  Discussion:
%
%    Compute the continued fraction form of 4096/15625.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
  m = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST007\n' );
  fprintf ( 1, '  RAT_TO_CFRAC fraction => continued fraction,\n' );
  fprintf ( 1, '  CFRAC_TO_RAT continued fraction => fraction.\n' );
  fprintf ( 1, '\n' );

  top = 4096;
  bot = 15625;

  fprintf ( 1, '  Regular fraction is %6d / %6d\n', top, bot );
 
  [ n, a ] = rat_to_cfrac ( top, bot );
 
  i4vec_print ( n, a, '  Continued fraction coefficients:' );

  [ p, q ] = cfrac_to_rat ( n, a );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The continued fraction convergents.\n' );
  fprintf ( 1, '  The last row contains the value of the continued\n' );
  fprintf ( 1, '  fraction, written as a common fraction.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I, P(I), Q(I), P(I)/Q(I)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %3d  %6d  %6d  %14f\n', i, p(i), q(i), p(i) / q(i) );
  end
 
  return
end
