function mono_print_test ( )

%*****************************************************************************80
%
%% MONO_PRINT_TEST tests MONO_PRINT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 November 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONO_PRINT_TEST\n' );
  fprintf ( 1, '  MONO_PRINT can print out a monomial.\n' );
  fprintf ( 1, '\n' );

  m = 1;
  f = [ 5 ];
  mono_print ( m, f, '  Monomial [5]:' );

  m = 1;
  f = [ -5 ];
  mono_print ( m, f, '  Monomial [5]:' );

  m = 4;
  f = [ 2, 1, 0, 3 ];
  mono_print ( m, f, '  Monomial [2,1,0,3]:' );

  m = 3;
  f = [ 17, -3, 199 ];
  mono_print ( m, f, '  Monomial [17,-3,199]:' );

  return
end
