function complete_symmetric_poly_test ( )

%*****************************************************************************80
%
%% COMPLETE_SYMMETRIC_POLY_TEST tests COMPLETE_SYMMETRIC_POLY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPLETE_SYMMETRIC_POLY_TEST\n' );
  fprintf ( 1, '  COMPLETE_SYMMETRIC_POLY evaluates a complete symmetric.\n' );
  fprintf ( 1, '  polynomial in a given set of variables X.\n' );
 
  n = 5;
  x = [ 1.0, 2.0, 3.0, 4.0, 5.0 ];
  r8vec_print ( n, x, '  Variable vector X:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   N\\R     0       1       2       3       4       5\n' );
  fprintf ( 1, '\n' );

  for nn = 0 : n
    fprintf ( 1, '  %2d', nn );
    for rr = 0 : 5
      value = complete_symmetric_poly ( nn, rr, x );
      fprintf ( 1, '  %6d', value );
    end
    fprintf ( 1, '\n' );
  end

  return
end
